const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/test");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureStatistics response!";
});

/* 查询全部数据 */
router.get("/selectType", async (ctx) => {
  let {} = ctx.request.query;
  let sql = `select * from payType`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 添加数据 */
router.post("/addType", async (ctx) => {
  let { type_number, type_content } = ctx.request.body;
  let sql = `insert into payType(type_number, type_content) values ('${type_number}','${type_content}')`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id查询具体类目 */
router.post("/findType", async (ctx) => {
  let { type_id } = ctx.request.body;
  let sql = `select * from payType where type_id = ${type_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 修改数据 */
router.post("/updateType", async (ctx) => {
  let { type_id, type_number, type_content } = ctx.request.body;
  let sql = `update payType set type_number='${type_number}',type_content='${type_content}' where type_id = ${type_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id删除数据 */
router.post("/deleteType", async (ctx) => {
  // 硬删除
  let { type_id } = ctx.request.body;
  let sql = `DELETE FROM payType WHERE type_id = ${type_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

module.exports = router;
