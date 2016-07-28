
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

```text
source
├── client
│   ├── react-components
│   │   └── html-page.tsx
│   ├── elm
│   │   ├── Main.elm
│   │   ├── Model.elm
│   │   ├── Pages
│   │   │   ├── Button.elm
│   │   │   └── Field.elm
│   │   ├── Update.elm
│   │   ├── Utilities
│   │   │   └── Layout.elm
│   │   └── View.elm
│   ├── elm.js
│   ├── main.ts
│   └── webpack.config.ts
├── scripts
│   ├── electron.ts
│   └── elm-make.ts
└── server
    ├── main.ts
    └── server.ts
```

Entry path is more or less as follows,

- `source/scripts/electron.ts`

This is a script (written in TypeScript) that uses the `spawn` function from
`child_process` and the path to the `electron-prebuilt` executable to run
electron on the root.

- `index.js`

This file is referenced as the main file in the `package.json` and is used to
initiate `ts-node` on the root folder. This then means we can just import
TypeScript files with no need to compile them before hand. Because I'm lazy :)

- `source/server/main.ts`

This is the file that imports the `electron` object, which is then used to create
a new instance of `BrowserWindow`, start the HTTP server and point the page to
`localhost:3000`.


## things to do

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
