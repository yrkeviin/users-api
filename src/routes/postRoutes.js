const express = require('express');

const router = express.Router();

const postController = require("../controllers/postControllers");

const apiKeyMiddleware = require('../config/apiKey');

router.use(apiKeyMiddleware);

router.get("/", postController.getAllPosts);
router.get("/:id", postController.getById);
router.post("/", postController.createPost);
router.put("/:id", postController.editPost);
router.delete("/:id", postController.deletePost);

module.exports = router;