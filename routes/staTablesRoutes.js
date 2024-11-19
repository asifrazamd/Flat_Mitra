const express = require('express');
const router = express.Router();
const {getAllCommunities}=require('../controllers/staTablesController');

router.route("/staTables").get(getAllCommunities);
module.exports = router;