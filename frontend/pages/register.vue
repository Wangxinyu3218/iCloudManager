<template>
  <div id="userLayoutRegister" class="user-layout-wrapper">
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
            v-if="reg"
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
            <a-form-model-item prop="nickname">
              <div class="input2">
                <a-input
                  size="large"
                  v-model="loginForm.nickname"
                  placeholder="请输入昵称"
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
            <a-form-model-item prop="sex">
              <div class="input2">
                <a-select
                  size="large"
                  v-model="loginForm.sex"
                  a-select-placeholder="请选择性别"
                >
                  <a-select-option value="0"> 男 </a-select-option>
                  <a-select-option value="1"> 女 </a-select-option>
                </a-select>
              </div>
            </a-form-model-item>
            <div class="input">
              <a-button
                type="text"
                icon="rollback"
                style="float: left"
                @click="back"
              >
                返回登录
              </a-button>
              <a-button
                type="primary"
                @click="() => confirm('error')"
                icon="check-circle"
                style="float: right"
              >
                确 认
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
      reg: true,
      /* 登录框数据 */
      loginForm: { username: null, nickname: null, password: null, sex: null },
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
        nickname: [
          { required: true, message: "请输入昵称", trigger: "blur" },
          {
            min: 3,
            message: "昵称最少3位",
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
        sex: [
          {
            required: true,
            message: "请选择性别",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    /* 返回 */
    back() {
      this.$router.push("/login");
    },
    /* 注册 */
    confirm(type) {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          try {
            const loading = this.$loading({
              lock: true,
              text: "注册中",
              spinner: "el-icon-loading",
              background: "rgba(0, 0, 0, 0.7)",
            });
            setTimeout(async () => {
              const temp = {
                username: this.loginForm.username,
                nickname: this.loginForm.nickname,
                sex: this.loginForm.sex,
                password: crypto
                  .createHash("md5")
                  .update(this.loginForm.password)
                  .digest("hex"),
              };
              const response = await this.$axios.post("/user/register", temp);
              if (response.data.code === 200) {
                loading.close();
                this.$router.back();
                this.$notification.open({
                  message: "注册成功",
                  description: "请及时联系管理员分配角色",
                  duration: 10,
                });
              }
            }, 1300);
          } catch (error) {
            this.$notification[type]({
              message: response.data.msg,
            });
          }
        } else {
          this.$notification[type]({
            message: response.data.msg,
          });
          return false;
        }
      });
    },
  },
};
</script>
<style scoped lang="scss">
#userLayoutRegister.user-layout-wrapper {
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
    height: 630px;
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
