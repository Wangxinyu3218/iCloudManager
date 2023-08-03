const router = require("koa-router")();
const json = require("koa-json");
const moment = require("moment");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a homePage response!";
});

/* 获取当前时间 */
let date = new Date();
/* //获取当前月的第一天 */
let monthStart = date.setDate(1);
let thisStartDay = moment(monthStart).format("YYYY-MM-DD");
let thisMonth = moment(monthStart).format("YYYY-MM");
/* 获取当前月的最后一天 */
let currentMonth = date.getMonth();
let nextMonth = ++currentMonth;
let nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
let oneDay = 1000 * 60 * 60 * 24;
let thisEndDay = moment(nextMonthFirstDay - oneDay).format("YYYY-MM-DD");

/* 获取上月的最后一天 */
let lcurrentMonth = date.getMonth() - 1;
let lnextMonth = ++lcurrentMonth;
let lnextMonthFirstDay = new Date(date.getFullYear(), lnextMonth, 1);
let loneDay = 1000 * 60 * 60 * 24;
let lastEndDay = moment(lnextMonthFirstDay - loneDay).format("YYYY-MM-DD");
/* 获取上月的第一天 */
let llcurrentMonth = date.getMonth() - 1;
let llnextMonth = +llcurrentMonth;
let llnextMonthFirstDay = new Date(date.getFullYear(), llnextMonth, 1);
let lloneDay = 1000 * 60 * 60 * 24;
let lastStartDay = moment(llnextMonthFirstDay + lloneDay).format("YYYY-MM-DD");
let lastMonth = moment(llnextMonthFirstDay + lloneDay).format("YYYY-MM");

router.get("/dashboard", async (ctx) => {
  let { bk_id, createDate } = ctx.request.query;
  let dashboard = `select * from bookkeeping_dashboard where depend_id = ${bk_id}`;
  let thisMonthExpenditure = `select sum( expenditure_amount ) as residue from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type != 546963`;
  let thisMonthIncome = `select sum( expenditure_amount ) as income from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 546963`;
  let thisMonthFood = `select sum( expenditure_amount ) as food from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 386515`;
  let thisMonthTraffic = `select sum( expenditure_amount ) as traffic from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 786789`;
  let thisMonthLiving = `select sum( expenditure_amount ) as living from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 600856`;
  let thisMonthAntCredit = `select sum( expenditure_amount ) as antCredit from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_method = 950617`;
  let thisMonthLucky = `select sum( expenditure_amount ) as lucky from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 253347`;
  let thisMonthShopping = `select sum( expenditure_amount ) as shopping from bookkeeping_list where createDate BETWEEN '${thisStartDay}' AND '${createDate}' and bk_id = ${bk_id} and expenditure_type = 470356`;

  let dashboardData = await db.query(dashboard);
  let thisMonthExpenditureData = await db.query(thisMonthExpenditure);
  let thisMonthIncomeData = await db.query(thisMonthIncome);
  let thisMonthFoodData = await db.query(thisMonthFood);
  let thisMonthTrafficData = await db.query(thisMonthTraffic);
  let thisMonthLivingeData = await db.query(thisMonthLiving);
  let thisMonthAntCreditData = await db.query(thisMonthAntCredit);
  let thisMonthLuckyData = await db.query(thisMonthLucky);
  let thisMonthShoppingData = await db.query(thisMonthShopping);

  let residue = Number(dashboardData[0].bk_residue).toFixed(2);
  let limit = Number(dashboardData[0].bk_limit).toFixed(2);
  let income = Number(thisMonthIncomeData[0].income).toFixed(2);
  let expenditure = Number(thisMonthExpenditureData[0].residue).toFixed(2);
  let food = Number(thisMonthFoodData[0].food).toFixed(2);
  let traffic = Number(thisMonthTrafficData[0].traffic).toFixed(2);
  let living = Number(thisMonthLivingeData[0].living).toFixed(2);
  let antCredit = Number(thisMonthAntCreditData[0].antCredit).toFixed(2);
  let lucky = Number(thisMonthLuckyData[0].lucky).toFixed(2);
  let shopping = Number(thisMonthShoppingData[0].shopping).toFixed(2);
  ctx.body = {
    thisMonth,
    residue,
    limit,
    expenditure,
    income,
    food,
    traffic,
    living,
    antCredit,
    lucky,
    shopping,
  };
});

