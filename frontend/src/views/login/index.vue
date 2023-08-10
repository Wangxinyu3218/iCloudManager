<template>
  <div id="login">
    <div class="login-block">
      <div class="block-title">Welcome To PWMS!</div>
      <div class="bigbox">
        <div class="block-font">
          <el-form :inline="true" label-width="80px">
            <div class="block-username">
              <el-form-item
                ><span class="user-name">account:</span>
                <el-input placeholder="请输入账号" v-model="user_name" />
              </el-form-item>
            </div>
            <div class="block-password">
              <el-form-item>
                <span class="user-name">password:</span>
                <el-input
                  placeholder="请输入密码"
                  v-model="user_password"
                  show-password
                  minlength="6"
                />
              </el-form-item>
            </div>
          </el-form>
        </div>
        <div class="block-image">
          <img
            class="img"
            :style="{
              transform: 'rotate(' + rotateDegree + 'deg)',
            }"
            src="@/assets/coins.png"
            @click="denglu"
          />
        </div>
      </div>
    </div>
    <div class="btm_bq">
      © All Rights Reserved 2023 · iStarDeer Tianjin Ltd
    </div>
  </div>
</template>
<script>
import { login } from "@/api/login";
export default {
  data() {
    return {
      user_name: null,
      user_password: null,
      rotateDegree: 0,
    };
  },
  mounted() {
    const screenWidth =
      window.innerWidth ||
      document.documentElement.clientWidth ||
      document.body.clientWidth;
    if (screenWidth < 1293) {
      window.location.href = "/error.html";
    }
  },
  methods: {
    denglu() {
      this.rotateDegree += 360;
      setTimeout(() => {
        const temp = {
          user_name: this.user_name,
          user_password: this.user_password,
        };
        login(temp).then((res) => {
          if (res.user_id != null) {
            this.$store.state.user_id = res.user_id;
            this.$store.state.nick_name = res.nick_name;
            this.$message.success(res.msg);
            this.$router.push("/dashboard");
          } else {
            this.$message.error(res.msg);
          }
        });
      }, 1500); // 延迟1秒执行
    },
  },
};
</script>
<style lang="scss" scoped>
input {
  border: none;
}
#login {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  // display: flex;
  // justify-content: center;
  align-items: center;
  background-image: url(@/assets/bg5.png);
  background-repeat: no-repeat;
  background-size: cover;
  overflow: hidden;
  .login-block {
    margin-top: 15%;
    margin-left: 5%;
    // border-style: solid;
    width: 40%;
    height: 50%;
    .block-title {
      // margin-top: 5%;
      // margin-left: 5%;
      font-size: 50px;
      font-weight: bold;
      // border-style: solid;
      width: 100%;
      height: 20%;
    }
    .bigbox {
      display: flex;
      .block-font {
        // border-style: solid;
        width: 45%;
        height: 100%;
        .block-username {
          margin-top: 5%;
          width: 100%;
          height: 20%;
          // border-style: solid;
        }
        .block-password {
          margin-top: 5%;
          width: 100%;
          height: 20%;
          // border-style: solid;
        }
      }
      .block-image {
        margin-left: 2%;
        margin-top: 3%;
        // border-style: solid;
        width: 30%;
        background-repeat: no-repeat;
        // background-image: url("@/assets/coins.png");
        .img {
          width: 100%;
          height: 100%;
          transition: transform 1s ease-in-out;
        }
      }
    }
  }
  .login {
    background-color: #fff;
    border-radius: 15px;
    padding: 75px;
    // width: 450px;
    // height: 360px;
    display: flex;
    h2 {
      text-align: center;
      // letter-spacing: 16px;
      color: #0088fe;
    }
    .img_left {
      margin-top: 60px;
      width: 353px;
      height: 285px;
    }
    .right_box {
      //   display: flex;
      // justify-content: center;
      margin-left: 120px;
      text-align: center;
      .inputt .el-input__inner {
        padding-left: 50px;
        border-radius: 0;
        border-bottom: 1px solid #dcdfe6;
        border-top: none;
        border-right: none;
        border-left: none;
        background: #fff;
      }
      .img_right {
        width: 114px;
        height: 114px;
        border-radius: 50%;
        background-image: url("@/assets/images/renyuanrenzheng.png");
        .el-form-item {
          margin-bottom: 15px;
        }
      }
    }

    .demo-form-inline {
      margin-top: 30px;

      .button {
        width: 300px;
        margin-top: 50px;
        text-align: center;
        .el-button {
          width: 300px;
        }
      }
    }
  }
  .btm_bq {
    position: absolute;
    left: 50%;
    width: 600px;
    text-align: center;
    margin-left: -300px;
    bottom: 50px;
    color: #190202;
  }
}
.user-name {
  color: #190202;
  font-size: 22px;
  font-family: serif;
  font-style: italic;
}
</style>
