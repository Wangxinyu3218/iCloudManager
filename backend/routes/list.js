const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/test");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureStatistics response!";
});

const selectSql =
  `SELECT t.*, t1.type_content, t2.way_content FROM expenditurestatistics t LEFT JOIN payType t1 ON t.payType = t1.type_number LEFT JOIN payWay t2 ON t.payWay = t2.way_number` +
  ` `;
const orderSql = ` ` + `order by id desc` + ` `;

/* 查询所有数据 */
router.get("/selectAll", async (ctx) => {
  let { page, pageSize } = ctx.request.query;
  let sql =
    selectSql + orderSql + `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 查询总条数 */
router.get("/selectCounts", async (ctx) => {
  let {} = ctx.request.query;
  let sql = `SELECT COUNT(*) as total FROM expenditureStatistics`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据内容查询列表 */
router.get("/selectItem", async (ctx) => {
  let { page, pageSize, item } = ctx.request.query;
  let sql =
    selectSql +
    `where item like '${item}%'` +
    orderSql +
    `  limit  ${(page - 1) * pageSize}, ${pageSize}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据支出方式查询列表 */
router.get("/selectPayWay", async (ctx) => {
  let { page, pageSize, payWay } = ctx.request.query;
  let sql =
    selectSql +
    `where payWay = ${payWay} ` +
    orderSql +
    `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据支出类型查询列表 */
router.get("/selectPayType", async (ctx) => {
  let { page, pageSize, payType } = ctx.request.query;
  let sql =
    selectSql +
    `where payType = ${payType} ` +
    orderSql +
    `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据创建日期查询列表 */
router.get("/selectCreateDate", async (ctx) => {
  let { page, pageSize, createDate } = ctx.request.query;
  let sql =
    selectSql +
    `where createDate = '${createDate}'` +
    orderSql +
    `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id查询详细信息 */
router.get("/selectId", async (ctx) => {
  let { id } = ctx.request.query;
  let sql = selectSql + `where id = ${id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 根据id删除数据 */
router.post("/deleteId", async (ctx) => {
  // 硬删除
  let { id } = ctx.request.body;
  let sql = `DELETE FROM expenditureStatistics WHERE id = ${id}`;
  let data = await db.query(sql);
  ctx.body = data;
  // 软删除
  // let { username, del } = ctx.request.body;
  // let sql = `update expenditureStatistics set del='${del}' where username='${username}'`
  // let data = await db.query(sql);
  // ctx.body = data;
});

/* 添加数据 */
router.post("/addItem", async (ctx) => {
  let { item, payWay, payType, amount, startDate, createDate } =
    ctx.request.body;
  let sql = `insert into expenditureStatistics(item,payWay,payType,amount,startDate,createDate) values ('${item}',${payWay},${payType},${amount},'${startDate}','${createDate}')`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 修改数据 */
router.post("/updateItem", async (ctx) => {
  let { id, item, payWay, payType, amount, startDate, createDate } =
    ctx.request.body;
  let sql = `update expenditureStatistics set item='${item}',payWay=${payWay},payType=${payType},amount=${amount},startDate='${startDate}',createDate='${createDate}' where id=${id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

// router.get("/selectWay", async (ctx) => {
//   let {} = ctx.request.query;
//   let sql = `select * from payWay`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

module.exports = router;
