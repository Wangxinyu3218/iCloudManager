<template>
  <div id="Dict_Page">
    <el-card class="card_list">
      <el-button type="text" size="mini" @click="addMethod"
        >addMethod</el-button
      >
      <el-table
        :data="methodList"
        class="table"
        style="width: 100%"
        v-loading="loading"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column
          label="id"
          type="index"
          :index="indexMethod"
        ></el-table-column>
        <el-table-column
          label="methodDict"
          prop="method_dict"
        ></el-table-column>
        <el-table-column
          label="methodContent"
          prop="method_content"
        ></el-table-column>
        <el-table-column label="delState">
          <template slot-scope="scope">
            <span v-show="scope.row.del_state == '1'" style="color: #f56c6c">{{
              "freeze"
            }}</span>
            <span v-show="scope.row.del_state == '0'" style="color: #67c23a">{{
              "active"
            }}</span>
          </template></el-table-column
        >
        <el-table-column label="action">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="update_method(scope.row)"
              >edit</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="methodTotal >= 0"
        :total="methodTotal"
        :page.sync="methodQueryParams.page"
        :limit.sync="methodQueryParams.pageSize"
        @pagination="getMethodList"
      />
    </el-card>
    <el-card class="card_list">
      <el-button type="text" size="mini" @click="addType">addType</el-button>
      <el-table
        :data="typeList"
        class="table"
        style="width: 100%"
        v-loading="loading"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column
          label="id"
          type="index"
          :index="indexMethod"
        ></el-table-column>
        <el-table-column label="typeDict" prop="type_dict"></el-table-column>
        <el-table-column
          label="typeContent"
          prop="type_content"
        ></el-table-column>
        <el-table-column label="delState">
          <template slot-scope="scope">
            <span v-show="scope.row.del_state == '1'" style="color: #f56c6c">{{
              "freeze"
            }}</span>
            <span v-show="scope.row.del_state == '0'" style="color: #67c23a">{{
              "active"
            }}</span>
          </template></el-table-column
        >
        <el-table-column label="action">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="update_type(scope.row)"
              >edit</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="typeTotal >= 0"
        :total="typeTotal"
        :page.sync="typeQueryParams.page"
        :limit.sync="typeQueryParams.pageSize"
        @pagination="getTypeList"
      />
    </el-card>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="method_active"
      width="400px"
      :close-on-click-modal="false"
    >
      <el-form
        ref="activeAddMethodForm"
        :model="activeAddMethodForm"
        label-width="160px"
        append-to-body
        :rules="methodRules"
      >
        <el-form-item label="methodDict：" prop="method_dict">
          <el-input
            v-model="activeAddMethodForm.method_dict"
            placeholder="Please enter method_dict"
            type="number"
          ></el-input>
        </el-form-item>
        <el-form-item label="methodContent：" prop="method_content">
          <el-input
            v-model="activeAddMethodForm.method_content"
            placeholder="Please enter method_content"
          ></el-input>
        </el-form-item>
        <el-form-item label="delState：" prop="del_state">
          <el-select
            v-model="activeAddMethodForm.del_state"
            placeholder="Please enter del_state"
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
        <el-button
          type="primary"
          v-show="isMethodConfirm"
          @click="is_method_confirm"
          >confirm</el-button
        >
        <el-button
          type="primary"
          v-show="isMethodUpdate"
          @click="is_method_update"
          >update</el-button
        >
        <el-button @click="methodCancel">cancel</el-button>
      </div>
    </el-dialog>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="type_active"
      width="400px"
      :close-on-click-modal="false"
    >
      <el-form
        ref="activeAddTypeForm"
        :model="activeAddTypeForm"
        label-width="140px"
        append-to-body
        :rules="typeRules"
      >
        <el-form-item label="typeDict：" prop="type_dict">
          <el-input
            v-model="activeAddTypeForm.type_dict"
            placeholder="Please enter type_dict"
            type="number"
          ></el-input>
        </el-form-item>
        <el-form-item label="typeContent：" prop="type_content">
          <el-input
            v-model="activeAddTypeForm.type_content"
            placeholder="Please enter type_content"
          ></el-input>
        </el-form-item>
        <el-form-item label="delState：" prop="del_state">
          <el-select
            v-model="activeAddTypeForm.del_state"
            placeholder="Please enter del_state"
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
        <el-button
          type="primary"
          v-show="isTypeConfirm"
          @click="is_type_confirm"
          >confirm</el-button
        >
        <el-button type="primary" v-show="isTypeUpdate" @click="is_type_update"
          >update</el-button
        >
        <el-button @click="typeCancel">cancel</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import {
  listMethod,
  findMethod,
  updateMethod,
  addMethod,
  deleteMethod,
} from "@/api/method";
import {
  listType,
  findType,
  updateType,
  addType,
  deleteType,
} from "@/api/type";
export default {
  data() {
    return {
      loading: true,
      method_active: false,
      type_active: false,
      title: null,
      isMethodConfirm: false,
      isMethodUpdate: false,
      isTypeConfirm: false,
      isTypeUpdate: false,
      methodTotal: 0,
      typeTotal: 0,
      methodList: [],
      typeList: [],
      methodQueryParams: {
        page: 1,
        pageSize: 10,
        bk_method_id: this.$store.state.user_id,
      },
      typeQueryParams: {
        page: 1,
        pageSize: 10,
        bk_type_id: this.$store.state.user_id,
      },
      activeAddMethodForm: {
        bk_method_id: null,
        method_dict: null,
        method_content: null,
        del_state: null,
      },
      activeAddTypeForm: {
        bk_type_id: null,
        type_dict: null,
        type_content: null,
        del_state: null,
      },
      methodRules: {
        method_dict: [
          {
            required: true,
            message: "Please enter method_dict...",
            trigger: "blur",
          },
        ],
        method_content: [
          {
            required: true,
            message: "Please enter method_content...",
            trigger: "blur",
          },
        ],
        del_state: [
          {
            required: true,
            message: "Please select del_state...",
            trigger: "change",
          },
        ],
      },
      typeRules: {
        type_dict: [
          {
            required: true,
            message: "Please enter type_dict...",
            trigger: "blur",
          },
        ],
        type_content: [
          {
            required: true,
            message: "Please enter type_content...",
            trigger: "blur",
          },
        ],
        del_state: [
          {
            required: true,
            message: "Please select del_state...",
            trigger: "change",
          },
        ],
      },
      stateList: [
        {
          stateValue: 0,
          stateContent: "active",
        },
        {
          stateValue: 1,
          stateContent: "freeze",
        },
      ],
    };
  },
  created() {
    if (this.$store.state.user_id == null) {
      this.$message.error("登录失效请重新登录");
      this.$router.push("/");
    }
    this.getMethodList();
    this.getTypeList();
  },
  methods: {
    indexMethod(index) {
      return index + 1;
    },
    tableHeaderColor({ rowIndex, columnIndex }) {
      if (rowIndex === 0 && columnIndex === 0) {
        return { background: "#f0f4ff" };
      } else if (rowIndex === 0 && columnIndex !== 0) {
        return { background: "#f0f4ff", border: "0" };
      } else {
        return { background: "#f0f4ff" };
      }
    },
    getMethodList() {
      listMethod(this.methodQueryParams).then((response) => {
        this.methodList = response.list;
        this.methodTotal = response.total;
        this.loading = false;
      });
    },
    getTypeList() {
      listType(this.typeQueryParams).then((response) => {
        this.typeList = response.list;
        this.typeTotal = response.total;
        this.loading = false;
      });
    },
    addMethod() {
      this.activeAddMethodForm = {};
      this.method_active = true;
      this.isMethodConfirm = true;
      this.isMethodUpdate = false;
      this.title = "add method";
    },
    addType() {
      this.activeAddTypeForm = {};
      this.type_active = true;
      this.isTypeConfirm = true;
      this.isTypeUpdate = false;
      this.title = "add type";
    },
    is_method_confirm() {
      this.$refs["activeAddMethodForm"].validate((valid) => {
        if (valid) {
          this.activeAddMethodForm.bk_method_id = this.$store.state.user_id;
          addMethod(this.activeAddMethodForm).then((response) => {
            if (response.msg == "创建成功") {
              this.activeAddMethodForm = {};
              this.$message.success("创建成功");
              this.getMethodList();
              this.methodCancel();
            } else {
              this.$message.error("创建失败");
            }
          });
        }
      });
    },
    is_type_confirm() {
      this.$refs["activeAddTypeForm"].validate((valid) => {
        if (valid) {
          this.activeAddTypeForm.bk_type_id = this.$store.state.user_id;
          addType(this.activeAddTypeForm).then((response) => {
            if (response.msg == "创建成功") {
              this.activeAddTypeForm = {};
              this.$message.success("创建成功");
              this.getTypeList();
              this.typeCancel();
            } else {
              this.$message.error("创建失败");
            }
          });
        }
      });
    },
    update_method(row) {
      this.activeAddMethodForm = {};
      this.method_active = true;
      this.isMethodConfirm = false;
      this.isMethodUpdate = true;
      this.title = "edit method";
      const temp = {
        bk_method_id: this.$store.state.user_id,
        method_id: row.method_id,
      };
      findMethod(temp).then((response) => {
        this.activeAddMethodForm = response;
      });
    },
    update_type(row) {
      this.activeAddTypeForm = {};
      this.type_active = true;
      this.isTypeConfirm = false;
      this.isTypeUpdate = true;
      this.title = "edit type";
      const temp = {
        bk_type_id: this.$store.state.user_id,
        type_id: row.type_id,
      };
      findType(temp).then((response) => {
        this.activeAddTypeForm = response;
      });
    },
    is_method_update() {
      this.$refs["activeAddMethodForm"].validate((valid) => {
        if (valid) {
          updateMethod(this.activeAddMethodForm).then((response) => {
            if (response.msg == "修改成功") {
              this.activeAddMethodForm = {};
              this.$message.success("修改成功");
              this.getMethodList();
              this.methodCancel();
            } else {
              this.$message.error("修改失败");
            }
          });
        }
      });
    },
    is_type_update() {
      this.$refs["activeAddTypeForm"].validate((valid) => {
        if (valid) {
          updateType(this.activeAddTypeForm).then((response) => {
            if (response.msg == "修改成功") {
              this.activeAddTypeForm = {};
              this.$message.success("修改成功");
              this.getTypeList();
              this.typeCancel();
            } else {
              this.$message.error("修改失败");
            }
          });
        }
      });
    },
    delete_method(row) {
      const temp = {
        bk_method_id: this.$store.state.user_id,
        method_id: row.method_id,
      };
      deleteMethod(temp).then((response) => {
        if (response.msg == "删除成功") {
          this.$message.success("删除成功");
          this.getMethodList();
        } else {
          this.$message.error("删除失败");
        }
      });
    },
    delete_type(row) {
      const temp = {
        bk_type_id: this.$store.state.user_id,
        type_id: row.type_id,
      };
      deleteType(temp).then((response) => {
        if (response.msg == "删除成功") {
          this.$message.success("删除成功");
          this.getTypeList();
        } else {
          this.$message.error("删除失败");
        }
      });
    },
    methodCancel() {
      this.activeAddMethodForm = {};
      this.$refs["activeAddMethodForm"].resetFields();
      this.method_active = false;
    },
    typeCancel() {
      this.activeAddTypeForm = {};
      this.$refs["activeAddTypeForm"].resetFields();
      this.type_active = false;
    },
  },
};
</script>

