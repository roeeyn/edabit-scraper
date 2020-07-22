const dotenv = require("dotenv");
dotenv.config();

const { connect2db } = require("./db/db");

console.log(process.env.DB_HOST);
connect2db()
  .then(message => console.log("holi", message))
  .catch(err => console.error("holi", err));
