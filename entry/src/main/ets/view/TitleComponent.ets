@Component
export struct TitleComponent {
	private titleText: ResourceStr = ""

	build() {
		RelativeContainer() {
			Text(this.titleText)
				.id("text1")
				.fontSize(40)
				.textAlign(TextAlign.Center)
				.alignRules({
					middle: {
						anchor: "__container__",
						align: HorizontalAlign.Center,
					},
					center: {
						anchor: "__container__",
						align: VerticalAlign.Center,
					}
				})

			Image($r("app.media.seek"))
				.id("image1")
				.width(40)
				.height(40)
				.margin({ right: 6 })
				.alignRules({
					top: {
						anchor: "image2",
						align: VerticalAlign.Top,
					},
					right: {
						anchor: "image2",
						align: HorizontalAlign.Start,
					},
				})

			Image($r("app.media.add"))
				.id("image2")
				.width(40)
				.height(40)
				.alignRules({
					right: {
						anchor: "__container__",
						align: HorizontalAlign.End
					},
					center: {
						anchor: "__container__",
						align: VerticalAlign.Center,
					},
				})
		}.width("100%").height("100%").padding(10).backgroundColor(Color.Gray)
	}
}