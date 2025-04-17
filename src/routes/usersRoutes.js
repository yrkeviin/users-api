const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userControllers');
const upload = require("../config/upload")

/**
 * @swagger
 * tags:
 *   name: Users
 *   description: Gerenciamento de users
 */

/**
 * @swagger
 * /api/users:
 *   get:
 *     summary: Lista todos os users
 *     tags: [Users]
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         description: Filtro por nome
 *     responses:
 *       200:
 *         description: Lista de users
 */
router.get('/', UserController.getAllUsers);

/**
 * @swagger
 * /api/users/{id}:
 *   get:
 *     summary: Busca user por ID
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: User encontrado
 *       404:
 *         description: User não encontrado
 */
router.get('/:id', UserController.getUserById);

/**
 * @swagger
 * /api/users:
 *   post:
 *     summary: Cria um novo user
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               house_id:
 *                 type: integer
 *               photo:
 *                 type: string
 *                 format: binary
 *     responses:
 *       201:
 *         description: User criado
 */
router.post('/', upload.single("photo"), UserController.createUser);

/**
 * @swagger
 * /api/users/{id}:
 *   delete:
 *     summary: Deleta um user
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: User deletado
 */
router.delete('/:id', UserController.deleteUser);

/**
 * @swagger
 * /api/users/{id}:
 *   put:
 *     summary: Atualiza um user
 *     tags: [Users]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               house_id:
 *                 type: integer
 *     responses:
 *       200:
 *         description: User atualizado
 */
router.put('/:id', UserController.updateUser);

module.exports = router;