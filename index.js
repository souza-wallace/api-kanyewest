import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import router from './src/routes/routes.js';


const app = express();
const env = dotenv.config();

app.use(express.json());
app.use(cors());
app.use(router);

const start = async () => {
    try {
        app.listen(process.env.PORT, console.log(`Server is listening ${process.env.PORT}...`));
    } catch (error) {
        console.log(error,'error');
    }
};

start();