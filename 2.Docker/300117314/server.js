'use strict';

const express = require('express');
const fs = require('fs');

const myLogFileStream = fs.createWriteStream('/var/log/app.log');
const myConsole = new console.Console(myLogFileStream, myLogFileStream);

// Constants
const serverHost = '8000';
const serverPort = 80;

// Express app
const app = express();
app.get('/', (req, res) => {
  res.send('Hello Word\n');
});

app.listen(serverPort);
myConsole.log(`Running on http://${serverHost}:${serverPort}`);
