// Import necessary modules
const express = require('express'); // For creating a router instance

// Import controller functions for property-related operations
const { 
  createProperty,   // Controller for creating a property with optional image uploads
  getPropertyDetails,    // Controller for retrieving specific properties
  getAllProperties  // Controller for retrieving all properties with pagination
} = require('../controllers/propertyController');

// Create a new router instance for property-related routes
const router = express.Router();


// Define routes for property-related operations

/**
 * @route POST /api/upload-property
 * @description Upload property details along with multiple images
 * @access Public (Authentication can be added later)
 * @middleware multer.array('images') - Handles multiple image uploads with the field name 'images'
 * @controller createProperty
 */
router.post('/upload-property', createProperty);
/**
 * @route GET /api/properties1
 * @description Retrieve all properties with pagination
 * @access Public
 * @controller getAllProperties
 */
router.get('/getAllProperties', getAllProperties);

/**
 * @route GET /api/properties
 * @description Retrieve specific properties based on filters or queries
 * @access Public
 * @controller getProperties
 */
router.get('/propertyDetails', getPropertyDetails);

// Export the router to be used in the main application file
module.exports = router;