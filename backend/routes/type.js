const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a Type response!";
});

router.get("/listType", async (ctx) => {
  let { page, pageSize, bk_type_id } = ctx.request.query;
  let sql = `SELECT * FROM bookkeeping_type where bk_type_id = ${bk_type_id} order by type_dict limit  ${
    (page - 1) * pageSize
  }, ${pageSize}`;
  let countSql = `SELECT COUNT(*) as total FROM bookkeeping_type`;
  const list = await db.query(sql);
  const countRows = await db.query(countSql);
  const total = countRows[0].total;
  ctx.body = { list, total };
});

router.post("/findType", async (ctx) => {
  let { bk_type_id, type_id } = ctx.request.body;
  let sql = `SELECT * FROM bookkeeping_type WHERE bk_type_id = ${bk_type_id} and type_id = ${type_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/addType", async (ctx) => {
  let msg = "";
  let sqlA = `SELECT LPAD(FLOOR(RAND() * 99999999999), 6, '0') AS type_id`;
  let data = await db.query(sqlA);
  const id = data[0].type_id;
  let { bk_type_id, type_dict, type_content, del_state } = ctx.request.body;
  let sqlB = `INSERT INTO bookkeeping_type ( bk_type_id, type_id, type_dict, type_content, del_state ) values (${bk_type_id},${id},${type_dict},'${type_content}',${del_state})`;
  msg = "创建成功";
  let result = await db.query(sqlB);
  ctx.body = { msg, result };
});

router.post("/updateType", async (ctx) => {
  let msg = "";
  let {
    bk_type_id,
    type_id,
    type_sort_id,
    type_dict,
    type_content,
    del_state,
  } = ctx.request.body;
  let sql = `update bookkeeping_type set type_sort_id=${type_sort_id},type_dict=${type_dict},type_content='${type_content}',del_state=${del_state} where type_id=${type_id} and bk_type_id=${bk_type_id}`;
  let data = await db.query(sql);
  msg = "修改成功";
  ctx.body = { msg };
});

router.post("/deleteType", async (ctx) => {
  let { bk_type_id, type_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_type WHERE bk_type_id = ${bk_type_id} and type_id = ${type_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
});

module.exports = router;
