<template>
  <div>
    <a-card title="支出类型字典" :loading="loading">
      <a-button type="primary" slot="extra" icon="plus" @click="add"
        >新增</a-button
      >
      <a-row type="flex">
        <a-card
          class="car"
          size="small"
          title="操作"
          style="width: 170px"
          v-for="(item, index) in items"
          :key="item.id"
        >
          <a-button
            type="primary"
            icon="edit"
            @click="edit(index)"
            slot="extra"
            size="small"
          />
          <a-popconfirm
            title="删除后不能再关联类目了，确定继续吗？"
            ok-text="再考虑一下"
            cancel-text="确定"
            @confirm="cancel"
            @cancel="confirm(index)"
            slot="extra"
          >
            <a-button type="danger" icon="delete" size="small"
          /></a-popconfirm>
          <a-button
            icon="plus"
            @click="addDash(index)"
            slot="extra"
            size="small"
            v-if="items[index].isdash == '0'"
          />
          {{ item.content }}
        </a-card>
      </a-row>
    </a-card>
    <a-modal
      title="编辑"
      :visible="visible"
      @ok="handleCancel"
      @cancel="update"
      cancelText="修改"
      okText="再考虑一下"
      :closable="false"
      :maskClosable="false"
    >
      <a-form-model
        :model="form"
        :rules="rules"
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
        ref="ruleForm"
      >
        <a-form-model-item ref="content" label="名称" prop="content"
          ><a-input v-model="form.content" :maxLength="10" /></a-form-model-item
      ></a-form-model>
    </a-modal>
    <a-modal
      title="增加"
      :visible="avisible"
      @ok="handleCancel"
      @cancel="insert"
      cancelText="确认"
      okText="再考虑一下"
      :closable="false"
      :maskClosable="false"
    >
      <a-form-model
        :model="form"
        :rules="rules"
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
        ref="ruleForm"
      >
        <a-form-model-item ref="content" label="名称" prop="content"
          ><a-input v-model="form.content" :maxLength="10" /></a-form-model-item
      ></a-form-model>
    </a-modal>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      visible: false,
      avisible: false,
      items: [],
      form: {},
      labelCol: { span: 4 },
      wrapperCol: { span: 18 },
      rules: {
        content: [
          {
            required: true,
            message: "请输入名称",
            trigger: "blur",
          },
          {
            min: 1,
            max: 10,
            message: "在1～10位之间",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    async getList() {
      this.loading = true;
      setTimeout(async () => {
        try {
          const response = await this.$axios.get(
            `type/listType?uuid=${this.$store.state.uuid}&roleid=${this.$store.state.roleid}`
          );
          this.items = response.data.list;
          this.loading = false;
        } catch (error) {
          this.loading = false;
        }
        this.loading = false;
      }, 1000);
    },
    edit(index) {
      this.form = {};
      const selectedItem = this.items[index];
      this.form = selectedItem;
      this.visible = true;
    },
    async confirm(index) {
      const selectedItem = this.items[index];
      this.loading = true;
      setTimeout(async () => {
        try {
          const uuid = selectedItem.uuid;
          const roleid = selectedItem.roleid;
          const typeid = selectedItem.typeid;
          const response = await this.$axios.get(
            `type/delType?uuid=${uuid}&roleid=${roleid}&typeid=${typeid}`
          );
          this.getList();
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          this.loading = false;
        } catch (error) {
          this.loading = false;
        }
        this.loading = false;
      }, 1300);
    },
    add() {
      this.form = {};
      this.avisible = true;
    },
    cancel() {},
    update() {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      setTimeout(async () => {
        try {
          const uuid = this.form.uuid;
          const roleid = this.form.roleid;
          const typeid = this.form.typeid;
          const content = this.form.content;
          const response = await this.$axios.get(
            `type/updateType?uuid=${uuid}&roleid=${roleid}&typeid=${typeid}&content=${content}`
          );
          this.getList();
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          loading.close();
          this.visible = false;
        } catch (error) {
          loading.close();
          this.visible = false;
        }
      }, 1300);
      //   loading.close();
    },
    insert() {
      const loading = this.$loading({
        lock: true,
        text: "通信中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      setTimeout(async () => {
        try {
          const uuid = this.$store.state.uuid;
          const roleid = this.$store.state.roleid;
          const content = this.form.content;
          const response = await this.$axios.get(
            `type/addType?uuid=${uuid}&roleid=${roleid}&content=${content}`
          );
          this.getList();
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          loading.close();
          this.avisible = false;
        } catch (error) {
          loading.close();
          this.avisible = false;
        }
      }, 1300);
    },
    handleCancel() {
      this.visible = false;
      this.avisible = false;
    },
    addDash(index) {
      const selectedItem = this.items[index];
      this.loading = true;
      setTimeout(async () => {
        try {
          const uuid = selectedItem.uuid;
          const content = selectedItem.content;
          const typeid = selectedItem.typeid;
          const response = await this.$axios.get(
            `type/addDash?uuid=${uuid}&content=${content}&typeid=${typeid}`
          );
          this.getList();
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          this.loading = false;
        } catch (error) {
          this.loading = false;
        }
        this.loading = false;
      }, 1300);
    },
  },
};
</script>

<style scoped lang="scss">
.car {
  margin-right: 20px;
  margin-top: 15px;
}
</style>
