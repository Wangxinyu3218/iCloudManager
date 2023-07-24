const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/test");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureStatistics response!";
});

// /* 查询所有数据 */
// router.get("/selectAll", async (ctx) => {
//   let { page, pageSize } = ctx.request.query;
//   let sql = `select * from expenditureStatistics order by createDate desc limit  ${
//     (page - 1) * pageSize
//   }, ${pageSize}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 查询总条数 */
// router.get("/selectCounts", async (ctx) => {
//   let {} = ctx.request.query;
//   let sql = `SELECT COUNT(*) as total FROM expenditureStatistics`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据内容查询列表 */
// router.get("/selectItem", async (ctx) => {
//   let { page, pageSize, item } = ctx.request.query;
//   let sql = `select * from expenditureStatistics where item like '${item}%' order by createDate desc  limit  ${
//     (page - 1) * pageSize
//   }, ${pageSize}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据支出方式查询列表 */
// router.get("/selectPayWay", async (ctx) => {
//   let { page, pageSize, payWay } = ctx.request.query;
//   let sql = `select * from expenditureStatistics where payWay = ${payWay} order by createDate desc  limit  ${
//     (page - 1) * pageSize
//   }, ${pageSize}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据支出类型查询列表 */
// router.get("/selectPayType", async (ctx) => {
//   let { page, pageSize, payType } = ctx.request.query;
//   let sql = `select * from expenditureStatistics where payType = ${payType} order by createDate desc  limit  ${
//     (page - 1) * pageSize
//   }, ${pageSize}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据创建日期查询列表 */
// router.get("/selectCreateDate", async (ctx) => {
//   let { page, pageSize, createDate } = ctx.request.query;
//   let sql = `select * from expenditureStatistics where createDate = '${createDate}' order by createDate desc  limit  ${
//     (page - 1) * pageSize
//   }, ${pageSize}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据id查询详细信息 */
// router.get("/selectId", async (ctx) => {
//   let { id } = ctx.request.query;
//   let sql = `select * from expenditureStatistics where id = ${id}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 根据id删除数据 */
// router.post("/deleteId", async (ctx) => {
//   // 硬删除
//   let { id } = ctx.request.body;
//   let sql = `DELETE FROM expenditureStatistics WHERE id = ${id}`;
//   let data = await db.query(sql);
//   ctx.body = data;
//   // 软删除
//   // let { username, del } = ctx.request.body;
//   // let sql = `update expenditureStatistics set del='${del}' where username='${username}'`
//   // let data = await db.query(sql);
//   // ctx.body = data;
// });

// /* 添加数据 */
// router.post("/addItem", async (ctx) => {
//   let { item, payWay, payType, amount, startDate, createDate } =
//     ctx.request.body;
//   let sql = `insert into expenditureStatistics(item,payWay,payType,amount,startDate,createDate) values ('${item}',${payWay},${payType},${amount},'${startDate}','${createDate}')`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

// /* 修改数据 */
// router.post("/updateItem", async (ctx) => {
//   let { id, item, payWay, payType, amount, startDate, createDate } =
//     ctx.request.body;
//   let sql = `update expenditureStatistics set item='${item}',payWay=${payWay},payType=${payType},amount=${amount},startDate='${startDate}',createDate='${createDate}' where id=${id}`;
//   let data = await db.query(sql);
//   ctx.body = data;
// });

/* 查询卡片(本月) */
router.get("/getThisMonthCount", async (ctx) => {
  let { startDate, createDate } = ctx.request.query;
  /* 根据起止日期查询本月总消费 */
  let thisMonthAmount = `SELECT SUM( amount ) AS thisMonthAmount FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType != 6;`;
  /* 根据起止日期查询本月总收入 */
  let thisMonthEarn = `SELECT SUM( amount ) AS thisMonthEarn FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 6`;
  /* 根据起止日期查询本月花呗账单 */
  let thisMonthAntCredit = `SELECT SUM( amount ) AS thisMonthAntCredit FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payWay = 0`;
  /* 根据起止日期查询本月水电费账单 */
  let thisMonthYuxiaoer = `SELECT SUM( amount ) AS thisMonthYuxiaoer FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 0`;
  /* 根据起止日期查询本月交通费账单 */
  let thisMonthCar = `SELECT SUM( amount ) AS thisMonthCar FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 3`;
  /* 根据起止日期查询本月餐饮账单 */
  let thisMonthFood = `SELECT SUM( amount ) AS thisMonthFood FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 8`;
  /* 根据起止日期查询本月张晓璐账单 */
  let thisMonthDeer = `SELECT SUM( amount ) AS thisMonthDeer FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 9`;
  let TMA = await db.query(thisMonthAmount);
  let TME = await db.query(thisMonthEarn);
  let TMAC = await db.query(thisMonthAntCredit);
  let TMY = await db.query(thisMonthYuxiaoer);
  let TMC = await db.query(thisMonthCar);
  let TMF = await db.query(thisMonthFood);
  let TMD = await db.query(thisMonthDeer);
  let data = { TMA, TME, TMAC, TMY, TMC, TMF, TMD };
  ctx.body = data;
});

/* 查询卡片(上月) */
router.get("/getLastMonthCount", async (ctx) => {
  let { startDate, createDate } = ctx.request.query;
  /* 根据起止日期查询上月总消费 */
  let LastMonthAmount = `SELECT SUM( amount ) AS thisMonthAmount FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType != 6;`;
  /* 根据起止日期查询上月总收入 */
  let LastMonthEarn = `SELECT SUM( amount ) AS thisMonthEarn FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 6`;
  /* 根据起止日期查询上月水电费账单 */
  let LastMonthYuxiaoer = `SELECT SUM( amount ) AS thisMonthYuxiaoer FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 0`;
  /* 根据起止日期查询上月交通费账单 */
  let LastMonthCar = `SELECT SUM( amount ) AS thisMonthCar FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 3`;
  /* 根据起止日期查询上月花呗账单 */
  let LastMonthAntCredit = `SELECT SUM( amount ) AS thisMonthAntCredit FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payWay = 0`;
  /* 根据起止日期查询上月餐饮账单 */
  let LastMonthFood = `SELECT SUM( amount ) AS thisMonthFood FROM expenditureStatistics WHERE createDate BETWEEN '${startDate}' AND '${createDate}' AND payType = 8`;
  let LMA = await db.query(LastMonthAmount);
  let LME = await db.query(LastMonthEarn);
  let LMY = await db.query(LastMonthYuxiaoer);
  let LMC = await db.query(LastMonthCar);
  let LMAC = await db.query(LastMonthAntCredit);
  let LMF = await db.query(LastMonthFood);
  let data = { LMA, LME, LMAC, LMY, LMC, LMF };
  ctx.body = data;
});

/* 财务概览 */
router.get("/financialAnalysis", async (ctx) => {
  let {} = ctx.request.query;
  let sql = `select * from financialAnalysis`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 查询分期 */
router.get("/instalmentCredit", async (ctx) => {
  let { id } = ctx.request.query;
  let sql = `select * from financialAnalysis where id = ${id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

/* 修改分期 */
router.post("/updateInstalmentCredit", async (ctx) => {
  let { id, number } = ctx.request.body;
  let sql = `update financialAnalysis set number='${number}' where id=${id}`;
  let data = await db.query(sql);
  ctx.body = data;
});

module.exports = router;
