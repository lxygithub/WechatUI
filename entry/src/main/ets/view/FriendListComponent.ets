import { Friend, getFriendData, getMapAlphabetsIndex } from '../model/FriendDataModel'

@Component
export struct FriendListComponent {
	private alphabets: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
	private scroller = new Scroller()
	private friendData = getFriendData()
	private mapAlphabetsIndex = getMapAlphabetsIndex()
	@State private selectIndex: number = 0
	@State private popupY: number = 0

	build() {
		Stack({ alignContent: Alignment.End }) {
			Column() {
				List({ scroller: this.scroller }) {
					ForEach(this.friendData, (friend: Friend) => {
						ListItem() {
							Column() {
								Row() {
									Image(friend.avatar)
										.alt($r("app.media.icon"))
										.width(40).height(40)
									Text(friend.name)
										.fontSize(35).margin({ left: 10 })
								}.margin({ left: 30 })

								Divider().height(3).color(Color.Red)
							}.alignItems(HorizontalAlign.Start)
						}
					})

				}.backgroundColor(Color.White)
				.onScrollIndex((start, _) => {
					const element = this.friendData[start];
					this.selectIndex = this.alphabets.indexOf(element.name)
				}).width("100%")
				.height("100%")
			}

			AlphabetIndexer({ arrayValue: this.alphabets, selected: this.selectIndex })
				.alignStyle(IndexerAlign.Left)
				.usingPopup(true)
				.popupPosition({ x: 30, y: this.popupY })
				.popupColor(Color.Red)
				.popupBackground("#ff58a3b0")
				.selectedColor("#ff0000")
				.selectedBackgroundColor("#58b061")
				.itemSize(20)
				.alignStyle(IndexerAlign.Right)
				.margin({ right: 10 })
				.onSelect((index: number) => {
					const alphabet = this.alphabets[index];
					const selectedIndex = this.mapAlphabetsIndex.get(alphabet);
					this.scroller.scrollToIndex(selectedIndex);
					this.popupY = 20 * index - 15;
				})

		}.width("100%")
		.height("100%")
	}
}