<template>
  <!-- 使用element的导航菜单 -->
  <div class="navbar">
    <!--default-active默认选中的菜单，选中后颜色是 active-text-color  -->
    <!--  :router='true',true表示开启路由模式，开启之后，index值代表的就是路由地址-->
    <!--  :router='true'开启之后点击就会跳转到对应的路由，默认为false -->
    <!-- text-color 文字的颜色 -->
    <div class="personal-top">
      <div class="avater">
        <el-avatar :size="100" class="image"></el-avatar>
      </div>
    </div>
    <div class="personal-bottom">
      <div class="info">
        <div class="welcome">Welcome Back</div>
      </div>
      <div class="info">
        <div class="username">{{ this.$store.state.nick_name }}</div>
      </div>
    </div>
    <el-menu
      :router="true"
      class="el-menu-vertical-demo"
      background-color="#EBEEF3"
      text-color="#4e5969"
      default-active="/dashboard"
      active-text-color="#2E4742"
    >
      <el-menu-item index="/dashboard">
        <i class="el-icon-menu"></i>
        <span slot="title" style="font-weight: bold">Dashboard</span>
      </el-menu-item>
      <el-menu-item index="/bookkeeping">
        <i class="el-icon-document"></i>
        <span slot="title" style="font-weight: bold">Bookkeeping</span>
      </el-menu-item>
      <el-menu-item index="/calendar">
        <i class="el-icon-date"></i>
        <span slot="title" style="font-weight: bold">Calendar</span>
      </el-menu-item>
      <el-menu-item index="/dict">
        <i class="el-icon-edit-outline"></i>
        <span slot="title" style="font-weight: bold">Dict</span>
      </el-menu-item>
      <el-menu-item index="/user">
        <i class="el-icon-user"></i>
        <span slot="title" style="font-weight: bold">User</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<style scoped>
/* 去掉右边框 */
.el-menu {
  border-right: none;
}
.personal-top {
  display: flex;
  justify-content: center;
}
.personal-bottom {
  justify-content: center;
}
.avater {
  margin: 20px;
  margin-top: 30px;
}
.image {
  background-image: url(@/assets/avater.png);
  width: 100px;
  height: 100px;
}
.info {
  display: flex;
  justify-content: center;
}
.welcome {
  margin: 10px;
  font-size: 16px;
}
.username {
  /* margin: 10px; */
  font-size: 22px;
  font-weight: bold;
}
.el-menu-vertical-demo {
  margin-top: 60px;
}
</style>
