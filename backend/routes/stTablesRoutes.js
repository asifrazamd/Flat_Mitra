// Import the Express module
const express = require('express');

// Create a new router instance for handling specific routes
const router = express.Router();

// Import the controller functions for handling static tables data
const {
  getAllStateList,             // Controller to get the list of all states
  getCityListBasedOnStateId,   // Controller to get cities based on a state ID
  getBuildersListBasedOnCityId,// Controller to get builders based on a city ID
  getCommunitiesListBasedOnBuilderId, // Controller to get communities based on a builder ID
  getStaticTablesData          // Controller to fetch combined static table data
} = require('../controllers/stTablesController');

// Define routes and map them to their respective controller functions

// Route to fetch a list of all states
router.get('/stateList', getAllStateList);

// Route to fetch cities based on the provided state ID
router.get('/cityList', getCityListBasedOnStateId);

// Route to fetch builders based on the provided city ID
router.get('/buildersList', getBuildersListBasedOnCityId);

// Route to fetch static tables data (combining multiple static table data if required)
router.get('/stTablesData', getStaticTablesData);

// Route to fetch communities based on the provided builder ID
router.get('/communitiesList', getCommunitiesListBasedOnBuilderId);

// Export the router so it can be used in other parts of the application
module.exports = router;