import knexObj from 'knex';

const knex = knexObj({
  client: 'mysql2',
  connection: {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '12345',
    database: 'oadb'
  },
  pool: { min: 0, max: 10 }
});

export default knex;