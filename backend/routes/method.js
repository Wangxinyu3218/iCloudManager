const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a Method response!";
});

router.get("/listMethod", async (ctx) => {
  let { page, pageSize, bk_method_id } = ctx.request.query;
  let sql = `SELECT * FROM bookkeeping_method where bk_method_id = ${bk_method_id} order by method_dict limit  ${
    (page - 1) * pageSize
  }, ${pageSize}`;
  let countSql = `SELECT COUNT(*) as total FROM bookkeeping_method where bk_method_id = ${bk_method_id}`;
  const list = await db.query(sql);
  const countRows = await db.query(countSql);
  const total = countRows[0].total;
  ctx.body = { list, total };
});

router.post("/findMethod", async (ctx) => {
  let { bk_method_id, method_id } = ctx.request.body;
  let sql = `SELECT * FROM bookkeeping_method WHERE bk_method_id = ${bk_method_id} and method_id = ${method_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/addMethod", async (ctx) => {
  let msg = "";
  let sqlA = `SELECT LPAD(FLOOR(RAND() * 99999999999), 6, '0') AS method_id`;
  let data = await db.query(sqlA);
  const id = data[0].method_id;
  let { bk_method_id, method_dict, method_content, del_state } =
    ctx.request.body;
  let sqlB = `INSERT INTO bookkeeping_method ( bk_method_id, method_id, method_dict, method_content,del_state ) values (${bk_method_id},${id},${method_dict},'${method_content}',${del_state})`;
  msg = "创建成功";
  let result = await db.query(sqlB);
  ctx.body = { msg, result };
});

router.post("/updateMethod", async (ctx) => {
  let msg = "";
  let {
    bk_method_id,
    method_id,
    method_sort_id,
    method_dict,
    method_content,
    del_state,
  } = ctx.request.body;
  let sql = `update bookkeeping_method set method_sort_id=${method_sort_id},method_dict=${method_dict},method_content='${method_content}',del_state=${del_state} where method_id=${method_id} and bk_method_id=${bk_method_id}`;
  let data = await db.query(sql);
  msg = "修改成功";
  ctx.body = { msg };
});

router.post("/deleteMethod", async (ctx) => {
  let { bk_method_id, method_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_method WHERE bk_method_id = ${bk_method_id} and method_id = ${method_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
});

module.exports = router;
