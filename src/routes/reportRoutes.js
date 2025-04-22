const express = require('express');

const router = express.Router();

const reportController = require("../controllers/reportController");

const apiKeyMiddleware = require('../config/apiKey');

router.use(apiKeyMiddleware);

router.get("/pdf", reportController.exportUserPDF);

module.exports = router;