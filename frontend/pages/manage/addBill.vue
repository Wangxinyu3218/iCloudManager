<template>
  <a-card title="添加账单">
    <a-form-model
      v-loading="loading"
      ref="ruleForm"
      :model="mform"
      :rules="rules"
      :label-col="labelCol"
      :wrapper-col="wrapperCol"
    >
      <a-form-model-item label="备注" prop="content">
        <a-input v-model="mform.content" placeholder="请输入备注" />
      </a-form-model-item>
      <a-form-model-item label="支出类型" prop="typeid">
        <a-select v-model="mform.typeid" placeholder="请选择支出类型">
          <a-select-option
            v-for="item in toptions"
            :value="item.typeid"
            :key="item.typeid"
          >
            {{ item.content }}
          </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item label="支出方式" prop="methodid">
        <a-select v-model="mform.methodid" placeholder="请选择支出方式">
          <a-select-option
            v-for="item in moptions"
            :value="item.methodid"
            :key="item.methodid"
          >
            {{ item.content }}
          </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item label="发生金额" prop="amount">
        <a-input
          type="number"
          v-model="mform.amount"
          placeholder="请输入发生金额"
        />
      </a-form-model-item>
      <a-form-model-item label="发生日期" prop="createtime"
        ><a-date-picker
          v-model="mform.createtime"
          placeholder="请选择发生日期"
          :showToday="false"
          show-time
        >
        </a-date-picker
      ></a-form-model-item>
      <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
        <a-button type="primary" @click="onSubmit">创 建</a-button>
        <a-button style="margin-left: 10px" @click="reset">重 置</a-button>
      </a-form-model-item>
    </a-form-model></a-card
  >
</template>
<script>
export default {
  data() {
    return {
      loading: false,
      labelCol: { span: 4 },
      wrapperCol: { span: 8 },
      toptions: [],
      moptions: [],
      mform: {
        uuid: null,
        roleid: null,
        typeid: null,
        methodid: null,
        content: null,
        amount: null,
        createtime: null,
      },
      rules: {
        content: [
          {
            required: true,
            message: "请输入备注",
            trigger: "blur",
          },
        ],
        typeid: [
          {
            required: true,
            message: "请选择类型",
            trigger: "change",
          },
        ],
        methodid: [
          {
            required: true,
            message: "请选择方式",
            trigger: "change",
          },
        ],
        amount: [
          {
            required: true,
            message: "请输入金额",
            trigger: "blur",
          },
        ],
        createtime: [
          {
            required: true,
            message: "请选择时间",
            trigger: "change",
          },
        ],
      },
    };
  },
  created() {
    this.getType();
    this.getMethod();
  },
  methods: {
    /* 获取类型字典 */
    async getType() {
      try {
        const response = await this.$axios.get(
          `type/listType?roleid=${this.$store.state.roleid}&uuid=${this.$store.state.uuid}`
        );
        this.toptions = response.data.list;
      } catch (error) {
        console.error(error);
      }
    },
    /* 获取方式字典 */
    async getMethod() {
      try {
        const response = await this.$axios.get(
          `method/listMethod?roleid=${this.$store.state.roleid}&uuid=${this.$store.state.uuid}`
        );
        this.moptions = response.data.list;
      } catch (error) {
        console.error(error);
      }
    },
    /* 重置 */
    reset() {
      this.mform = {};
      this.$refs.ruleForm.resetFields();
    },
    /* 确认 */
    onSubmit() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          if (this.mform.createtime == null) {
            this.mform.createtime = null;
          } else {
            let dateObj = new Date(this.mform.createtime); // 创建Date对象
            let year = dateObj.getFullYear(); // 获取年份
            let month = ("0" + (dateObj.getMonth() + 1)).slice(-2); // 获取月份（月份是从0开始的，所以需要加1）
            let day = ("0" + dateObj.getDate()).slice(-2); // 获取日期
            // 获取小时、分钟和秒，并确保它们是两位数的格式
            let hours = ("0" + dateObj.getHours()).slice(-2);
            let minutes = ("0" + dateObj.getMinutes()).slice(-2);
            let seconds = ("0" + dateObj.getSeconds()).slice(-2);
            this.mform.createtime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
          }
          setTimeout(async () => {
            this.mform.uuid = this.$store.state.uuid;
            this.mform.roleid = this.$store.state.roleid;
            // console.log(this.mform);
            // return;
            const response = await this.$axios.post(
              `bookkeep/addBookkeep`,
              this.mform
            );
            try {
              if (response.data.code === 200) {
                this.$notification.open({
                  message: response.data.msg,
                  description: response.data.des,
                  duration: 8,
                });
                this.$router.push("/manage/bookkeep");
                this.loading = false;
              } else {
                this.$notification.open({
                  message: response.data.msg,
                  description: response.data.des,
                  duration: 8,
                });
                this.mform = {};
                this.loading = false;
              }
            } catch (error) {
              this.$notification.open({
                message: "错误",
                description: "未知错误",
                duration: 8,
              });
              this.mform = {};
              this.loading = false;
            }
          }, 1300);
        }
      });
    },
  },
};
</script>
