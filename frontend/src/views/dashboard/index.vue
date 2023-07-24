<template>
  <div id="Dashboard-Page">
    <div class="hander">
      <div class="overview">
        <div class="overview-title" @click="overviewOpen">Overview</div>
        <div class="overview-list">
          <div class="overview-item">
            <div class="item-amount">
              ${{ dashboard.residue || "0"
              }}<span class="amount-precent">{{ "" }}</span>
            </div>
            <div class="item-tip">residue</div>
          </div>
          <div class="overview-item">
            <div class="item-amount-2">
              ${{ dashboard.expenditure || "0"
              }}<span class="amount-precent-2">{{ "" }}</span>
            </div>
            <div class="item-tip-2">expenditure</div>
          </div>
          <div class="overview-item">
            <div class="item-amount-2">
              ${{ dashboard.income || "0"
              }}<span class="amount-precent-2">{{ "" }}</span>
            </div>
            <div class="item-tip-2">income</div>
          </div>
        </div>
      </div>
      <div class="limit">
        <div class="limit-title">Limit</div>
        <div class="limit-list">
          <div class="limit-item">
            <el-progress
              type="circle"
              :percentage="dashboard.precent"
              :width="90"
            ></el-progress>
          </div>
          <div class="limit-tip">
            {{
              "$" +
              (dashboard.expenditure || 0) +
              " " +
              "total amount" +
              " " +
              (dashboard.limit || 0)
            }}
          </div>
        </div>
      </div>
    </div>
    <div class="middle" v-show="isShow">
      <div class="expenses">
        <div class="expense-title-list">
          <div class="expense-title">Expense</div>
          <div class="expense-title-2">Contrast</div>
        </div>
        <div class="expense-main">
          <div class="expense-card-list">
            <el-card class="expense-card" style="background-color: #e6f5fa">
              <div class="card-title">${{ dashboard.food || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/food.png" />
              </div>
            </el-card>
            <el-card class="expense-card-2" style="background-color: #eefcef">
              <div class="card-title">${{ dashboard.traffic || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/traffic.png" />
              </div>
            </el-card>
            <el-card class="expense-card-2" style="background-color: #f0f4ff">
              <div class="card-title">${{ dashboard.living || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/living.png" />
              </div>
            </el-card>
            <el-card class="expense-card" style="background-color: #f9f8f3">
              <div class="card-title">${{ dashboard.antCredit || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/huabei.png" />
              </div>
            </el-card>
            <el-card class="expense-card-2" style="background-color: #dbdde9">
              <div class="card-title">${{ dashboard.lucky || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/lu.png" />
              </div>
            </el-card>
            <el-card class="expense-card-2" style="background-color: #ebeef3">
              <div class="card-title">${{ dashboard.shopping || "0" }}</div>
              <div class="card-date">{{ dashboard.thisMonth || "0" }}</div>
              <div class="card-image">
                <img class="img" src="@/assets/shopping.png" />
              </div>
            </el-card>
          </div>
          <div class="expense-list">
            <el-card class="expense-data"
              ><el-table :data="dataList" v-loading="loading" height="420px"
                ><el-table-column
                  label="id"
                  type="index"
                  :index="indexMethod"
                ></el-table-column>
                <el-table-column
                  label="catagroy"
                  prop="list_name"
                ></el-table-column>
                <el-table-column
                  label="amount"
                  prop="list_amount"
                ></el-table-column>
                <el-table-column
                  label="date"
                  prop="list_date"
                ></el-table-column> </el-table
            ></el-card>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom">
      <div class="schedule-title" @click="addSchedule">Schedule</div>
      <el-card class="schedule-list"
        ><el-table :data="scheduleList" v-loading="loading">
          <el-table-column label="Topic" prop="topic"></el-table-column>
          <el-table-column label="Detail" prop="details"></el-table-column>
          <el-table-column
            label="CreateTime"
            prop="createDate"
          ></el-table-column
          ><el-table-column label="state"
            ><template slot-scope="scope">
              <span v-show="scope.row.state == '0'" style="color: #00bfbf">{{
                "standing by"
              }}</span>
              <span v-show="scope.row.state == '1'" style="color: #333333">{{
                "complete"
              }}</span>
            </template></el-table-column
          >
          <el-table-column label="action">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="edit(scope.row)"
                >edit</el-button
              >
              <el-button
                size="mini"
                type="text"
                @click="del(scope.row)"
                style="color: red"
                >delete</el-button
              >
            </template>
          </el-table-column></el-table
        >
        <pagination
          v-show="total >= 0"
          :total="total"
          :page.sync="queryParams.page"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-card>
    </div>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="overview"
      width="400px"
      :close-on-click-modal="false"
    >
      <el-form
        ref="overviewForm"
        :model="overviewForm"
        label-width="100px"
        append-to-body
        :rules="overviewFormRules"
      >
        <el-form-item label="residue：" prop="bk_residue">
          <el-input
            v-model="overviewForm.bk_residue"
            placeholder="Pleae enter residue..."
            type="number"
            min="1"
          ></el-input>
        </el-form-item>
        <el-form-item label="limit：" prop="bk_limit">
          <el-input
            v-model="overviewForm.bk_limit"
            placeholder="Pleae enter limit..."
            type="number"
            min="1"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="updateOverview">update</el-button>
        <el-button @click="cancel">cancel</el-button>
      </div>
    </el-dialog>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="schedule"
      width="420px"
      :close-on-click-modal="false"
    >
      <el-form
        ref="scheduleForm"
        :model="scheduleForm"
        label-width="140px"
        append-to-body
        :rules="scheduleFormRules"
      >
        <el-form-item label="topic：" prop="topic">
          <el-input
            v-model="scheduleForm.topic"
            placeholder="Pleae enter topic..."
          ></el-input>
        </el-form-item>
        <el-form-item label="detail：" prop="details">
          <el-input
            v-model="scheduleForm.details"
            placeholder="Pleae enter detail..."
          ></el-input>
        </el-form-item>
        <el-form-item label="createTime：" prop="createDate">
          <el-date-picker
            v-model="scheduleForm.createDate"
            type="date"
            placeholder="Pleae select date..."
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="state：" prop="state">
          <el-select
            v-model="scheduleForm.state"
            placeholder="Please select state"
            clearable
          >
            <el-option
              v-for="item in stateList"
              :key="item.stateValue"
              :label="item.stateContent"
              :value="item.stateValue"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="updateSchedule" v-if="pbtoken"
          >update</el-button
        >
        <el-button type="primary" @click="confirmSchedule" v-else-if="!pbtoken"
          >confirm</el-button
        >
        <el-button @click="cancel">cancel</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  dashboard,
  getDashboard,
  lastDashboard,
  selectDashboard,
  selectSchedule,
  updateDashboard,
  scheduleId,
  deleteScid,
  updateSchedule,
  addSchedule,
} from "@/api/homePage";
export default {
  data() {
    return {
      isShow: true,
      total: 0,
      title: null,
      overview: false,
      schedule: false,
      loading: true,
      sort_id: null,
      pbtoken: false,
      bk_id: this.$store.state.user_id,
      dataList: [],
      scheduleList: [],
      overviewFormRules: {
        bk_residue: [
          {
            required: true,
            message: "Please enter residue...",
            trigger: "blur",
          },
        ],
        bk_limit: [
          {
            required: true,
            message: "Please enter limit...",
            trigger: "blur",
          },
        ],
      },
      scheduleFormRules: {
        topic: [
          {
            required: true,
            message: "Please enter topic...",
            trigger: "blur",
          },
        ],
        details: [
          {
            required: true,
            message: "Please enter detail...",
            trigger: "blur",
          },
        ],
        createDate: [
          {
            required: true,
            message: "Please select createDate...",
            trigger: "change",
          },
        ],
        state: [
          {
            required: true,
            message: "Please select state...",
            trigger: "change",
          },
        ],
      },
      stateList: [
        {
          stateValue: 1,
          stateContent: "complete",
        },
        {
          stateValue: 0,
          stateContent: "standing by",
        },
      ],
      dashboardO: {
        bk_id: this.$store.state.user_id,
        createDate: null,
      },
      dashboard: {
        bk_id: this.$store.state.user_id,
        createDate: null,
        percent: null,
      },
      queryParams: {
        bk_id: this.$store.state.user_id,
        page: 1,
        pageSize: 10,
      },
      overviewForm: {
        bk_id: this.$store.state.user_id,
        bk_residue: null,
        bk_limit: null,
      },
      scheduleForm: {
        bk_id: this.$store.state.user_id,
        sort_id: this.sort_id,
        topic: null,
        detail: null,
        createDate: null,
        state: null,
      },
    };
  },
  created() {
    // if (this.$store.state.user_id == null) {
    //   this.$message.error("登录失效请重新登录");
    //   this.$router.push("/");
    // }
    if (this.$store.state.user_id != 825901) {
      this.isShow = false;
    }
    console.log(this.$store.state.user_id);
    this.getDashboard();
    this.countLastDashboard();
    this.getLastDashboard();
    this.getList();
  },
  methods: {
    indexMethod(index) {
      return index + 1;
    },
    overviewOpen() {
      this.overview = true;
      getDashboard(this.queryParams).then((response) => {
        this.overviewForm = response;
      });
    },
    updateOverview() {
      const temp = {
        bk_id: this.$store.state.user_id,
        bk_residue: this.overviewForm.bk_residue,
        bk_limit: this.overviewForm.bk_limit,
      };
      this.$refs["overviewForm"].validate((valid) => {
        if (valid) {
          updateDashboard(temp).then((response) => {
            if (response.msg == "success") {
              this.getDashboard();
              this.overview = false;
            } else {
              this.$message.error(`failed`);
            }
          });
        }
      });
    },
    getDashboard() {
      let moment = require("moment");
      let date = new Date();
      let today = moment(date).format("YYYY-MM-DD");
      this.dashboardO.createDate = today;
      dashboard(this.dashboardO).then((response) => {
        this.dashboard = response;
        this.dashboard.precent = Math.floor(
          (response.expenditure / response.limit) * 100
        );
      });
    },
    countLastDashboard() {
      lastDashboard(this.dashboard).then((response) => {
        // console.log(response);
      });
    },
    getLastDashboard() {
      selectDashboard(this.dashboard).then((response) => {
        this.dataList = response;
        this.loading = false;
      });
    },
    getList() {
      selectSchedule(this.queryParams).then((response) => {
        this.scheduleList = response.list;
        this.total = response.total;
        this.loading = false;
      });
    },
    addSchedule() {
      this.schedule = true;
      this.pbtoken = false;
      this.scheduleForm = {};
    },
    edit(row) {
      this.sort_id = null;
      this.schedule = true;
      this.pbtoken = true;
      const temp = {
        sort_id: row.sort_id,
      };
      scheduleId(temp).then((response) => {
        this.scheduleForm = response;
      });
    },
    del(row) {
      const temp = {
        sort_id: row.sort_id,
      };
      deleteScid(temp).then((response) => {
        this.scheduleForm = response;
        if (response.msg == "删除成功") {
          this.$message.success(`complete`);
          this.getList();
        } else {
          this.$message.error(`error`);
        }
      });
    },
    updateSchedule() {
      this.$refs["scheduleForm"].validate((valid) => {
        if (valid) {
          updateSchedule(this.scheduleForm).then((response) => {
            if (response.msg == "success") {
              this.$message.success(`complete`);
              this.getList();
              this.schedule = false;
              this.$refs["scheduleForm"].resetFields();
            } else {
              this.$message.error(`failed`);
            }
          });
        }
      });
    },
    confirmSchedule() {
      (this.scheduleForm.bk_id = this.$store.state.user_id),
        this.$refs["scheduleForm"].validate((valid) => {
          if (valid) {
            addSchedule(this.scheduleForm).then((response) => {
              if (response.msg == "success") {
                this.$message.success(`complete`);
                this.getList();
                this.schedule = false;
                this.$refs["scheduleForm"].resetFields();
              } else {
                this.$message.error(`failed`);
              }
            });
          }
        });
    },
    cancel() {
      this.overview = false;
      this.schedule = false;
      this.$refs["scheduleForm"].resetFields();
    },
  },
};
</script>

<style lang="scss" scoped>
#Dashboard-Page {
  .hander {
    display: flex;
    width: 100%;
    .overview {
      width: 50%;
      .overview-title {
        margin-top: 20px;
        margin-left: 20px;
        width: 100%;
      }
      .overview-list {
        display: flex;
        margin-top: 40px;
        margin-left: 20px;
        width: 100%;
        .overview-item {
          width: 30%;
          .item-amount {
            font-size: 24px;
            font-weight: bold;
            width: 100%;
            .amount-precent {
              margin-left: 10px;
              font-size: 16px;
              color: rgb(207, 81, 31);
              width: 100%;
            }
          }
          .item-amount-2 {
            margin-left: 10px;
            font-size: 24px;
            font-weight: bold;
            width: 100%;
            .amount-precent-2 {
              margin-left: 10px;
              font-size: 16px;
              color: rgb(207, 81, 31);
              width: 100%;
            }
          }
          .item-tip {
            margin-top: 10px;
            color: rgb(155, 147, 144);
            width: 100%;
          }
          .item-tip-2 {
            margin-top: 10px;
            margin-left: 10px;
            color: rgb(155, 147, 144);
            width: 100%;
          }
        }
      }
    }
    .limit {
      width: 50%;
      .limit-title {
        margin-top: 20px;
        margin-left: 20px;
        width: 100%;
      }
      .limit-list {
        display: flex;
        margin-top: 10px;
        margin-left: 20px;
        .limit-tip {
          font-size: 20px;
          margin-top: 30px;
          margin-left: 20px;
          font-weight: bold;
          color: rgb(111, 133, 229);
        }
      }
    }
  }
  .middle {
    // border-style: solid
    margin: 20px;
    margin-top: 40px;
    height: 500px;
    width: auto;
    .expense-title-list {
      display: flex;
      .expense-title {
        width: 45%;
        // border-style: solid
      }
      .expense-title-2 {
        margin-left: 20px;
        width: 45%;
        // border-style: solid
      }
    }
    .expense-main {
      margin-top: 10px;
      display: flex;
      // border-style: solid
      width: auto;
      height: 500px;
      .expense-card-list {
        display: flex;
        // border-style: solid
        width: 45%;
        height: 500px;
        flex-wrap: wrap;
        .expense-card {
          margin-top: 10px;
          // border-style: solid
          border-top-right-radius: 15px;
          border-top-left-radius: 15px;
          height: 40%;
          width: 25%;
          // background-color: hwb(0 9% 39%);
          .card-title {
            font-weight: bold;
            font-size: 24px;
          }
          .card-date {
            margin-top: 15px;
            font-size: 14px;
            color: #4e5969;
          }
          .card-image {
            margin-top: 25px;
            width: 100%;
            height: 100%;
            .img {
              width: 60px;
              height: 60px;
            }
          }
        }
        .expense-card-2 {
          margin-left: 30px;
          margin-top: 10px;
          // border-style: solid
          border-top-right-radius: 15px;
          border-top-left-radius: 15px;
          height: 40%;
          width: 25%;
          // background-color: hwb(0 9% 39%);
          .card-title {
            font-weight: bold;
            font-size: 24px;
          }
          .card-date {
            margin-top: 15px;
            font-size: 14px;
            color: #4e5969;
          }
          .card-image {
            margin-top: 25px;
            width: 100%;
            height: 100%;
            .img {
              width: 60px;
              height: 60px;
            }
          }
        }
      }
      .expense-list {
        margin-left: 20px;
        display: flex;
        // border-style: solid
        width: 45%;
        height: 500px;
        .expense-data {
          margin: 10px;
          margin-bottom: 40px;
          width: 80%;
          // height: 8%;
        }
      }
    }
  }
  .bottom {
    .schedule-title {
      margin-left: 20px;
      margin-top: 30px;
    }
    .schedule-list {
      margin: 20px;
      box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);
    }
  }
  .dialog-footer {
    justify-content: center;
    align-content: center;
    display: flex;
  }
}
</style>
