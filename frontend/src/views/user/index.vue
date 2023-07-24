<template>
  <div id="User_Page">
    <div class="User_search">
      <el-card class="card_select">
        <el-form
          :model="queryParams"
          ref="queryForm"
          :inline="true"
          label-width="120px"
          size="medium"
        >
          <el-form-item label="nickName：">
            <el-input
              v-model="queryParams.nick_name"
              placeholder="Please input nick_name"
              clearable
            ></el-input>
          </el-form-item>
          <el-form-item label="userName：">
            <el-input
              v-model="queryParams.user_name"
              placeholder="Please input user_name"
              clearable
            ></el-input>
          </el-form-item>
          <el-form-item label="userState：">
            <el-select
              v-model="queryParams.user_state"
              placeholder="Please enter user_state"
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
          <el-form-item label="action：">
            <el-button icon="el-icon-plus" @click="addUser">add</el-button>
          </el-form-item>
        </el-form>
      </el-card>
      <el-card class="card_button">
        <el-form :model="queryParams" ref="queryForm" size="medium"
          ><el-form-item
            ><el-button
              class="btn"
              type="primary"
              icon="el-icon-search"
              @click="handleQuery"
              >Search</el-button
            >
            <el-button
              class="btn"
              type="info"
              icon="el-icon-refresh"
              @click="reset"
              >Reset</el-button
            ></el-form-item
          >
        </el-form>
      </el-card>
    </div>
    <el-card class="card_list">
      <el-table
        :data="userList"
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
        <el-table-column label="userState">
          <template slot-scope="scope">
            <span v-show="scope.row.user_state == '1'" style="color: #f56c6c">{{
              "freeze"
            }}</span>
            <span v-show="scope.row.user_state == '0'" style="color: #67c23a">{{
              "active"
            }}</span>
          </template>
        </el-table-column>
        <el-table-column label="userName" prop="user_name"></el-table-column>
        <el-table-column label="nickName" prop="nick_name"></el-table-column>
        <el-table-column label="action">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="update_user(scope.row)"
              >edit</el-button
            >
            <!-- <el-button
              size="mini"
              type="text"
              style="color: red"
              @click="delete_user(scope.row)"
              >delete</el-button
            > -->
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="total >= 0"
        :total="total"
        :page.sync="queryParams.page"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="active"
      width="400px"
      :close-on-click-modal="false"
    >
      <el-form
        ref="activeAddForm"
        :model="activeAddForm"
        label-width="140px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="userName：" prop="user_name">
          <el-input
            v-model="activeAddForm.user_name"
            placeholder="Please enter username"
          ></el-input>
        </el-form-item>
        <el-form-item label="nickName：" prop="nick_name">
          <el-input
            v-model="activeAddForm.nick_name"
            placeholder="Please enter nickname"
          ></el-input>
        </el-form-item>
        <el-form-item label="userPassword：" prop="user_password">
          <el-input
            type="password"
            show-password
            v-model="activeAddForm.user_password"
            placeholder="Please enter user_password"
          ></el-input>
        </el-form-item>
        <el-form-item label="userState：" prop="user_state">
          <el-select
            v-model="activeAddForm.user_state"
            placeholder="Please enter user_state"
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
        <el-button type="primary" v-show="isConfirm" @click="is_confirm"
          >confirm</el-button
        >
        <el-button type="primary" v-show="isUpdate" @click="is_update"
          >update</el-button
        >
        <el-button @click="cancel">cancel</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import {
  listUser,
  findUser,
  updateUser,
  addUser,
  deleteUser,
} from "@/api/user";
export default {
  data() {
    return {
      loading: true,
      active: false,
      title: null,
      isConfirm: false,
      isUpdate: false,
      total: 0,
      userList: [],
      queryParams: {
        page: 1,
        pageSize: 10,
        nick_name: null,
        user_name: null,
        user_state: null,
      },
      activeAddForm: {
        user_id: null,
        nick_name: null,
        user_name: null,
        user_state: null,
        user_password: null,
      },
      rules: {
        nick_name: [
          {
            required: true,
            message: "Please enter nick_name...",
            trigger: "blur",
          },
        ],
        user_name: [
          {
            required: true,
            message: "Please enter user_name...",
            trigger: "blur",
          },
        ],
        user_password: [
          {
            required: true,
            message: "Please enter user_password...",
            trigger: "blur",
          },
        ],
        user_state: [
          {
            required: true,
            message: "Please select user_state...",
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
    this.getList();
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
    getList() {
      listUser(this.queryParams).then((response) => {
        this.userList = response.list;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleQuery() {
      this.queryParams.page = 1;
      this.getList();
    },
    reset() {
      this.queryParams = {
        page: 1,
        pageSize: 10,
        nick_name: null,
        user_name: null,
        user_state: null,
      };
      this.getList();
    },
    addUser() {
      this.activeAddForm = {};
      this.active = true;
      this.isConfirm = true;
      this.isUpdate = false;
      this.title = "add user";
    },
    is_confirm() {
      this.$refs["activeAddForm"].validate((valid) => {
        if (valid) {
          addUser(this.activeAddForm).then((response) => {
            if (response.msg == "创建成功") {
              this.activeAddForm = {};
              this.$message.success("创建成功");
              this.getList();
              this.cancel();
            } else {
              this.$message.error("创建失败");
            }
          });
        }
      });
    },
    update_user(row) {
      this.activeAddForm = {};
      this.active = true;
      this.isConfirm = false;
      this.isUpdate = true;
      this.title = "edit user";
      const temp = {
        user_id: row.user_id,
      };
      findUser(temp).then((response) => {
        this.activeAddForm = response;
      });
    },
    is_update() {
      this.$refs["activeAddForm"].validate((valid) => {
        if (valid) {
          updateUser(this.activeAddForm).then((response) => {
            if (response.msg == "修改成功") {
              this.activeAddForm = {};
              this.$message.success("修改成功");
              this.getList();
              this.cancel();
            } else {
              this.$message.error("修改失败");
            }
          });
        }
      });
    },
    delete_user(row) {
      const temp = {
        user_id: row.user_id,
      };
      deleteUser(temp).then((response) => {
        if (response.msg == "删除成功") {
          this.$message.success("删除成功");
          this.getList();
        } else {
          this.$message.error("删除失败");
        }
      });
    },
    cancel() {
      this.activeAddForm = {};
      this.$refs["activeAddForm"].resetFields();
      this.active = false;
    },
  },
};
</script>

<style lang="scss" scoped>
#User_Page {
  .User_search {
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
