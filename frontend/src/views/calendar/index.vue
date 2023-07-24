<template>
  <div>
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
                  <span class="is-selected3">{{
                    " " + (item.statusA || " ")
                  }}</span>
                </div>
                <div>
                  <span class="is-selected2">{{ item.contentB || " " }}</span>
                  <span class="is-selected3">{{
                    " " + (item.statusB || " ")
                  }}</span>
                </div>
              </div>
              <div v-else></div>
            </div>
            <div v-else></div>
          </div>
        </div>
      </template>
    </el-calendar>
    <el-dialog
      title="编辑日程信息"
      :visible.sync="chosediag"
      width="450px"
      :modal="false"
      :close-on-click-modal="false"
    >
      <el-form
        ref="infoForm"
        v-model="infoForm"
        label-width="130px"
        append-to-body
      >
        <el-form-item label="contentA：">
          <el-input
            v-model="infoForm.contentA"
            placeholder="Pleae enter contentA..."
          ></el-input>
        </el-form-item>
        <el-form-item label="contentAtext：">
          <el-input
            v-model="infoForm.contentAtext"
            placeholder="Pleae enter contentAtext..."
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="statuA：">
          <el-radio v-model="infoForm.statusA" label="0">complete</el-radio>
          <el-radio v-model="infoForm.statusA" label="1">incomplete</el-radio>
        </el-form-item>
        <el-form-item label="contentB：">
          <el-input
            v-model="infoForm.contentB"
            placeholder="Pleae enter contentB..."
          ></el-input>
        </el-form-item>
        <el-form-item label="contentBtext：">
          <el-input
            v-model="infoForm.contentBtext"
            placeholder="Pleae enter contentBtext..."
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="statuB：">
          <el-radio v-model="infoForm.statusB" label="0">complete</el-radio>
          <el-radio v-model="infoForm.statusB" label="1">incomplete</el-radio>
        </el-form-item>
        <el-form-item label="others：">
          <el-input
            v-model="infoForm.others"
            placeholder="Pleae enter others..."
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item label="othersStatus：">
          <el-radio v-model="infoForm.othersStatus" label="0"
            >complete</el-radio
          >
          <el-radio v-model="infoForm.othersStatus" label="1"
            >incomplete</el-radio
          >
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" v-if="isConfirm" @click="add"
          >confirm</el-button
        >
        <el-button type="primary" v-if="isUpdate" @click="update"
          >update</el-button
        >
        <el-button type="danger" @click="remove" v-if="del">delete</el-button>
        <el-button @click="cancel">cancel</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import {
  selectCalendar,
  findCalendar,
  updateCalendar,
  addCalendar,
  deleteCanlendar,
} from "@/api/calendar";
export default {
  data() {
    return {
      isConfirm: false,
      isUpdate: false,
      del: false,
      choseday: "",
      calendarData: [],
      timer: "",
      chosediag: false,
      infoForm: {},
    };
  },
  created() {
    this.getCalendar();
  },
  mounted() {
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
    handleTime(s) {
      return s < 10 ? "0" + s : s;
    },
    changeTime(date, data) {},
    calendarOnClick(idx, idx1) {
      this.choseday = idx1.day;
      this.calendarData.forEach((item, index) => {
        if (item.years + "-" + item.months + "-" + item.days == this.choseday) {
          this.calendarData.splice(index, 1);
        }
      });
      const temp = {
        bk_id: this.$store.state.user_id,
        years: this.choseday.split("-")[0],
        months: this.choseday.split("-")[1],
        days: this.choseday.split("-")[2],
      };
      findCalendar(temp).then((res) => {
        if (res.calendar_id != null) {
          this.infoForm = res;
          this.isUpdate = true;
          this.isConfirm = false;
          this.del = true;
        } else {
          this.isUpdate = false;
          this.isConfirm = true;
          this.del = false;
          this.infoForm = {};
        }
        this.getCalendar();
      });
      this.chosediag = true;
    },
    getCalendar() {
      const temp = {
        bk_id: this.$store.state.user_id,
      };
      selectCalendar(temp).then((res) => {
        this.calendarData = res.list;
      });
    },
    cancel() {
      this.chosediag = false;
      this.getCalendar();
    },
    remove() {
      const temp = {
        calendar_id: this.infoForm.calendar_id,
      };
      deleteCanlendar(temp).then(() => {
        this.cancel();
      });
    },
    update() {
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
        bk_id: this.$store.state.user_id,
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
      updateCalendar(temp).then(() => {
        this.getCalendar();
      });
      this.calendarData = [];
      this.infoForm = {};
      this.getCalendar();
      this.chosediag = false;
    },
    add() {
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
        bk_id: this.$store.state.user_id,
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
        addCalendar(temp).then(() => {
          this.getCalendar();
        });
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