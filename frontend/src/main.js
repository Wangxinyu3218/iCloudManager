import Vue from "vue";
import ElementUI from "element-ui"; // 引用element-ui组件库
// import 'element-ui/lib/theme-chalk/index.css'; // 引用样式
import "./assets/styles/element-variables.scss";
import "@/assets/styles/index.scss"; // global css
import "@/assets/styles/ruoyi.scss"; // ruoyi css
import App from "./App.vue";
import store from "./store"; // 引入 store 文件
import router from "./router";
import http from "@/api/axios.js"; //全局注册axios
import Pagination from "@/components/Pagination"; // 分页组件
import BreadCrumbModel from "@/components/BreadCrumbModel"; // 分页组件
import directive from "./directive"; // directive
import "./premission";

Vue.prototype.$axios = http;
Vue.config.productionTip = false;
Vue.use(ElementUI);
Vue.component("Pagination", Pagination);
Vue.component("BreadCrumbModel", BreadCrumbModel);
Vue.use(directive);

new Vue({
  store,
  router,
  render: (h) => h(App),
}).$mount("#app");
