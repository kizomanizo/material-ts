import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();

const database = process.env.DB_DATABASE;
const username = process.env.DB_USER;
const password = process.env.DB_PASSWORD;
const host = process.env.DB_HOST;

if (!database || !username || !password || !host) {
  throw new Error('Missing database configuration');
}

const sequelize = new Sequelize(database, username, password, {
  host,
  dialect: 'mysql',
  // Add other necessary options
});

export default sequelize;