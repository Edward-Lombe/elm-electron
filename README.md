
# elm-electron

Elm + electron

I guess this is trying to be an example/showcase of some ways that you could
implement/develop/maintain a project using Elm and the JavaScript eco-system
within a more real world context. Going further than just a 'ToDo' app and
showing how to do things like communicate with a server, structure a large
codebase of UI and server/buisiness logic.

It is very early days. Things are going to change a lot, because this is
essentially my scratch pad for trying to learn Elm within a familiar context.

## install

The install is pretty textbook

- Clone, navigate to repository
- `npm install` then `npm start`

If you want 'hot reloading' (the whole app restarts) you can run `npm run watch`
which uses nodemon to watch the source directory for changes.

## structure

[//]: # (START_FILE_STRUCTURE)

```plaintext
./source
|-- client
|   |-- elm
|   |   |-- ElmArchitecture
|   |   |   |-- Button.elm
|   |   |   |-- Clock.elm
|   |   |   |-- Field.elm
|   |   |   |-- Form.elm
|   |   |   |-- Http.elm
|   |   |   |-- Random.elm
|   |   |   `-- Websockets.elm
|   |   |-- Main.elm
|   |   |-- Messages.elm
|   |   |-- Models.elm
|   |   |-- Pages.elm
|   |   |-- Routes.elm
|   |   |-- SaleNote.elm
|   |   |-- Subscriptions.elm
|   |   |-- TestWebSocket.elm
|   |   |-- Updates.elm
|   |   |-- Utilities
|   |   |   `-- Layout.elm
|   |   `-- Views.elm
|   |-- elm.js
|   |-- main.ts
|   |-- react-components
|   |   `-- html-page.tsx
|   `-- webpack.config.ts
|-- scripts
|   |-- electron.ts
|   |-- elm-make.ts
|   |-- maybe-format.ts
|   |-- timestamp
|   |-- update-README.ts
|   `-- utilities.ts
`-- server
|-- main.ts
|-- server.ts
`-- websocket.ts

7 directories, 31 files
```

[//]: # (END_FILE_STRUCTURE)

Entry path is more or less as follows,

- `source/scripts/electron.ts`

This is a script (written in TypeScript) that uses the `spawn` function from
`child_process` and the path to the `electron-prebuilt` executable to run
electron on the source root (/.../elm-electron).

- `index.js`

This file is referenced as the main file in the `package.json` and is used to
initiate `ts-node` on the root folder. This then means we can just import
TypeScript files with no need to compile them before hand. Because I'm lazy :)

- `source/server/main.ts`

This is the file that imports the `electron` library, which is then used to
create a new instance of `BrowserWindow`, start the HTTP server and point the
page to `localhost:3000`.

- `source/server/server.ts`

This file starts a local HTTP server, and renders a static react component that
is the wrapper HTML to run the file produced by webpack.

- `source/client/react-components/html.tsx`

This file is simply some boilerplate for the index file that is served. We set
the appropriate title and meta tags, load style sheets, declare a root element,
and load the webpack bundle under `distribution/main.js`

- `source/client/main.ts`

This file is the untranspiled source for the `distribution/main.js` file above.
It uses the `react-elm-components` to load our Elm source code into a React
element and mount it to out root element. It's a little bit of overkill
considering that Elm can mount its self to the DOM without React, but it is
interesting none the less.

- `source/client/elm.js`

This file is produced by `source\scripts\elm-make.ts` and is a Javascript bundle
of the entire Elm side of the application, the entry point of which is
`source/client/elm/Main.elm`

- `source/client\elm\Main.elm`

We finally made it to our actual Elm code, it only took half a dozen files :)

## things to do

- Finish the source path
- Set up [plop](https://github.com/amwmedia/plop) generators for adding a page,
  path, route, whatever, etc
- Implement a sane extentable (real world) example of a SPA architexture using Elm
- Set up a websocket connection between the Elm page and the main electron process
- Set up an example of ports being used through the `react-elm-components` library
- Create documentation for the [TypeScript](http://typedoc.io) and
  [Elm](http://package.elm-lang.org/help/documentation-format) sections of the
  code
- Turn this repository into a module that can then be used as a starting point for
  other projects
- Create a CLI that can be used in addition to this being a `require`-able library
- WebGL example page
- Example using native Elm DOM mounting instead of React