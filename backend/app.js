const Koa = require("koa");
const app = new Koa();
const views = require("koa-views");
const json = require("koa-json");
const onerror = require("koa-onerror");
const bodyparser = require("koa-bodyparser");
const logger = require("koa-logger");

const index = require("./routes/index");
const users = require("./routes/users");
const login = require("./routes/login");
const homePage = require("./routes/homePage");
const list = require("./routes/list");
const pay_way = require("./routes/pay_way");
const pay_type = require("./routes/pay_type");

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
app.use(index.routes(), index.allowedMethods());
app.use(users.routes(), users.allowedMethods());
app.use(login.routes(), login.allowedMethods());
app.use(homePage.routes(), homePage.allowedMethods());
app.use(list.routes(), list.allowedMethods());
app.use(pay_way.routes(), pay_way.allowedMethods());
app.use(pay_type.routes(), pay_type.allowedMethods());

// error-handling
app.on("error", (err, ctx) => {
  console.error("server error", err, ctx);
});

module.exports = app;
