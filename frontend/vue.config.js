// vue.config.js
module.exports = {
  lintOnSave: false, //取消eslint
  // publicPath: "/",
  // outputDir: "dist",
  // assetsDir: "static",
  devServer: {
    port: 3000,
    proxy: {
      "/api": {
        target: "http://localhost:5555", //设置开发环境服务域名和端口号 别忘了加http
        changeOrigin: true, //這裡true表示实现跨域
        pathRewrite: {
          "^/api": "",
        },
      },
    },
    // https: false,
    // disableHostCheck: true,
    // open: false,
  },
  css: {
    loaderOptions: {
      sass: {
        sassOptions: { outputStyle: "expanded" },
      },
    },
  },
};
