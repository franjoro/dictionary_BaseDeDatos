var express = require('express');
var router = express.Router();
const pool = require("../pool");

/* GET home page. */
router.get('/', async function(req, res, next) {

  const data = await pool.query("SET @p0='factura'; SET @p1='tiendita'; CALL `json_from_table_fields`(@p0, @p1);");
  const json = JSON.parse(data[2][0]['@fields']);
  console.log(json);
  res.render('viewTable', { json });
});

module.exports = router;
