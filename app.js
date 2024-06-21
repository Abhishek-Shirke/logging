const express = require('express');
const nodemon = require('nodemon');
const winston = require('winston');


const app = express();
 
const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    transports: [new winston.transports.File({filename: "logging.log"})]
});

// logger.error("This is an error"); 

app.get('/', (req, res)=>{
    logger.info("This API prints Hello World"); 
    res.send("Hello World");
});
   


app.listen(3890, ()=>{
    console.log("App is running");
});