const multer = require('multer');

// Multer setup for in-memory file storage
const storage = multer.memoryStorage();
const upload = multer({ storage }).array('images');

module.exports = upload;
