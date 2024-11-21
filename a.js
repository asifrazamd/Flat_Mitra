const moment = require('moment');
console.log("Date",Date.now());

// Get current epoch time in seconds
const currentTimeInSeconds = Math.floor(Date.now() / 1000);
console.log(currentTimeInSeconds);

// Convert epoch time to JavaScript Date object
const currentDate = new Date(currentTimeInSeconds * 1000);
console.log(currentDate.toISOString());

// Convert epoch time to Moment.js object
const currentMoment = moment.unix(currentTimeInSeconds);
console.log(currentMoment.format());


const currentTimeInMilliseconds = Date.now();
const currentDateWithMilliseconds = new Date(Date.now());
console.log("universal",currentDateWithMilliseconds.toISOString());

//const currentMomentWithMilliseconds = moment(currentTimeInMilliseconds.format("YYYY-MM-DD HH:mm:ss.SSSZ"));
//console.log("m3",(currentMomentWithMilliseconds));
//console.log("Indian",currentMomentWithMilliseconds.format("YYYY-MM-DD HH:mm:ss.SSSZ"));


const timestamp = Date.now(); // Unique timestamp for better organization
  const currentMomentWithMilliseconds1 = moment(timestamp);
  const a1=currentMomentWithMilliseconds1.format("YYYY-MM-DD HH:mm:ss.SSSZ");
 console.log("a1",a1);