router.get("/getDashboard", async (ctx) => {
  let { bk_id } = ctx.request.query;
  let sql = `select * from bookkeeping_dashboard where depend_id = ${bk_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.get("/lastDashboard", async (ctx) => {
  let { bk_id } = ctx.request.query;
  let sql1 = `UPDATE bookkeeping_dashboard_list SET list_amount = ( SELECT SUM( expenditure_amount ) FROM bookkeeping_list WHERE bookkeeping_list.expenditure_type = bookkeeping_dashboard_list.expenditure_type and startDate = '${lastStartDay}' and bookkeeping_dashboard_list.bk_id = ${bk_id});`;
  let sql2 = `UPDATE bookkeeping_dashboard_list SET list_date = '${lastMonth}' WHERE bk_id = ${bk_id};`;
  let sql3 = `UPDATE bookkeeping_dashboard_list SET list_amount = ROUND(list_amount, 2)`;
  let data1 = await db.query(sql1);
  let data2 = await db.query(sql2);
  let data3 = await db.query(sql3);
  let msg = "success";

  ctx.body = msg;
});

router.get("/selectDashboard", async (ctx) => {
  let { bk_id } = ctx.request.query;
  let dashboard = `select * from bookkeeping_dashboard_list where bk_id = ${bk_id}`;
  let dashboardData = await db.query(dashboard);
  ctx.body = dashboardData;
});

router.post("/updateDashboard", async (ctx) => {
  let msg = "";
  let { bk_id, bk_residue, bk_limit } = ctx.request.body;
  let sql = `update bookkeeping_dashboard set bk_residue='${bk_residue}',bk_limit='${bk_limit}' where depend_id=${bk_id}`;
  let data = await db.query(sql);
  let a = data[0];
  msg = "success";
  ctx.body = { msg, a };
});

router.get("/selectSchedule", async (ctx) => {
  let msg = "success";
  let { page, pageSize, bk_id } = ctx.request.query;
  let sql = `select * from bookkeeping_schedule where bk_id = ${bk_id} order by createDate desc limit  ${
    (page - 1) * pageSize
  }, ${pageSize}`;
  let countSql = `SELECT COUNT(*) as total FROM bookkeeping_schedule` + ` `;
  const list = await db.query(sql);
  const countRows = await db.query(countSql);
  const total = countRows[0].total;
  ctx.body = { msg, list, total };
});

router.get("/scheduleId", async (ctx) => {
  let { sort_id } = ctx.request.query;
  let sql = `select * from bookkeeping_schedule where sort_id = ${sort_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/deleteScid", async (ctx) => {
  // 硬删除
  let { sort_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_schedule WHERE sort_id = ${sort_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
  // 软删除
  // let { username, del } = ctx.request.body;
  // let sql = `update expenditureStatistics set del='${del}' where username='${username}'`
  // let data = await db.query(sql);
  // ctx.body = data;
});

router.post("/addSchedule", async (ctx) => {
  let msg = "";
  let { bk_id, topic, details, createDate } = ctx.request.body;
  let sql = `insert into bookkeeping_schedule(bk_id,topic,details,createDate) values (${bk_id},'${topic}','${details}','${createDate}')`;
  let data = await db.query(sql);
  let a = data[0];
  msg = "success";
  ctx.body = { msg, a };
});

router.post("/updateSchedule", async (ctx) => {
  let msg = "";
  let { sort_id, topic, details, createDate, state } = ctx.request.body;
  let sql = `update bookkeeping_schedule set topic='${topic}',details='${details}',createDate='${createDate}',state=${state} where sort_id=${sort_id}`;
  let data = await db.query(sql);
  let a = data[0];
  msg = "success";
  ctx.body = { msg, a };
});
module.exports = router;
