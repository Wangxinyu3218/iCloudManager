<template>
  <a-card title="添加日程">
    <!-- refresh -->
    <a-button type="link" slot="extra" icon="reload" @click="getCalendar"
      >重新加载</a-button
    >
    <!-- canledar -->
    <el-calendar v-model="timer">
      <template slot="dateCell" slot-scope="{ date, data }">
        <div
          @click.stop="calendarOnClick(date, data)"
          style="height: 72px; padding: 5px"
        >
          <p
            :class="data.isSelected ? 'is-selected' : ''"
            style="margin: 0 !important"
          >
            {{ data.day.split("-").slice(1).join("-") }}
          </p>
          <div v-for="(item, index) in calendarData" :key="index">
            <div
              v-if="item.months.indexOf(data.day.split('-').slice(1)[0]) != -1"
            >
              <div
                v-if="
                  item.days.indexOf(data.day.split('-').slice(2).join('-')) !=
                  -1
                "
              >
                <div>
                  <span class="is-selected2">{{ item.contentA || " " }}</span>
                  <span
                    v-show="item.statusA == '待办'"
                    style="color: #d9001b"
                    >{{ " " + (item.statusA || " ") }}</span
                  >
                  <span
                    v-show="item.statusA == '完成'"
                    style="color: #00bfbf"
                    >{{ " " + (item.statusA || " ") }}</span
                  >
                </div>
                <div>
                  <span class="is-selected2">{{ item.contentB || " " }}</span>
                  <span
                    v-show="item.statusB == '待办'"
                    style="color: #d9001b"
                    >{{ " " + (item.statusB || " ") }}</span
                  >
                  <span
                    v-show="item.statusB == '完成'"
                    style="color: #00bfbf"
                    >{{ " " + (item.statusB || " ") }}</span
                  >
                </div>
              </div>
              <div v-else></div>
            </div>
            <div v-else></div>
          </div>
        </div>
      </template>
    </el-calendar>
    <!-- dialog -->
    <el-dialog
      title="编辑日程信息"
      :visible.sync="chosediag"
      width="450px"
      :modal="false"
      :close-on-click-modal="false"
      :show-close="false"
    >
      <el-form
        ref="infoForm"
        v-model="infoForm"
        label-width="130px"
        append-to-body
      >
        <el-form-item label="事件1：">
          <el-input
            v-model="infoForm.contentA"
            placeholder="请输入事件A标题"
          ></el-input>
        </el-form-item>
        <el-form-item label="事件1描述：">
          <el-input
            v-model="infoForm.contentAtext"
            placeholder="请输入事件A介绍"
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="事件1状态：">
          <el-radio v-model="infoForm.statusA" label="0">完成</el-radio>
          <el-radio v-model="infoForm.statusA" label="1">待办</el-radio>
        </el-form-item>
        <el-form-item label="事件2：">
          <el-input
            v-model="infoForm.contentB"
            placeholder="请输入事件2标题"
          ></el-input>
        </el-form-item>
        <el-form-item label="事件2描述：">
          <el-input
            v-model="infoForm.contentBtext"
            placeholder="请输入事件2介绍"
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="事件2状态：">
          <el-radio v-model="infoForm.statusB" label="0">完成</el-radio>
          <el-radio v-model="infoForm.statusB" label="1">待办</el-radio>
        </el-form-item>
        <el-form-item label="其他事件：">
          <el-input
            v-model="infoForm.others"
            placeholder="请输入其他事件"
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="其他事件状态：">
          <el-radio v-model="infoForm.othersStatus" label="0">完成</el-radio>
          <el-radio v-model="infoForm.othersStatus" label="1">待办</el-radio>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" v-if="isConfirm" @click="add">确认</el-button>
        <el-button type="primary" v-if="isUpdate" @click="update"
          >更新</el-button
        >
        <el-button type="danger" @click="remove" v-if="del">删除</el-button>
        <el-button @click="cancel">取消</el-button>
      </span>
    </el-dialog>
  </a-card>
