const express = require('express');
const router = express.Router();
const { getAllStateList, getCityListBasedOnStateId,getBuildersListBasedOnCityId,getStaticTablesData} = require('../controllers/stTablesController');



router.get('/stateList', getAllStateList);
router.get('/cityList', getCityListBasedOnStateId);
router.get('/buildersList', getBuildersListBasedOnCityId);
router.get('/stTablesData', getStaticTablesData);



module.exports = router;