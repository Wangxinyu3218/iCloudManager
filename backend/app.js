const Koa = require("koa");
const app = new Koa();
const views = require("koa-views");
const json = require("koa-json");
const onerror = require("koa-onerror");
const bodyparser = require("koa-bodyparser");
const logger = require("koa-logger");

const homePage = require("./routes/homePage");
const index = require("./routes/index");
const list = require("./routes/list");
const login = require("./routes/login");
const method = require("./routes/method");
const type = require("./routes/type");
const calendar = require("./routes/calendar");
// error handler
onerror(app);
const hostName = "localhost"; //IP
const port = 5555; //端口

// middlewares
app.use(
  bodyparser({
    enableTypes: ["json", "form", "text"],
  })
);
app.use(json());
app.use(logger());
app.use(require("koa-static")(__dirname + "/public/dist"));
console.log(`服务运行在${hostName}:${port}`);

app.use(
  views(__dirname + "/views", {
    extension: "ejs",
  })
);

// logger
app.use(async (ctx, next) => {
  const start = new Date();
  await next();
  const ms = new Date() - start;
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`);
});

// routes
app.use(homePage.routes(), homePage.allowedMethods());
app.use(index.routes(), index.allowedMethods());
app.use(list.routes(), list.allowedMethods());
app.use(login.routes(), login.allowedMethods());
app.use(method.routes(), method.allowedMethods());
app.use(type.routes(), type.allowedMethods());
app.use(calendar.routes(), calendar.allowedMethods());

// error-handling
app.on("error", (err, ctx) => {
  console.error("server error", err, ctx);
});

module.exports = app;