</template>
<script>
export default {
  data() {
    return {
      isConfirm: false,
      isUpdate: false,
      del: false,
      chosediag: false,
      choseday: "",
      timer: "",
      calendarData: [],
      infoForm: {},
    };
  },
  created() {
    this.getCalendar();
  },
  mounted() {
    /* 前一天后一天 */
    this.$nextTick(() => {
      let prevBtn = document.querySelector(
        ".el-calendar__button-group .el-button-group>button:nth-child(1)"
      );
      prevBtn.addEventListener("click", (e) => {
        let d = new Date(this.timeValue);
        let resDate = d.getFullYear() + "-" + this.handleTime(d.getMonth() + 1); //2020-08
      });
      let nextBtn = document.querySelector(
        ".el-calendar__button-group .el-button-group>button:nth-child(3)"
      );
      nextBtn.addEventListener("click", (e) => {
        let d = new Date(this.timeValue);
        let resDate = d.getFullYear() + "-" + this.handleTime(d.getMonth() + 1); //2020-10
      });
      let todayBtn = document.querySelector(
        ".el-calendar__button-group .el-button-group>button:nth-child(2)"
      );
      todayBtn.addEventListener("click", (e) => {
        let d = new Date(this.timeValue);
        let resDate = d.getFullYear() + "-" + this.handleTime(d.getMonth() + 1); //2020-09
      });
    });
  },
  methods: {
    /* 补时 */
    handleTime(s) {
      return s < 10 ? "0" + s : s;
    },
    /* 查详日程 */
    async calendarOnClick(idx, idx1) {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.choseday = idx1.day;
      this.calendarData.forEach((item, index) => {
        if (item.years + "-" + item.months + "-" + item.days == this.choseday) {
          this.calendarData.splice(index, 1);
        }
      });
      const temp = {
        uuid: this.$store.state.uuid,
        roleid: this.$store.state.roleid,
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
      };
      setTimeout(async () => {
        try {
          const response = await this.$axios.post(`calendar/find`, temp);
          if (response.data.code === 200) {
            // console.log(response.data.list, "id");
            // return;
            if (response.data.list != null) {
              this.infoForm = response.data.list;
              this.isUpdate = true;
              this.isConfirm = false;
              this.del = true;
            } else {
              this.isUpdate = false;
              this.isConfirm = true;
              this.del = false;
              this.infoForm = {};
            }
            this.chosediag = true;
            loading.close();
          } else {
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            loading.close();
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 4,
          });
          loading.close();
        }
      }, 1200);
    },
    /* 查询日程 */
    getCalendar() {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      const temp = {
        uuid: this.$store.state.uuid,
        roleid: this.$store.state.roleid,
      };
      setTimeout(async () => {
        try {
          const response = await this.$axios.post(`calendar/select`, temp);
          if (response.data.code === 200) {
            // this.$notification.open({
            //   message: response.data.msg,
            //   description: response.data.des,
            //   duration: 4,
            // });
            this.calendarData = response.data.list;
            loading.close();
          } else {
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            loading.close();
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 4,
          });
          loading.close();
        }
      }, 1200);
    },
    /* 取消 */
    cancel() {
      this.infoForm = {};
      this.chosediag = false;
      this.getCalendar();
    },
    /* 删除 */
    async remove() {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      const temp = {
        id: this.infoForm.id,
      };
      setTimeout(async () => {
        try {
          const response = await this.$axios.put(`calendar/del`, temp);
          if (response.data.code === 200) {
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            this.cancel();
            this.getCalendar();
            loading.close();
          } else {
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            loading.close();
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 4,
          });
          loading.close();
        }
      }, 1200);
    },
    /* 更新 */
    update() {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.loading = true;
      this.calendarData.forEach((item, index) => {
        if (item.years + "-" + item.months + "-" + item.days == this.choseday) {
          this.calendarData.splice(index, 1);
        }
      });
      this.calendarData.push({
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
        contentA: this.infoForm.contentA,
        contentAtext: this.infoForm.contentAtext,
        statusA: this.infoForm.statusA,
        contentB: this.infoForm.contentB,
        contentBtext: this.infoForm.contentBtext,
        statusB: this.infoForm.statusB,
        others: this.infoForm.others,
        othersStatus: this.infoForm.othersStatus,
      });
      const lastItem = this.calendarData[this.calendarData.length - 1];
      const temp = {
        id: this.infoForm.id,
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
        contentA: this.infoForm.contentA,
        contentAtext: this.infoForm.contentAtext,
        statusA: this.infoForm.statusA,
        contentB: this.infoForm.contentB,
        contentBtext: this.infoForm.contentBtext,
        statusB: this.infoForm.statusB,
        others: this.infoForm.others,
        othersStatus: this.infoForm.othersStatus,
      };

      setTimeout(async () => {
        try {
          const response = await this.$axios.put(`calendar/update`, temp);
          if (response.data.code === 200) {
            this.calendarData = [];
            this.infoForm = {};
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            this.chosediag = false;
            loading.close();
            this.getCalendar();
          } else {
            this.$notification.open({
              message: response.data.msg,
              description: response.data.des,
              duration: 4,
            });
            loading.close();
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 4,
          });
          loading.close();
        }
      }, 1200);
    },
    /* 新增 */
    async add() {
      this.calendarData.forEach((item, index) => {
        if (item.years + "-" + item.months + "-" + item.days == this.choseday) {
          this.calendarData.splice(index, 1);
        }
      });
      this.calendarData.push({
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
        contentA: this.infoForm.contentA,
        contentAtext: this.infoForm.contentAtext,
        statusA: this.infoForm.statusA,
        contentB: this.infoForm.contentB,
        contentBtext: this.infoForm.contentBtext,
        statusB: this.infoForm.statusB,
        others: this.infoForm.others,
        othersStatus: this.infoForm.othersStatus,
      });
      const lastItem = this.calendarData[this.calendarData.length - 1];
      const temp = {
        uuid: this.$store.state.uuid,
        roleid: this.$store.state.roleid,
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
        contentA: this.infoForm.contentA,
        contentAtext: this.infoForm.contentAtext,
        statusA: this.infoForm.statusA,
        contentB: this.infoForm.contentB,
        contentBtext: this.infoForm.contentBtext,
        statusB: this.infoForm.statusB,
        others: this.infoForm.others,
        othersStatus: this.infoForm.othersStatus,
      };
      if (temp.contentA != null) {
        const response = await this.$axios.post(`calendar/add`, temp);
        // addCalendar(temp).then(() => {
        this.getCalendar();
        // });
      }
      this.calendarData = [];
      this.infoForm = {};
      this.getCalendar();
      this.chosediag = false;
    },
  },
};
</script>
<style>
.is-selected {
  color: #1989fa;
}
.div-Calendar {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
}

.calendar-day {
  text-align: center;
  color: #202535;
  line-height: 30px;
  font-size: 12px;
}

.is-selected2 {
  color: #f8a535;
  font-size: 14px;
}
.is-selected3 {
  color: #5bad3b;
  font-size: 14px;
}
.is-selected4 {
  color: #ee4617;
  font-size: 14px;
  margin-bottom: 5px;
}

#calendar
  .el-button-group
  > .el-button:not(:first-child):not(:last-child):after {
  content: "当月";
}
.el-calendar-day {
  padding: 0 !important;
}

.dialog-footer {
  justify-content: center;
  align-content: center;
  display: flex;
}
</style>
