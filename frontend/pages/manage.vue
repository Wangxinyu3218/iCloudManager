<template>
  <div class="container">
    <div class="topbar">
      <div :class="!isCollapse ? 'topbar_title' : 'topbar_nottitle'">
        <div v-if="!isCollapse" class="topbar_title_txt">财智通在线平台</div>
      </div>
      <div class="topbar_user">
        <div class="topbar_user_zhedie">
          <i
            v-if="!isCollapse"
            class="iconfont icon-zhedie1"
            @click="isCollapse = !isCollapse"
          ></i>
          <i
            v-else
            class="iconfont icon-zhedie2"
            @click="isCollapse = !isCollapse"
          ></i>
        </div>
        <div
          class="bread-crumb"
          :style="`left: ${!isCollapse ? '270px' : '134px'}`"
        >
          <el-tabs
            type="card"
            v-model="selectRouteValue"
            closable
            @tab-click="routeTabClick"
            @tab-remove="delSelectTag"
          >
            <!-- <el-tab-pane
              v-for="(tag, index) in Array.from(visitedViews)"
              :key="index"
              :label="tag.title"
              :name="tag.name"
            >
            </el-tab-pane> -->
          </el-tabs>
        </div>
        <div class="topbar_user_list">
          <div><i class="iconfont icon-yonghu"></i></div>
          <div>
            <el-dropdown trigger="click">
              <span class="el-dropdown-link">
                {{ this.$store.state.nickname + " | "
                }}{{ this.$store.state.roleName || "待分配"
                }}<i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <!-- <div @click="handleSetting"> -->
                <div @click="setting">
                  <el-dropdown-item>设 置</el-dropdown-item>
                </div>
                <div @click="logout">
                  <el-dropdown-item>退 出</el-dropdown-item>
                </div>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
      </div>
    </div>
    <el-menu
      class="el-menu-vertical-demo"
      @open="handleOpen"
      @close="handleClose"
      :collapse="isCollapse"
      router
    >
      <el-menu-item
        v-for="(item, index) in menuList"
        :key="index"
        :index="item.path"
        @click.native="menuItemClick(item.name)"
      >
        <i :class="item.icon"></i>
        <span slot="title">{{ item.name }}</span>
      </el-menu-item>
    </el-menu>

    <div :class="!isCollapse ? 'nuxtcontentF' : 'nuxtcontentT'">
      <nuxt-child />
    </div>
    <a-modal
      title="个人信息"
      okText="再考虑一下"
      cancelText="确认修改"
      @ok="cancel"
      @cancel="confirm"
      :visible="visible"
      :closable="false"
      loading
    >
      <a-form-model
        ref="ruleForm"
        :model="form"
        :rules="rules"
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
      >
        <a-form-model-item label="用户id">
          {{ form.uuid }}
        </a-form-model-item>
        <a-form-model-item label="用户名">
          {{ form.username }}
        </a-form-model-item>
        <a-form-model-item label="昵称" prop="nickname">
          <a-input v-model="form.nickname" />
        </a-form-model-item>
        <a-form-model-item label="性别">
          <span v-show="this.form.sex == '0'">{{ "男" }}</span>
          <span v-show="this.form.sex == '1'">{{ "女" }}</span>
        </a-form-model-item>
        <a-form-model-item label="创建时间">
          {{ form.createtime }}
        </a-form-model-item>
        <a-form-model-item label="状态">
          <span v-show="this.form.sex == '0'" style="color: #64d98a">{{
            "使用中"
          }}</span>
        </a-form-model-item>
        <a-form-model-item label="密码" prop="password">
          <a-input-password :maxLength="12" v-model="form.password" />
        </a-form-model-item> </a-form-model
    ></a-modal>
  </div>
