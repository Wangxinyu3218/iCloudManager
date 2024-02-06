/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/statistic");

/* 时间模块 */
const { format, startOfMonth, endOfMonth, subMonths } = require("date-fns");
/* 今天 */
const today = format(new Date(), "yyyy-MM-dd");
/* 上月1 */
const firstDayOfLastMonth = format(
  startOfMonth(subMonths(new Date(), 1)),
  "yyyy-MM-dd"
);
/* 上月末 */
const lastDayOfLastMonth = format(
  endOfMonth(subMonths(new Date(), 1)),
  "yyyy-MM-dd"
);
/* 这月1 */
const firstDayOfCurrentMonth = format(startOfMonth(new Date()), "yyyy-MM-dd");
/* 接口 */
// 增加？有问题
router.post("/addStat", async (ctx) => {
  let { uuid, roleid, total, value, warn } = ctx.request.body;
  try {
    let sql = `insert into statistic (id, uuid, roleid, total, value, warn) values (uuid(), '${uuid}', '${roleid}', '${total}', '${value}', '${warn}')`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "新增成功", des: "请到列表查看" };
  } catch (error) {
    ctx.body = { code: 500, msg: "新增失败", des: "请修改后重新添加" };
  }
});
// 查询
router.post("/findStat", async (ctx) => {
  let { uuid, roleid } = ctx.request.body;
  try {
    /* 上月支出 */
    let countLastcost = `select sum(amount) as count from bookkeep where state = 0 and uuid = '${uuid}' and iscost = 0 and createtime between '${firstDayOfLastMonth}' and '${lastDayOfLastMonth}%'`;
    ct = await db.query(countLastcost);
    if (ct[0].count === null) {
      ct[0].count = "0";
    } else {
      ct[0].count = parseFloat(ct[0].count.toFixed(2));
    }
    let lastcost = `update statistic set lcost = '${ct[0].count}' where uuid = '${uuid}'`;
    const lastc = await db.query(lastcost);
    /* 上月收入 */
    let countLastincome = `select sum(amount) as count from bookkeep where state = 0 and uuid = '${uuid}' and iscost = 1 and createtime between '${firstDayOfLastMonth}' and '${lastDayOfLastMonth}%'`;
    ct = await db.query(countLastincome);
    if (ct[0].count === null) {
      ct[0].count = "0";
    } else {
      ct[0].count = parseFloat(ct[0].count.toFixed(2));
    }
    let lastincome = `update statistic set lincome = '${ct[0].count}' where uuid = '${uuid}'`;
    const lasti = await db.query(lastincome);
    /* 本月收入 */
    let countincome = `select sum(amount) as count from bookkeep where state = 0 and uuid = '${uuid}' and iscost = 1 and createtime between '${firstDayOfCurrentMonth}' and '${today}%'`;
    ct = await db.query(countincome);
    if (ct[0].count === null) {
      ct[0].count = "0";
    } else {
      ct[0].count = parseFloat(ct[0].count.toFixed(2));
    }
    let income = `update statistic set income = '${ct[0].count}' where uuid = '${uuid}'`;
    const i = await db.query(income);
    /* 本月支出 */
    let countcost = `select sum(amount) as count from bookkeep where state = 0 and uuid = '${uuid}' and iscost = 0 and createtime between '${firstDayOfCurrentMonth}' and '${today}%'`;
    ct = await db.query(countcost);
    if (ct[0].count === null) {
      ct[0].count = "0";
    } else {
      ct[0].count = parseFloat(ct[0].count.toFixed(2));
    }
    let cost = `update statistic set cost = '${ct[0].count}' where uuid = '${uuid}'`;
    const c = await db.query(cost);
    let sql = `select * from statistic where uuid = '${uuid}' and roleid = '${roleid}'`;
    const lis = await db.query(sql);
    /* 限额进度条 */
    let miners =
      parseFloat(lis[0].cost.toFixed(2)) / parseFloat(lis[0].warn.toFixed(2));
    let percent = parseFloat((miners * 100).toFixed(2));
    let insertP = `update statistic set percent = '${percent}' where uuid = '${uuid}'`;
    const p = await db.query(insertP);
    /* 再查 */
    let sq = `select * from statistic where uuid = '${uuid}' and roleid = '${roleid}'`;
    const list = await db.query(sq);

    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.put("/updateStat", async (ctx) => {
  let { uuid, roleid, total, value, warn } = ctx.request.body;
  try {
    let sql = `update statistic set total = '${total}', value = '${value}', warn = '${warn}' where uuid = '${uuid}' and roleid = '${roleid}'`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "修改成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败" };
  }
});

module.exports = router;
