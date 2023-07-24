const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureList response!";
});
const selectSql =
  `SELECT t.*, t1.type_content, t2.method_content FROM bookkeeping_list t LEFT JOIN bookkeeping_type t1 ON t.expenditure_type = t1.type_id LEFT JOIN bookkeeping_method t2 ON t.expenditure_method = t2.method_id` +
  ` `;
const orderSql = ` ` + `order by createDate desc` + ` `;

router.get("/selectAll", async (ctx) => {
  let msg = "success";
  let { page, pageSize, bk_id } = ctx.request.query;
  let sql = selectSql + `where bk_id = ${bk_id}`;
  let countSql = `SELECT COUNT(*) as total FROM bookkeeping_list` + ` `;
  let params = [];
  sql += ` ` + orderSql + `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  const list = await db.query(sql, params);
  const countRows = await db.query(countSql, params);
  const total = countRows[0].total;
  ctx.body = { msg, list, total };
});

router.get("/select", async (ctx) => {
  let {
    bk_id,
    page,
    pageSize,
    expenditure_item,
    expenditure_method,
    expenditure_type,
    createDate,
  } = ctx.request.query;
  let sql = selectSql + `where 1 = 1 and bk_id = ${bk_id}`;
  let countSql =
    `SELECT COUNT(*) as total FROM bookkeeping_list where 1 = 1` + ` `;
  let params = [];
  if (expenditure_item) {
    sql += ` ` + `and expenditure_item like '${expenditure_item}%'` + ` `;
    countSql += ` ` + `and expenditure_item like '${expenditure_item}%'` + ` `;
    params.push(expenditure_item);
  }
  if (expenditure_method) {
    sql += ` ` + `and expenditure_method = ${expenditure_method}` + ` `;
    countSql += ` ` + `and expenditure_method = ${expenditure_method}` + ` `;
    params.push(expenditure_method);
  }
  if (expenditure_type) {
    sql += ` ` + `and expenditure_type = ${expenditure_type}` + ` `;
    countSql += ` ` + `and expenditure_type = ${expenditure_type}` + ` `;
    params.push(expenditure_type);
  }
  if (createDate) {
    sql += ` ` + `and createDate = '${createDate}'` + ` `;
    countSql += ` ` + `and createDate = '${createDate}'` + ` `;
    params.push(createDate);
  }
  sql += ` ` + orderSql + `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  const list = await db.query(sql, params);
  const countRows = await db.query(countSql, params);
  const total = countRows[0].total;
  ctx.body = { list, total };
});

router.get("/selectId", async (ctx) => {
  let { sort_id } = ctx.request.query;
  let sql = selectSql + `where sort_id = ${sort_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/deleteId", async (ctx) => {
  // 硬删除
  let { sort_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_list WHERE sort_id = ${sort_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
  // 软删除
  // let { username, del } = ctx.request.body;
  // let sql = `update expenditureStatistics set del='${del}' where username='${username}'`
  // let data = await db.query(sql);
  // ctx.body = data;
});

router.post("/addExpenditure", async (ctx) => {
  let msg = "";
  let {
    bk_id,
    expenditure_item,
    expenditure_method,
    expenditure_type,
    expenditure_amount,
    startDate,
    createDate,
  } = ctx.request.body;
  let sql = `insert into bookkeeping_list(bk_id,expenditure_item,expenditure_method,expenditure_type,expenditure_amount,startDate,createDate) values (${bk_id},'${expenditure_item}',${expenditure_method},${expenditure_type},'${expenditure_amount}','${startDate}','${createDate}')`;
  let data = await db.query(sql);
  let a = data[0];
  msg = "success";
  ctx.body = { msg, a };
});

router.post("/updateExpenditure", async (ctx) => {
  let msg = "";
  let {
    sort_id,
    expenditure_item,
    expenditure_method,
    expenditure_type,
    expenditure_amount,
    createDate,
  } = ctx.request.body;
  let sql = `update bookkeeping_list set expenditure_item='${expenditure_item}',expenditure_method=${expenditure_method},expenditure_type=${expenditure_type},expenditure_amount='${expenditure_amount}',createDate='${createDate}' where sort_id=${sort_id}`;
  let data = await db.query(sql);
  let a = data[0];
  msg = "success";
  ctx.body = { msg, a };
});

module.exports = router;
