import { TabsComponent } from '../view/TabsComponent';

@Entry
@Component
struct Index {
	@State message: string = 'Hello World';

	build() {
		Column() {
			TabsComponent()
		}
	}
}