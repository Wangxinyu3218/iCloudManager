<template>
  <div>
    <!-- 使用子组件,使用-，不建议使用驼峰 -->
    <app-sidebar></app-sidebar>
    <app-navbar></app-navbar>
    <app-main></app-main>
  </div>
</template>

<script>
// 会导入./AppHeader下面的index.vue组件
import AppSidebar from "./AppSidebar";
import AppNavbar from "./AppNavbar";
import AppMain from "./AppMain";

// 导入子组件，缩写格式 AppHeader: AppHeader
export default {
  components: { AppSidebar, AppNavbar, AppMain },
};
</script>

<style scoped>
/* 左侧样式 */
.navbar {
  position: absolute;
  width: 200px;
  top: 0px;
  left: 100px;
  bottom: 0px;
  overflow-y: auto;
  background-color: #EBEEF3;
  /* box-shadow: 8px 0px 10px rgb(78 89 105 / 10%); */
  z-index: 5;
}
/* 左侧样式 */
.sidebar {
  position: absolute;
  background-color: #000000;
  width: 100px;
  top: 0px;
  left: 0px;
  bottom: 0px;
  overflow-y: auto;
  /* box-shadow: 8px 0px 10px rgb(78 89 105 / 10%); */
  z-index: 9999;
}
/* 主区域 */
.main {
  position: absolute;
  top: 0px;
  left: 300px;
  bottom: 0px;
  right: 0px; /* 距离右边0像素 */
  padding: 10px;
  overflow-y: auto; /* 当内容过多时y轴出现滚动条 */
  background-color: #ffffff;
}
</style>