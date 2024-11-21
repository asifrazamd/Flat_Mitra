const express = require('express');
const router = express.Router();
const { getAllStateList, getCityListBasedOnStateId,getBuildersListBasedOnCityId} = require('../controllers/stTablesController');



router.get('/stateList', getAllStateList); // Fetch properties
router.get('/cityList', getCityListBasedOnStateId);
router.get('/buildersList', getBuildersListBasedOnCityId);

module.exports = router;