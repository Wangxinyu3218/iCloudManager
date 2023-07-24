const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/test");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureStatistics response!";
});

/* 查询全部数据 */
router.get("/selectWay", async (ctx) => {
  let {} = ctx.request.query;
  let sql = `select * from payWay`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 添加数据 */
router.post("/addWay", async (ctx) => {
  let { way_number, way_content } = ctx.request.body;
  let sql = `insert into payWay(way_number, way_content) values ('${way_number}','${way_content}')`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id查询具体类目 */
router.post("/findWay", async (ctx) => {
  let { way_id } = ctx.request.body;
  let sql = `select * from payWay where way_id = ${way_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 修改数据 */
router.post("/updateWay", async (ctx) => {
  let { way_id, way_number, way_content } = ctx.request.body;
  let sql = `update payWay set way_number='${way_number}',way_content='${way_content}' where way_id = ${way_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id删除数据 */
router.post("/deleteWay", async (ctx) => {
  // 硬删除
  let { way_id } = ctx.request.body;
  let sql = `DELETE FROM payWay WHERE way_id = ${way_id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

module.exports = router;
