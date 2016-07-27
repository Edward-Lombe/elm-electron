'use strict'

import * as React from 'react'

export default class extends React.Component<{}, {}> {

  render() {
    return (
      <html lang='en'>
        <head>
          <meta charSet='utf8'/>
          <meta
            httpEquiv='X-UA-Compatible'
            content='IE=edge'/>
          <meta
            name='viewport'
            content='width=device-width, initial-scale=1'/>
          <title>Elm Electron</title>
          <link
            href='node_modules/bootstrap/dist/css/bootstrap.min.css'
            rel='stylesheet'/>
        </head>
        <body>
          <div id='root'></div>
          <script src='distribution/main.js'></script>
        </body>
      </html>
    )
  }

}
