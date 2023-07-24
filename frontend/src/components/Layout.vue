<template>
  <div>
    <!-- 使用子组件,使用-，不建议使用驼峰 -->
    <app-header></app-header>
    <app-navbar></app-navbar>
    <app-main></app-main>
  </div>
</template>

<script>
// 会导入./AppHeader下面的index.vue组件
import AppHeader from "./AppHeader";
import AppNavbar from "./AppNavbar";
import AppMain from "./AppMain";

// 导入子组件，缩写格式 AppHeader: AppHeader
export default {
  components: { AppHeader, AppNavbar, AppMain }, // 有s
};
</script>

<style scoped>
/* 头部样式 */
.header {
  position: absolute;
  line-height: 60px;
  top: 0px;
  left: 0px;
  right: 0px;
  background-color: #ffffff;
  box-shadow: 0 8px 10px rgb(78 89 105 / 10%);
  z-index: 10;
}

/* 左侧样式 */
.navbar {
  position: absolute;
  width: 200px;
  top: 64px; /* 距离上面50像素 */
  left: 0px;
  bottom: 0px;
  overflow-y: auto; /* 当内容过多时y轴出现滚动条 */
  /* background-color: #f7f8fa; */
  box-shadow:  8px 0px 10px rgb(78 89 105 / 10%);
  z-index: 5;
}

/* 主区域 */
.main {
  position: absolute;
  top: 70px;
  left: 200px;
  bottom: 0px;
  right: 0px; /* 距离右边0像素 */
  padding: 10px;
  overflow-y: auto; /* 当内容过多时y轴出现滚动条 */
  background-color: #f7f8fa;
}
</style>