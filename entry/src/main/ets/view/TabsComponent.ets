import { FriendListComponent } from './FriendListComponent'
import { TitleComponent } from './TitleComponent'

@Component
export struct TabsComponent {
	private tabController = new TabsController()
	@State currentIndex: number = 0

	@Builder
	TabBarBuilder(title: string, targetIndex: number, unselectedImage: Resource, selectedImage: Resource) {
		Column() {
			Image(this.currentIndex == targetIndex ? selectedImage : unselectedImage)
				.width(30).height(30)
			Text(title).fontColor(this.currentIndex == targetIndex ? Color.Green : Color.Black)
				.padding({ top: 2 })
		}.width("100%")
		.height(50).justifyContent(FlexAlign.Center)
		.onClick(() => {
			this.currentIndex = targetIndex;
			this.tabController.changeIndex(targetIndex);
		})

	}

	build() {
		Column() {
			Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
				TabContent() {
					Column() {
						TitleComponent({}).height(80)
						Text("微信").fontSize(60)
					}.justifyContent(FlexAlign.Start).height("100%")

				}
				.backgroundColor(0XEDEDED)
				.tabBar(this.TabBarBuilder("微信", 0, $rawfile("tabs_image/13.png"), $rawfile("tabs_image/12.png")))

				TabContent() {
					Column() {
						TitleComponent({ titleText: "通讯录" }).height(80)
						FriendListComponent()
					}

				}
				.backgroundColor(0XEDEDED)
				.tabBar(this.TabBarBuilder("通讯录", 1, $rawfile("tabs_image/15.png"), $rawfile("tabs_image/14.png")))

				TabContent() {
					Column() {
						TitleComponent({ titleText: "发现" }).height(80)
						Text("发现").fontSize(80)
					}.justifyContent(FlexAlign.Start).height("100%")
				}
				.backgroundColor(0XEDEDED)
				.tabBar(this.TabBarBuilder("发现", 2, $rawfile("tabs_image/16.png"), $rawfile("tabs_image/17.png")))

				TabContent() {
					Text("我的页面").fontSize(60)
				}.backgroundColor(0XEDEDEd)
				.tabBar(this.TabBarBuilder("我的", 3, $rawfile("tabs_image/18.png"), $rawfile("tabs_image/19.png")))
			}
			.scrollable(true)
			.animationDuration(300)
			.layoutWeight(1)
		}
	}
}