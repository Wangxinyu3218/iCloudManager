<template>
  <div id="userLayoutLogin" class="user-layout-wrapper">
    <div class="container">
      <div class="top">
        <!-- logo -->
        <div class="header">
          <a href="/">
            <img src="~@/static/images/lg-pic.png" class="logo" alt="logo" />
          </a>
        </div>
        <!-- title -->
        <div class="desc">
          <div>财智通在线平台</div>
          <div>(iCloudManager)</div>
          <!-- form -->
          <a-form-model
            ref="loginForm"
            :model="loginForm"
            :rules="loginFormRules"
          >
            <a-form-model-item prop="username">
              <div class="input">
                <a-input
                  size="large"
                  v-model="loginForm.username"
                  placeholder="请输入用户名"
                />
              </div>
            </a-form-model-item>
            <a-form-model-item prop="password">
              <div class="input2">
                <a-input-password
                  size="large"
                  v-model="loginForm.password"
                  placeholder="请输入密码"
                />
              </div>
            </a-form-model-item>
            <div class="input">
              <a-button
                @click="() => login('error')"
                type="primary"
                icon="login"
                block
              >
                登 录
              </a-button>
            </div>
            <div class="input">
              <a-button
                type="link"
                @click="() => forget('warning')"
                icon="question"
                style="float: left"
              >
                忘记密码或用户异常
              </a-button>
              <a-button
                type="text"
                @click="register"
                icon="search"
                style="float: right"
              >
                注册
              </a-button>
            </div>
          </a-form-model>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import crypto from "crypto";
export default {
  data() {
    return {
      /* 登录框数据 */
      loginForm: { username: null, password: null },
      /* 登录框必填验证 */
      loginFormRules: {
        username: [
          { required: true, message: "请输入账户名", trigger: "blur" },
          {
            min: 3,
            message: "用户名最少3位",
            trigger: "blur",
          },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 6,
            max: 18,
            message: "密码6-18位",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    /* 登录 */
    async login(type) {
      this.$refs.loginForm.validate((valid) => {
        try {
          if (valid) {
            try {
              const loading = this.$loading({
                lock: true,
                text: "登录中",
                spinner: "el-icon-loading",
                background: "rgba(0, 0, 0, 0.7)",
              });
              setTimeout(async () => {
                const temp = {
                  username: this.loginForm.username,
                  password: crypto
                    .createHash("md5")
                    .update(this.loginForm.password)
                    .digest("hex"),
                };
                const response = await this.$axios.post("/user/login", temp);
                if (response.data.code === 200) {
                  loading.close();
                  this.$store.state.uuid = response.data.data[0].uuid;
                  this.$store.state.roleid = response.data.data[0].roleid;
                  this.$store.state.nickname = response.data.data[0].nickname;
                  this.$store.state.roleName = response.data.data[0].roleName;
                  this.$store.state.username = response.data.data[0].username;
                  this.$router.push("/manage/homePage");
                } else if (response.data.code === 404 || 500) {
                  loading.close();
                  this.$notification[type]({
                    message: response.data.msg,
                  });
                }
              }, 1300);
            } catch (error) {
              this.$notification[type]({
                message: response.data.msg,
              });
            }
          } else {
            console.log("error submit!");
            return false;
          }
        } catch (error) {}
      });
    },
    /* 忘记密码 */
    forget(type) {
      this.$notification[type]({
        message: "请联系管理员",
        description:
          "请添加管理员微信:15303423218,并告知你的账户名,在线时间9:00～22:00",
      });
    },
    /* 注册 */
    register() {
      this.$router.push("/register");
    },
  },
};
</script>

<style lang="scss" scoped>
#userLayoutLogin.user-layout-wrapper {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  min-height: 100%;
  width: 100%;
  background: #f0f2f5 url("@/static/images/background.svg") no-repeat 50%;
  background-size: 100%;
  padding-top: 1px;
  .container {
    width: 35%;
    background-color: #fff;
    height: 530px;
    margin: 110px auto;
    border-radius: 8px;
    box-shadow: 2px 2px 5px 3px rgb(228, 226, 226);
    position: relative;
    .top {
      text-align: center;
      padding-top: 40px;
      .header {
        height: 44px;
        line-height: 44px;
        .logo {
          height: 77px;
          vertical-align: top;
          margin-right: 16px;
          border-style: none;
        }
      }
      .desc {
        font-size: 28px;
        font-weight: bold;
        color: #1891ff;
        margin-top: 36px;
        margin-bottom: 20px;
        .input {
          margin: 30px 150px 0 150px;
        }
        .input2 {
          margin: 10px 150px 0 150px;
        }
      }
    }
  }
}
</style>