</template>
<script>
import crypto from "crypto";
export default {
  data() {
    return {
      loading: false,
      visible: false,
      isCollapse: false,
      selectRouteValue: "",

      labelCol: { span: 8 },
      wrapperCol: { span: 15 },
      other: "",
      form: {
        uuid: null,
        username: null,
        nickname: null,
        sex: null,
        createtime: null,
        state: null,
        password: null,
      },
      rules: {
        nickname: [
          {
            required: true,
            message: "请输入昵称",
            trigger: "blur",
          },
          {
            min: 1,
            message: "至少1位",
            trigger: "blur",
          },
        ],
        password: [
          {
            required: true,
            message: "请输入密码",
            trigger: "blur",
          },
          {
            min: 6,
            max: 12,
            message: "6~12位",
            trigger: "blur",
          },
        ],
      },
    };
  },
  computed: {
    // visitedViews() {
    //   //store中取值
    //   return this.$store.state.tagsview.visitedviews;
    // },
  },
  asyncData({ app }) {
    let menuList = [];
    menuList = [
      {
        name: "首页",
        path: "/manage/homePage",
        icon: "iconfont icon-shouye",
      },
    ];
    return { menuList: menuList };
  },
  watch: {
    $route(route) {
      // console.log(route)
      this.menuList.forEach((item) => {
        if (route.fullPath == item.path) {
          this.addViewTags(item);
        }
      });
    },
  },
  created() {
    if (this.$store.state.uuid == null || this.$store.state.roleid == null) {
      this.$router.push("/login");
      this.$notification.open({
        message: "错误",
        description: "请重新登录",
        duration: 6,
      });
    }
    this.menu();
  },
  methods: {
    async menu() {
      const response = await this.$axios.get(
        `role/findRole?roleid=${this.$store.state.roleid}`
      );
      try {
        this.spinning = true;
        const menu = JSON.parse(response.data.data[0].menu);
        this.menuList = menu;
      } catch (error) {}
    },
    async setting() {
      this.visible = true;
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      const response = await this.$axios.get(
        `setting/findUser?username=${this.$store.state.username}&uuid=${this.$store.state.uuid}`
      );
      this.form = response.data.list[0];
      this.form.password = null;
      loading.close();
    },
    cancel() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
    confirm() {
      this.$refs.ruleForm.validate(async (valid) => {
        if (valid) {
          const loading = this.$loading({
            lock: true,
            text: "通信中",
            spinner: "el-icon-loading",
            background: "rgba(0, 0, 0, 0.7)",
          });
          setTimeout(async () => {
            const pwd = crypto
              .createHash("md5")
              .update(this.form.password)
              .digest("hex");
            const response = await this.$axios.get(
              `setting/updateUser?uuid=${this.form.uuid}&nickname=${this.form.nickname}&password=${pwd}`
            );
            try {
              this.$notification.open({
                message: response.data.msg,
                duration: 5,
              });
              this.$store.state.nickname = this.form.nickname;
              this.visible = false;
              loading.close();
            } catch (error) {
              this.visible = false;
              loading.close();
            }
          }, 2000);
        } else {
          loading.close();
          return false;
        }
      });
    },
    logout() {
      const loading = this.$loading({
        lock: true,
        text: "退出中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.$store.state.uuid = null;
      this.$store.state.roleid = null;
      this.$store.state.nickname = null;
      this.$store.state.roleName = null;
      setTimeout(async () => {
        loading.close();
        this.$router.push("/login");
        this.$notification.open({
          message: "成功",
          description: "已退出登录",
          duration: 6,
        });
      }, 1300);
    },
    handleSetting() {
      console.log("setting");
    },
    // 导航菜单折叠展开触发
    handleOpen(key, keyPath) {
      // console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      // console.log(key, keyPath);
    },
    menuItemClick(name) {
      this.selectRouteValue = name;
    },
    isActive(route) {
      return route.path == this.$route.path;
    },
    addViewTags(row) {
      //路由改变时执行的方法
      if (this.$route.name) {
        const route = this.$route;

        this.$store.dispatch("tagsview/addVisitedViews", row);
      }
    },
    routeTabClick(route) {
      console.log(route);
      this.menuList.forEach((item) => {
        if (item.name == route.name) {
          this.$router.push(item.path);
        }
      });
    },
    delSelectTag(route) {
      //先提交删除数据的方法,数组删除出掉数据后，如果关闭的是当前打开的路由需要将路由改为数组最后一次push进去的路由
      this.menuList.forEach((item) => {
        if (item.name == route) {
          this.$store
            .dispatch("tagsview/delVisitedViews", item)
            .then((views) => {
              if (this.isActive(item)) {
                //只有在关闭当前打开的标签页才会有影响
                let lastView = views.slice(-1)[0]; //选取路由数组中的最后一位
                if (lastView) {
                  this.$router.push(lastView.path);
                } else {
                  this.$router.push("/");
                }
              }
            });
        }
      });
    },
  },
};
</script>
<style scope lang="scss">
.container {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: #f2f2f2;
  .topbar {
    width: 100%;
    height: 60px;
    display: flex;
    position: relative;
    z-index: 999;
    box-shadow: 0 5px 10px rgba(64, 158, 255, 0.2);
    background: #fff;
    .topbar_title {
      width: 200px;
      background: #409eff;
      height: 60px;
      line-height: 60px;
      transition: all 0.3s ease-in-out;
    }
    .topbar_nottitle {
      width: 64px;
      background: #409eff;
      height: 60px;
      transition: all 0.3s ease-in-out;
    }
    .topbar_title_txt {
      color: #fff;
      text-align: center;
      font-size: 22px;
      font-weight: bold;
      font-family: -apple-system, BlinkMacSystemFont, Segoe UI, PingFang SC,
        Hiragino Sans GB, Microsoft YaHei, Helvetica Neue, Helvetica, Arial,
        sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
    }
    .topbar_user {
      display: flex;
      flex: 1;
      // justify-content: space-between;
      .topbar_user_zhedie {
        width: 60px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        i {
          font-size: 20px;
        }
      }
      .topbar_user_list {
        width: 200px;
        height: 60px;
        line-height: 60px;
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-around;
        margin-right: 30px;
      }
      .bread-crumb {
        flex: 1;
        transition: all 0.3s ease-in-out;
        display: flex;
        align-items: center;
        .el-tabs {
          height: 40px;
        }
        .active {
          color: #409eff;
        }
        .el-tabs--card > .el-tabs__header {
          border: none;
        }
        .el-tabs--card > .el-tabs__header .el-tabs__nav {
          border: none;
        }
        .el-tabs--card > .el-tabs__header .el-tabs__item {
          border: none;
        }
        .el-tabs__item {
          padding: 0 10px;
        }
      }
    }
  }
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    position: fixed;
    top: 60px;
    left: 0;
    bottom: 0;
    box-shadow: 5px 0px 10px rgba(64, 158, 255, 0.2);
  }
  .el-menu-vertical-demo {
    position: fixed;
    top: 60px;
    left: 0;
    bottom: 0;
    box-shadow: 5px 0px 10px rgba(64, 158, 255, 0.2);
  }

  .nuxtcontentF {
    position: fixed;
    top: 60px;
    left: 200px;
    right: 0;
    height: 100%;
    overflow-y: scroll;
    padding: 25px;
    padding-bottom: 85px;
    transition: all 0.3s ease-in-out;
  }
  .nuxtcontentT {
    position: fixed;
    top: 60px;
    left: 64px;
    right: 0;
    height: 100%;
    overflow-y: scroll;
    padding: 25px;
    padding-bottom: 85px;
    transition: all 0.3s ease-in-out;
  }

  // element ui 样式修改
  .el-table--striped .el-table__body tr.el-table__row--striped td {
    background: #f3f7fd;
  }

  // 公共style
  #page-xq {
    //  详情页style
    position: absolute;
    left: 0;
    top: 40px;
    right: 0;
    bottom: 0;
    background: #f2f2f2;
    z-index: 2;
    border-radius: 10px;
  }
  .line {
    //   分割线
    width: 100%;
    height: 1px;
    background: #dcdfe6;
  }
}
</style>
