<template>
  <!-- 使用element的导航菜单 -->
  <div class="navbar">
    <!--default-active默认选中的菜单，选中后颜色是 active-text-color  -->
    <!--  :router='true',true表示开启路由模式，开启之后，index值代表的就是路由地址-->
    <!--  :router='true'开启之后点击就会跳转到对应的路由，默认为false -->
    <!-- text-color 文字的颜色 -->
    <el-menu
      :router="true"
      default-active="/financialAnalysis"
      class="el-menu-vertical-demo"
      background-color="#ffffff"
      text-color="#4E5969"
      active-text-color="#165DFF"
    >
      <!-- 首页  class就是对应的icon -->
      <el-menu-item index="/financialAnalysis">
        <i class="el-icon-menu"></i>
        <span slot="title">财务分析</span>
      </el-menu-item>
      <!-- 会员管理 index下的左右 / 别忘记-->
      <el-menu-item index="/expenditureStatistics">
        <i class="el-icon-s-custom"></i>
        <span slot="title">支出统计</span>
      </el-menu-item>
      <!-- 字典 index下的左右 / 别忘记-->
      <el-menu-item index="/dict">
        <i class="el-icon-notebook-2"></i>
        <span slot="title">字典配置</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<style scoped>
/* 去掉右边框 */
.el-menu {
  border-right: none;
}
</style>
