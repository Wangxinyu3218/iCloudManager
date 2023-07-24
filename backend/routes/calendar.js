const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a Calendar response!";
});

router.post("/selectCalendar", async (ctx) => {
  let { bk_id } = ctx.request.body;
  let sql = `SELECT * FROM bookkeeping_calendar WHERE bk_id = ${bk_id} `;
  const list = await db.query(sql);
  for (let i = 0; i <= list.length - 1; i++) {
    if (list[i].statusA == "0") {
      list[i].statusA = "complete";
    } else if (list[i].statusA == "1") {
      list[i].statusA = "inComplete";
    }
    if (list[i].statusB == "0") {
      list[i].statusB = "complete";
    } else if (list[i].statusB == "1") {
      list[i].statusB = "inComplete";
    }
    if (list[i].othersStatus == "0") {
      list[i].othersStatus = "complete";
    } else if (list[i].othersStatus == "1") {
      list[i].othersStatus = "inComplete";
    }
  }
  ctx.body = { list };
});

router.post("/findCalendar", async (ctx) => {
  let { bk_id, years, months, days } = ctx.request.body;
  let sql = `SELECT * FROM bookkeeping_calendar WHERE bk_id = ${bk_id} and years='${years}' and months='${months}' and days='${days}' `;
  const data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/addCalendar", async (ctx) => {
  let {
    bk_id,
    years,
    months,
    days,
    contentA,
    contentAtext,
    statusA,
    contentB,
    contentBtext,
    statusB,
    others,
    othersStatus,
  } = ctx.request.body;
  let sql = "INSERT INTO bookkeeping_calendar SET ";
  let fieldsAndValues = "";
  if (bk_id) {
    fieldsAndValues += `bk_id = '${bk_id}', `;
  }
  if (years) {
    fieldsAndValues += `years = ${years}, `;
  }
  if (months) {
    fieldsAndValues += `months = '${months}', `;
  }
  if (days) {
    fieldsAndValues += `days = '${days}', `;
  }
  if (contentA) {
    fieldsAndValues += `contentA = '${contentA}', `;
  }
  if (contentAtext) {
    fieldsAndValues += `contentAtext = '${contentAtext}', `;
  }
  if (statusA) {
    fieldsAndValues += `statusA = '${statusA}', `;
  }
  if (contentB) {
    fieldsAndValues += `contentB = '${contentB}', `;
  }
  if (contentBtext) {
    fieldsAndValues += `contentBtext = '${contentBtext}', `;
  }
  if (statusB) {
    fieldsAndValues += `statusB = '${statusB}', `;
  }
  if (others) {
    fieldsAndValues += `others = '${others}', `;
  }
  if (othersStatus) {
    fieldsAndValues += `othersStatus = '${othersStatus}', `;
  }
  fieldsAndValues = fieldsAndValues.slice(0, -2);
  sql += fieldsAndValues;
  let data = await db.query(sql);
  try {
    ctx.body = "success";
  } catch (err) {
    console.error(err);
    ctx.body = "failed";
  }
});

router.post("/updateCalendar", async (ctx) => {
  let {
    bk_id,
    years,
    months,
    days,
    contentA,
    contentAtext,
    statusA,
    contentB,
    contentBtext,
    statusB,
    others,
    othersStatus,
  } = ctx.request.body;
  let sql = "UPDATE bookkeeping_calendar SET ";
  let fieldsAndValues = "";
  if (contentA) {
    fieldsAndValues += `contentA = '${contentA}', `;
  }
  if (contentAtext) {
    fieldsAndValues += `contentAtext = '${contentAtext}', `;
  }
  if (statusA) {
    fieldsAndValues += `statusA = '${statusA}', `;
  }
  if (contentB) {
    fieldsAndValues += `contentB = '${contentB}', `;
  }
  if (contentBtext) {
    fieldsAndValues += `contentBtext = '${contentBtext}', `;
  }
  if (statusB) {
    fieldsAndValues += `statusB = '${statusB}', `;
  }
  if (others) {
    fieldsAndValues += `others = '${others}', `;
  }
  if (othersStatus) {
    fieldsAndValues += `othersStatus = '${othersStatus}', `;
  }
  fieldsAndValues = fieldsAndValues.slice(0, -2);
  sql += fieldsAndValues;
  sql += ` WHERE bk_id = ${bk_id} and years = '${years}' and months = '${months}' and days = '${days}'`;
  try {
    let data = await db.query(sql);
    ctx.body = "success";
  } catch (err) {
    console.error(err);
    ctx.body = "failed";
  }
});

router.post("/deleteCanlendar", async (ctx) => {
  let { calendar_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_calendar WHERE calendar_id = ${calendar_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
});

module.exports = router;
