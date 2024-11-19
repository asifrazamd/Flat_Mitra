const express = require('express');
const multer = require('multer');
const { createProperty, getproperties, deleteproperty,updateproperty } = require('../controllers/propertyController');
//const { validateProperty } = require('../models/propertyValidator');

const router = express.Router();

const storage = multer.memoryStorage();
console.log(storage);
const upload = multer({ storage });
console.log(upload);

router.post(
  '/upload-property',
  upload.array('images'),createProperty);
// Get Properties Route (all or specific by ID)
router.get('/properties', getproperties); // Fetch properties


// Set up DELETE route to delete property
router.delete('/properties/:id', deleteproperty);  // Make sure the `id` is used correctly

// Set up the PUT route for updating the property
router.put('/properties/:property_id', updateproperty); // Update route



module.exports = router;
