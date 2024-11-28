const express = require('express');
const router = express.Router();
const { getAllStateList, getCityListBasedOnStateId,getBuildersListBasedOnCityId,getCommunitiesListBasedOnBuilderId,getStaticTablesData} = require('../controllers/stTablesController');



router.get('/stateList', getAllStateList);
router.get('/cityList', getCityListBasedOnStateId);
router.get('/buildersList', getBuildersListBasedOnCityId);
router.get('/stTablesData', getStaticTablesData);
router.get('/communitiesList', getCommunitiesListBasedOnBuilderId);



module.exports = router;