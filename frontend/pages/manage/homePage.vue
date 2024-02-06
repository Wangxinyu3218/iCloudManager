<template>
  <div>
    <div>
      <a-card title="总览" :loading="loading">
        <a slot="extra"
          ><a-button type="link" icon="edit" @click="edit">修改</a-button></a
        >
        <a-row>
          <a-col :span="3">
            <a-statistic
              title="总资产池"
              :precision="2"
              :value="statistic.total"
            />
          </a-col>
          <a-col :span="3">
            <a-statistic
              title="可用资产池"
              :precision="2"
              :value="statistic.value"
            />
          </a-col>
          <a-col :span="3">
            <a-statistic
              title="限额预警"
              :precision="2"
              :value="statistic.warn" /><a-progress
              :percent="statistic.percent"
              status="active"
          /></a-col>
        </a-row>
        <a-row style="margin-top: 20px">
          <a-col :span="4">
            <a-statistic
              title="上个周期总支出"
              :precision="2"
              :value="statistic.lcost"
            ></a-statistic>
          </a-col>
          <a-col :span="4">
            <a-statistic
              title="上个周期总收入"
              :precision="2"
              :value="statistic.lincome"
            />
          </a-col>
          <a-col :span="4">
            <a-statistic
              title="本周期总支出"
              :precision="2"
              :value="statistic.cost"
              ><template #suffix>
                <div v-if="statistic.costRise > '0'">
                  <a-icon type="rise" /> 同比增长{{
                    statistic.costRise * 100 + "%"
                  }}
                </div>
                <div v-else-if="statistic.costRise < '0'">
                  <a-icon type="fall" /> 同比下降{{
                    Math.abs(statistic.costRise) * 100 + "%"
                  }}
                </div></template
              ></a-statistic
            >
          </a-col>
          <a-col :span="4">
            <a-statistic
              title="本周期总收入"
              :precision="2"
              :value="statistic.income"
              ><template #suffix>
                <div v-if="statistic.incomeRise > '0'">
                  <a-icon type="rise" /> 同比增长{{
                    statistic.incomeRise * 100 + "%"
                  }}
                </div>
                <div v-else-if="statistic.incomeRise < '0'">
                  <a-icon type="fall" /> 同比下降{{
                    Math.abs(statistic.incomeRise) * 100 + "%"
                  }}
                </div></template
              >
            </a-statistic>
          </a-col>
        </a-row>
      </a-card>
    </div>
    <div class="main">
      <div class="cal">
        <a-card title="报表" :loading="loading">
          <a slot="extra"
            ><a-button type="link" icon="reload" @click="refr"
              >刷新</a-button
            ></a
          >
          <a-row type="flex">
            <a-card
              class="car"
              size="small"
              :title="item.content"
              style="width: 170px"
              v-for="(item, index) in items"
              :key="item.id"
            >
              <a-popconfirm
                title="删除后从首页移除，可以随时再添加，确定继续吗？"
                ok-text="再考虑一下"
                cancel-text="确定"
                @confirm="cancel"
                @cancel="confirm(index)"
                slot="extra"
              >
                <a-button type="danger" icon="delete" size="small"
              /></a-popconfirm>
              <p>{{ item.today + ":" + item.tamount }}</p>
              <p>{{ item.yesterday + ":" + item.yamount }}</p>
              <p>{{ item.week + ":" + item.wamount }}</p>
              <p>{{ item.lastweek + ":" + item.lmamount }}</p>
              <p>{{ item.lastmonth + ":" + item.lamount }}</p>
              <p>{{ item.year + ":" + item.aamount }}</p>
            </a-card>
          </a-row>
        </a-card>
      </div>
      <div>
        <a-card title="排行" class="list" :loading="loading">
          <p style="margin-top: 15px">{{ "本周" }}</p>
          <p style="color: #d81e06; font-size: 22px">
            {{ "1" + ":" + form.content1 }}
          </p>
          <p style="color: #bfbfbf; font-size: 20px">
            {{ "2" + ":" + form.content2 }}
          </p>
          <p style="color: #847f16; font-size: 18px">
            {{ "3" + ":" + form.content3 }}
          </p>
        </a-card>
        <!-- modal -->
        <a-modal
          title="修改"
          :visible="visible"
          @ok="handleCancel"
          okText="再考虑一下"
          @cancel="handleOk"
          cancelText="修改"
          :maskClosable="false"
          :closable="false"
          :width="900"
        >
          <a-form-model
            v-loading="loading"
            :layout="layout"
            :model="mform"
            :rules="rules"
            ref="ruleForm"
          >
            <a-form-model-item label="总资产池" prop="total"
              ><a-input
                v-model="mform.total"
                placeholder="请输入总资产"
              ></a-input
            ></a-form-model-item>
            <a-form-model-item label="可用资产池" prop="value"
              ><a-input
                v-model="mform.value"
                placeholder="请输入可用资产池"
              ></a-input
            ></a-form-model-item>
            <a-form-model-item label="限额" prop="warn"
              ><a-input
                v-model="mform.warn"
                placeholder="请输入限额"
              ></a-input></a-form-model-item
          ></a-form-model>
        </a-modal>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      visible: false,
      loading: false,
      items: [],
      list: [],
      form: {},
      layout: "inline",
      statistic: {
        total: "",
        value: "",
        warn: "",
        percent: 0,
        lcost: "",
        lincome: "",
        cost: "",
        income: "",
        costRise: "",
        incomeRise: "",
      },
      mform: {
        total: null,
        value: null,
        warn: null,
      },
      rules: {
        total: [
          {
            required: true,
            message: "请输入总资产",
            trigger: "blur",
          },
        ],
        value: [
          {
            required: true,
            message: "请输入可用资产",
            trigger: "blur",
          },
        ],
        warn: [
          {
            required: true,
            message: "请输入限额",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    /* 获取首页数据 */
    this.getList();
    /* 发送计算指令 */
    this.getCount();
    /* 获取排序 */
    this.getOrder();
    /* 获取总览 */
    this.getInfo();
  },
  methods: {
    /* 关闭弹窗 */
    cancel() {},
    /* 从首页移除 */
    confirm(index) {
      const selectedItem = this.items[index];
      this.loading = true;
      setTimeout(async () => {
        try {
          const temp = { id: selectedItem.id, typeid: selectedItem.typeid };
          const response = await this.$axios.post(`home/del`, temp);
          this.getList();
          this.loading = false;
        } catch (error) {
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          this.loading = false;
        }
        this.loading = false;
      }, 1300);
    },
    /* 获取列表 */
    async getList() {
      this.loading = true;
      try {
        const temp = { uuid: this.$store.state.uuid };
        const response = await this.$axios.post(`home/select`, temp);
        this.items = response.data.list;
        this.loading = false;
      } catch (error) {
        this.loading = false;
      }
      this.loading = false;
    },
    /* 获取总览 */
    async getInfo() {
      this.loading = true;
      try {
        const temp = {
          uuid: this.$store.state.uuid,
          roleid: this.$store.state.roleid,
        };
        const response = await this.$axios.post(`statistic/findStat`, temp);
        this.statistic = response.data.list[0];
        this.statistic.warn = this.statistic.cost + "/" + this.statistic.warn;
        this.statistic.percent = response.data.list[0].percent;
        if (this.statistic.lcost === 0) {
          this.statistic.costRise = 0;
        } else {
          var rise =
            (this.statistic.cost - this.statistic.lcost) / this.statistic.lcost;
          this.statistic.costRise = parseFloat(rise.toFixed(2));
        }
        if (this.statistic.lincome === 0) {
          this.statistic.incomeRise = 0;
        } else {
          var fall =
            (this.statistic.income - this.statistic.lincome) /
            this.statistic.lincome;
          this.statistic.incomeRise = parseFloat(fall.toFixed(2));
        }
        this.loading = false;
      } catch (error) {
        this.loading = false;
      }
      this.loading = false;
    },
    /* 获取排序 */
    async getOrder() {
      this.loading = true;
      // setTimeout(async () => {
      try {
        const temp = { uuid: this.$store.state.uuid };
        const response = await this.$axios.post(`home/order`, temp);
        this.form = response.data.list;
        if (response.data.list[0] == null) {
          this.form.content1 = "虚位以待";
        } else {
          this.form.content1 = response.data.list[0].content;
        }
        if (response.data.list[1] == null) {
          this.form.content2 = "虚位以待";
        } else {
          this.form.content2 = response.data.list[1].content;
        }
        if (response.data.list[2] == null) {
          this.form.content3 = "虚位以待";
        } else {
          this.form.content3 = response.data.list[2].content;
        }
        this.loading = false;
      } catch (error) {
        this.loading = false;
        // throw
      }
      this.loading = false;
      // }, 1000);
    },
    /* 计算 */
    async getCount() {
      this.loading = true;
      try {
        const response = await this.$axios.get(
          `home/count?uuid=${this.$store.state.uuid}`
        );
        this.loading = false;
      } catch (error) {
        this.$notification.open({
          message: response.data.msg,
          duration: 4,
        });
        this.loading = false;
      }
      this.loading = false;
    },
    /* 关闭弹窗 */
    handleCancel() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
    /* 确认修改 */
    handleOk() {
      this.$refs.ruleForm.validate(async (valid) => {
        if (valid) {
          try {
            const temp = {
              uuid: this.$store.state.uuid,
              roleid: this.$store.state.roleid,
              total: this.mform.total,
              value: this.mform.value,
              warn: this.mform.warn,
            };
            const response = await this.$axios.put(
              `statistic/updateStat`,
              temp
            );
            try {
              if (response.data.code === 200) {
                this.$notification.open({
                  message: response.data.msg,
                  duration: 8,
                });
                this.getInfo();
                this.loading = false;
                this.visible = false;
              } else {
                this.$notification.open({
                  message: response.data.msg,
                  duration: 8,
                });
                this.getInfo();
                this.loading = false;
                this.visible = false;
              }
            } catch (error) {
              this.$notification.open({
                message: "错误",
                description: "未知错误",
                duration: 8,
              });
              this.loading = false;
              this.visible = false;
            }
          } catch (error) {
            this.$notification.open({
              message: "错误",
              description: "未知错误",
              duration: 8,
            });
            this.loading = false;
          }
        }
      });
    },
    /* 打开修改 */
    edit() {
      this.visible = true;
      this.mform.total = this.statistic.total;
      this.mform.value = this.statistic.value;
      // if()
      this.mform.warn = Number(this.statistic.warn.split("/")[1]) || 0;
    },
    /* 刷新报表 */
    refr() {
      this.getCount();
      this.getList();
      this.getInfo();
    },
  },
};
</script>

<style scoped lang="scss">
.main {
  margin-top: 10px;
  display: flex;
  .cal {
    width: 90%;
    .car {
      margin-right: 20px;
      margin-top: 15px;
    }
  }
}
</style>
