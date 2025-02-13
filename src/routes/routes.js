import express from 'express';
import dotenv from 'dotenv';
import { MainController } from '../controllers/MainController.js';
import { Utils } from '../utils/utils.js';

const env = dotenv.config();
const router = express.Router();
const mainController = new MainController(new Utils, env)


router.get('/api/', mainController.get);

router.get('/api/hs', (req, res) => {
    res.status(200).json({
        message: 'On'
    });     
})

export default router;