
# elm-electron

Elm + electron

## install

The install is pretty textbook

- Clone, navigate to repository
- `npm install` then `npm start`

If you want 'hot reloading' (the whole app restarts) you can run `npm run watch`
which uses nodemon to watch the source directory for changes

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

Entry path is more or less as follows

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
`localhost:3000`


## stack
