/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 时间模块 */
const {
  format,
  addDays,
  startOfWeek,
  endOfWeek,
  startOfMonth,
  endOfMonth,
  startOfYear,
  endOfYear,
  subMonths,
} = require("date-fns");
/* 前缀 */
router.prefix("/home");
/* 计算时间 */
const options = { weekStartsOn: 1 }; // Set Monday as the first day of the week
/* 今天 */
const today = format(new Date(), "yyyy-MM-dd");
/* 昨天 */
const yesterday = format(addDays(new Date(), -1), "yyyy-MM-dd");
/* 本周一 */
const thisMonday = format(startOfWeek(new Date(), options), "yyyy-MM-dd");
/* 上周一 */
const lastMonday = format(
  startOfWeek(addDays(new Date(), -7), options),
  "yyyy-MM-dd"
);
/* 上周日 */
const lastSunday = format(
  endOfWeek(addDays(new Date(), -7), options),
  "yyyy-MM-dd"
);
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
/* 今年1 */
const firstDayOfYear = format(startOfYear(new Date()), "yyyy-MM-dd");
/* 今年末 */
const lastDayOfYear = format(endOfYear(new Date()), "yyyy-MM-dd");
/* 接口 */
// 删除
router.post("/del", async (ctx) => {
  let { id, typeid } = ctx.request.body;
  try {
    let sql = `update dashcard set state = 1 where id='${id}'`;
    let back = `update type set isdash = 0 where typeid='${typeid}'`;
    let data = await db.query(sql);
    let bac = await db.query(back);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 计算，填表
router.get("/count", async (ctx) => {
  let { uuid } = ctx.request.query;
  let sql = `select * from dashcard where uuid = '${uuid}'`;
  const list = await db.query(sql);
  try {
    /* 循环 */
    for (var i = 0; i < list.length; i++) {
      /* 循环出typeid ---- 一次即可 */
      listType = list[i].typeid;
      /* 算今天的type */
      let countToday = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime like '${today}%'`;
      ct = await db.query(countToday);
      if (ct[0].total === null) {
        ct[0].total = "暂无数据";
      } else {
        ct[0].total = parseFloat(ct[0].total.toFixed(2));
      }
      /* 把今天的type插入 */
      let to = `update dashcard set tamount = '${ct[0].total}', today = '今日' where typeid = '${listType}'`;
      /* 执行 */
      const tod = await db.query(to);

      /* 算昨天的type */
      let countYesterday = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime like '${yesterday}%'`;
      cy = await db.query(countYesterday);
      if (cy[0].total === null) {
        cy[0].total = "暂无数据";
      } else {
        cy[0].total = parseFloat(cy[0].total.toFixed(2));
      }
      /* 把昨天的type插入 */
      let ye = `update dashcard set yamount = '${cy[0].total}', yesterday = '昨日' where typeid = '${listType}'`;
      /* 执行 */
      const yes = await db.query(ye);

      /* 算这周的type */
      let countWeek = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime between '${thisMonday}' and '${today}%'`;
      cw = await db.query(countWeek);
      if (cw[0].total === null) {
        cw[0].total = "暂无数据";
      } else {
        cw[0].total = parseFloat(cw[0].total.toFixed(2));
      }
      /* 把这周的type插入 */
      let we = `update dashcard set wamount = '${cw[0].total}', week = '本周' where typeid = '${listType}'`;
      /* 执行 */
      const wee = await db.query(we);

      /* 算上周的type */
      let countLweek = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime between '${lastMonday}' and '${lastSunday}%'`;
      clw = await db.query(countLweek);
      if (clw[0].total === null) {
        clw[0].total = "暂无数据";
      } else {
        clw[0].total = parseFloat(clw[0].total.toFixed(2));
      }
      /* 把上周的type插入 */
      let lw = `update dashcard set lmamount = '${clw[0].total}', lastweek = '上周' where typeid = '${listType}'`;
      /* 执行 */
      const lwe = await db.query(lw);

      // /* 算这月的type */
      // let counttmonth = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime between '${firstDayOfLastMonth}' and '${today}%'`;
      // ctm = await db.query(counttmonth);
      // if (ctm[0].total === null) {
      //   ctm[0].total = "暂无数据";
      // } else {
      //   ctm[0].total = parseFloat(ctm[0].total.toFixed(2));
      // }
      // /* 把这月的type插入 */
      // let tm = `update dashcard set mamount = '${ctm[0].total}', month = '本月' where typeid = '${listType}'`;
      // /* 执行 */
      // const tmo = await db.query(tm);

      /* 算上月的type */
      let countMonth = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime between '${firstDayOfLastMonth}' and '${lastDayOfLastMonth}%'`;
      cm = await db.query(countMonth);
      if (cm[0].total === null) {
        cm[0].total = "暂无数据";
      } else {
        cm[0].total = parseFloat(cm[0].total.toFixed(2));
      }
      /* 把上月的type插入 */
      let mo = `update dashcard set lamount = '${cm[0].total}', lastmonth = '上月' where typeid = '${listType}'`;
      /* 执行 */
      const mon = await db.query(mo);

      /* 算今年的type */
      let countYear = `select sum(amount) as total from bookkeep where state = 0 and uuid = '${uuid}' and typeid = '${listType}' and createtime between '${firstDayOfYear}' and '${lastDayOfYear}%'`;
      cye = await db.query(countYear);
      if (cye[0].total === null) {
        cye[0].total = "暂无数据";
      } else {
        cye[0].total = parseFloat(cye[0].total.toFixed(2));
      }
      /* 把今年的type插入 */
      let yea = `update dashcard set aamount = '${cye[0].total}', year = '本年度' where typeid = '${listType}'`;
      /* 执行 */
      const year = await db.query(yea);
    }
    ctx.body = { code: 200, msg: "查询成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败", error };
  }
});
// 查表
router.post("/select", async (ctx) => {
  let { uuid } = ctx.request.body;
  try {
    let sql = `select * from dashcard where uuid = '${uuid}' and state = 0`;
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 排序
router.post("/order", async (ctx) => {
  let { uuid } = ctx.request.body;
  try {
    let sql = `select * from dashcard where uuid = '${uuid}' and state = 0 order by lmamount desc`;
    let list = await db.query(sql);
    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});

module.exports = router;
