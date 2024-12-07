const express = require('express');
const multer = require('multer');
const { createProperty, getProperties, getAllProperties} = require('../controllers/propertyController');

const router = express.Router();

const storage = multer.memoryStorage();
//console.log(storage);
const upload = multer({ storage });
//console.log(upload);

 router.post(
  '/upload-property',
   upload.array('images'),createProperty);
router.get('/properties1', getAllProperties); // Fetch properties

router.get('/properties', getProperties); // Fetch properties



// Set up DELETE route to delete property
//router.delete('/properties/:id', deleteProperty);  // Make sure the `id` is used correctly

// Set up the PUT route for updating the property
//router.put('/properties/:property_id', updateProperty); // Update route



module.exports = router;
