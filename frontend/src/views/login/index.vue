<template>
  <div id="login">
    <!-- 这是登录页 -->
    <div class="login">
      <div>
        <h2>Arco 个人财会平台</h2>
        <img class="img_left" src="@/assets/images/login.png" alt="" />
      </div>
      <div class="right_box">
        <img
          class="img_right"
          src="@/assets/images/renyuanrenzheng.png"
          alt=""
        />
        <el-form class="demo-form-inline" label-position="right">
          <el-form-item>
            <el-input
              class="inputt"
              placeholder="请输入账号"
              v-model="shyh_sjh"
            >
              <i
                slot="prefix"
                style="display: flex; align-items: center; margin: 10px 0 0 0"
              >
                <img
                  style="width: 20px; height: 20px"
                  src="@/assets/images/yonghu-fuben.png"
                  alt
                />
              </i>
            </el-input>
          </el-form-item>

          <el-form-item>
            <el-input
              class="inputt"
              placeholder="请输入密码"
              v-model="shyh_mm"
              show-password
              minlength="6"
            >
              <i
                slot="prefix"
                style="display: flex; align-items: center; margin: 10px 0 0 0"
              >
                <img
                  style="width: 20px; height: 20px"
                  src="@/assets/images/password.png"
                  alt
                />
              </i>
            </el-input>
          </el-form-item>
          <div class="button">
            <el-button type="primary" @click="denglu">登录</el-button>
          </div>
        </el-form>
      </div>
    </div>
    <div class="btm_bq">天津星与火餐饮有限公司2020-2023</div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      shyh_sjh: "",
      shyh_mm: "",
      dqlist: [
        {
          dq_jc: 0,
          dq_mc: "黄金糕",
        },
      ],
      dq_jc: "",
      loading: null,
    };
  },
  //路由守卫，路由改变时关闭遮罩层
  beforeRouteUpdate(to, from, next) {
    console.log("87788");
    this.loading.close();
    next();
  },
  activated() {},
  watch: {},
  created() {},
  mounted() {
    // this.getDq();
    // this.setDq();
    // this.isLogin();
  },
  methods: {
    async getDq() {
      var dqlist = [];
      try {
        dqlist = await this.postAxiosCatch("resource/listDq", {
          baseUrl: "https://qb.cibroad.com/",
        });
        console.log(dqlist, "dqlist");
        this.dqlist = dqlist.data;
        // this.dq_bm = dqlist.data[0].dq_bm;
      } catch (e) {
        console.log(e, "catch");
      }
    },
    isLogin() {
      var authorization = localStorage.getItem("authorization");
      console.log(authorization, "authorization");
      if (authorization) {
        this.$router.push("/financialAnalysis");
      }
    },
    async denglu() {
      // this.postAxios("shd/login/loginBySjhAndPass", {
      //   shyh_sjh: this.shyh_sjh,
      //   shyh_mm: this.shyh_mm,
      // }).then((res) => {
      //   this.loading = this.$loading({
      //     lock: true,
      //     text: "登录中",
      //     spinner: "el-icon-loading",
      //     background: "#333333",
      //   });
      const temp = {
        username: this.shyh_sjh,
      };
      let data = await this.$axios.post(`/api/test/login`, temp);
      if (data.data[0] == null) {
        this.$message.error("用户名不存在");
      } else if (this.shyh_mm != data.data[0].password) {
        this.$message.error("用户名或密码错误");
      } else if (this.shyh_mm == data.data[0].password) {
        this.$message.success("登录成功");
        this.$router.push("/financialAnalysis");
      }
    },
    setDq() {
      console.log("1111");
      localStorage.setItem("shdregion", this.dq_jc);
    },
  },
};
</script>
<style lang="scss">
input {
  border: none;
}
#login {
  // min-height: 100vh;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url(@/assets/images/bg.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  overflow: hidden;
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
        width: 64px;
        height: 64px;
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
    color: #fff;
  }
}
</style>
