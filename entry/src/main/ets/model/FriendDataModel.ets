import { PinYinUtil } from '../utils/pinyinUtil'

export interface Friend {
	id: number,
	name: string,
	avatar: string,
	index: string
}

export function getFriendData(): Array<Friend> {

	let friendData: Array<Friend> = [
		{
			avatar: "http://112.74.183.138:8889/imgs/06.jpg",
			id: 100304,
			name: "a抖娘利世",
			index: ''
		},
		{
			avatar:
			"http://112.74.183.138:8889/imgs/07.jpg",
			id: 99947,
			name: "a唐宁宁",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/08.jpg"
		,
			id
			:
			99888
		,
			name
			:
			"A沈青黛",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/09.jpg"
		,
			id
			:
			98203
		,
			name
			:
			"bEvelyn艾莉",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/10.jpg"
		,
			id
			:
			99829
		,
			name
			:
			"朱可儿",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/06.jpg"
		,
			id
			:
			100304
		,
			name
			:
			"b抖娘利世",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/07.jpg"
		,
			id
			:
			99947
		,
			name
			:
			"唐宁宁",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/08.jpg"
		,
			id
			:
			99888
		,
			name
			:
			"z沈青黛",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/09.jpg"
		,
			id
			:
			98203
		,
			name
			:
			"yEvelyn艾莉",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/10.jpg"
		,
			id
			:
			99829
		,
			name
			:
			"y朱可儿",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/06.jpg"
		,
			id
			:
			100304
		,
			name
			:
			"y抖娘利世",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/07.jpg"
		,
			id
			:
			99947
		,
			name
			:
			"l唐宁宁",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/08.jpg"
		,
			id
			:
			99888
		,
			name
			:
			"k沈青黛",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/09.jpg"
		,
			id
			:
			98203
		,
			name
			:
			"Evelyn艾莉",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/10.jpg"
		,
			id
			:
			99829
		,
			name
			:
			"朱可儿",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/06.jpg"
		,
			id
			:
			100304
		,
			name
			:
			"抖娘利世",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/07.jpg"
		,
			id
			:
			99947
		,
			name
			:
			"唐宁宁",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/08.jpg"
		,
			id
			:
			99888
		,
			name
			:
			"沈青黛",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/09.jpg"
		,
			id
			:
			98203
		,
			name
			:
			"Evelyn艾莉",
			index: ''
		}
		,
		{
			avatar:
			"http://112.74.183.138:8889/imgs/10.jpg"
		,
			id
			:
			99829
		,
			name
			:
			"朱可儿",
			index: ''
		}

	]


	let pinYinUtil = new PinYinUtil()

	for (let i = 0; i < friendData.length; i++) {

		let element = friendData[i];
		element.index = pinYinUtil.getFirstLetter(element.name);
	}

	friendData.sort((a, b) => a.index.localeCompare(b.index));

	return friendData;
}

export function getMapAlphabetsIndex(): Map<string, number> {
	let list = getFriendList()
	let mapAlphabetsIndex: Map<string, number> = new Map()
	for (let i = 0; i < list.length; i++) {
		let element = list[i];
		if (i == 0) {
			mapAlphabetsIndex.set(element.name, i);
		} else {
			if (element.name != list[i-1].name) {
				mapAlphabetsIndex.set(element.name, i);
			}
		}
	}
	return mapAlphabetsIndex;
}

export function getFriendList(): Array<Friend> {
	let list = getFriendData();
	let pinYinUtil = new PinYinUtil();
	for (let i = 0; i < list.length; i++) {
		let element = list[i];
		element.name = pinYinUtil.getFirstLetter(element.name)
	}
	list.sort((a, b) => a.name.localeCompare(b.name))
	return list
}