<style lang="scss" scoped>
#Dict_Page {
  display: flex;
  .Dict_search {
    display: flex;
    .card_select {
      background-color: #f0f4ff;
      float: left;
      margin: 20px;
      border-radius: 15px;
      width: 80%;
      /deep/ .el-form-item__label {
        font-size: 18px !important;
      }
    }

    .card_button {
      background-color: #e6f5fa;
      display: flex;
      align-items: center;
      justify-content: center;
      float: right;
      margin: 20px;
      border-radius: 15px;
      width: 20%;
      .btn {
        margin: 8px;
      }
      .el-button--primary {
        border-radius: 10px;
        width: 100px;
        height: 50px;
        color: #2e4742;
        background-color: #c0ddc7;
        border-color: #c0ddc7;
      }
      .el-button--info {
        border-radius: 10px;
        width: 100px;
        height: 50px;
        color: #895656;
        background-color: #ffc7c7;
        border-color: #ffc7c7;
      }
    }
  }
  .card_list {
    width: 45%;
    margin: 20px;
    border-radius: 15px;
    background-color: #f0f4ff;
    box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);
    .table {
      margin-top: 20px;
      background-color: #f0f4ff;
    }
  }
  .dialog-footer {
    justify-content: center;
    align-content: center;
    display: flex;
  }
}
/deep/ .el-table tr {
  background-color: #f0f4ff !important;
}
/deep/ .pagination-container {
  background-color: #f0f4ff !important;
}
/deep/ .el-dialog__body {
  display: flex !important;
}
/deep/ .el-loading-mask {
  border-radius: 10px;
}
</style>
