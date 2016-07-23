// Generated by typings
// Source: https://raw.githubusercontent.com/DefinitelyTyped/DefinitelyTyped/56295f5058cac7ae458540423c50ac2dcf9fc711/elm/elm.d.ts
declare var Elm: Elm;

interface Elm {
	embed<P>(elmModule: ElmModule<P>, element: Node, initialValues?: Object): ElmComponent<P>;
	fullscreen<P>(elmModule: ElmModule<P>, initialValues?: Object): ElmComponent<P>;
	worker<P>(elmModule: ElmModule<P>, initialValues?: Object): ElmComponent<P>;
}

interface ElmModule<P> {
}

interface ElmComponent<P> {
	ports: P;
}

interface PortToElm<V> {
	send(value: V): void;
}

interface PortFromElm<V> {
	subscribe(handler: (value: V) => void): void;
	unsubscribe(handler: (value: V) => void): void;
}