<template>
  <div id="Bookkeeping_Page">
    <div class="Bookkeeping_search">
      <el-card class="card_select">
        <el-form
          :model="queryParams"
          ref="queryForm"
          :inline="true"
          label-width="120px"
          size="medium"
        >
          <el-form-item label="item：">
            <el-input
              v-model="queryParams.expenditure_item"
              placeholder="Please input item"
              clearable
            ></el-input>
          </el-form-item>
          <el-form-item label="method：">
            <el-select
              v-model="queryParams.expenditure_method"
              placeholder="Pleae select method..."
              clearable
            >
              <el-option
                v-for="item in methodList"
                :key="item.method_id"
                :label="item.method_content"
                :value="item.method_id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="type：">
            <el-select
              v-model="queryParams.expenditure_type"
              placeholder="Pleae select type..."
              clearable
            >
              <el-option
                v-for="item in typeList"
                :key="item.type_id"
                :label="item.type_content"
                :value="item.type_id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="date：">
            <el-date-picker
              v-model="queryParams.createDate"
              type="date"
              placeholder="Pleae select date..."
              format="yyyy-MM-dd"
              value-format="yyyy-MM-dd"
            >
            </el-date-picker>
          </el-form-item>
          <el-form-item label="action：">
            <el-button icon="el-icon-plus" @click="addItem">add</el-button>
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
        :data="dataList"
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
        <el-table-column label="item" prop="expenditure_item"></el-table-column>
        <el-table-column label="type" prop="type_content"></el-table-column>
        <el-table-column label="method" prop="method_content"></el-table-column>
        <el-table-column
          label="amount"
          prop="expenditure_amount"
        ></el-table-column>
        <el-table-column label="date" prop="createDate"></el-table-column>
        <el-table-column label="action">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="update_expenditure(scope.row)"
              >edit</el-button
            >
            <el-button
              size="mini"
              type="text"
              style="color: red"
              @click="delete_expenditure(scope.row)"
              >delete</el-button
            >
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
      v-loading="dialogLoading"
      :close-on-click-modal="false"
    >
      <el-form
        ref="activeAddForm"
        :model="activeAddForm"
        label-width="100px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="item：" prop="expenditure_item">
          <el-input
            v-model="activeAddForm.expenditure_item"
            placeholder="Pleae enter item..."
          ></el-input>
        </el-form-item>
        <el-form-item label="method：" prop="expenditure_method">
          <el-select
            v-model="activeAddForm.expenditure_method"
            placeholder="Pleae select method..."
            clearable
          >
            <el-option
              v-for="item in methodList"
              :key="item.method_id"
              :label="item.method_content"
              :value="item.method_id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="type：" prop="expenditure_type">
          <el-select
            v-model="activeAddForm.expenditure_type"
            placeholder="Pleae select type..."
            clearable
          >
            <el-option
              v-for="item in typeList"
              :key="item.type_id"
              :label="item.type_content"
              :value="item.type_id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="amount：" prop="expenditure_amount">
          <el-input
            v-model="activeAddForm.expenditure_amount"
            placeholder="Pleae enter amount..."
            type="number"
            min="0"
          ></el-input>
        </el-form-item>
        <el-form-item label="date：" prop="createDate">
          <el-date-picker
            v-model="activeAddForm.createDate"
            type="date"
            placeholder="Pleae select date..."
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
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
  select,
  selectId,
  updateExpenditure,
  addExpenditure,
  deleteId,
} from "@/api/list";
import moment from "moment";
import { listMethod } from "@/api/method";
import { listType } from "@/api/type";
export default {
  data() {
    return {
      loading: true,
      dialogLoading: false,
      active: false,
      title: null,
      isConfirm: false,
      isUpdate: false,
      total: 0,
      dataList: [],
      queryParams: {
        bk_method_id: this.$store.state.user_id,
        bk_type_id: this.$store.state.user_id,
        bk_id: this.$store.state.user_id,
        page: 1,
        pageSize: 10,
        expenditure_item: null,
        expenditure_method: null,
        expenditure_type: null,
        createDate: null,
      },
      activeAddForm: {
        bk_id: this.$store.state.user_id,
        expenditure_item: null,
        expenditure_method: null,
        expenditure_type: null,
        startDate: null,
        createDate: null,
      },
      rules: {
        expenditure_item: [
          {
            required: true,
            message: "Please enter item...",
            trigger: "blur",
          },
        ],
        expenditure_amount: [
          {
            required: true,
            message: "Please enter amount...",
            trigger: "blur",
          },
        ],
        expenditure_method: [
          {
            required: true,
            message: "Please enter method...",
            trigger: "change",
          },
        ],
        expenditure_type: [
          {
            required: true,
            message: "Please enter type...",
            trigger: "change",
          },
        ],
        createDate: [
          {
            required: true,
            message: "Please enter createDate...",
            trigger: "change",
          },
        ],
      },
      methodList: [],
      typeList: [],
    };
  },
  created() {
    window.addEventListener("resize", function () {
      var width = window.innerWidth;
      var height = window.innerHeight;
      if (width < 1293) {
        window.location.href = "/error.html";
      }
    });
    if (this.$store.state.user_id == null) {
      this.$message.error("登录失效请重新登录");
      this.$router.push("/");
    }
    this.getList();
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
    getList() {
      select(this.queryParams).then((response) => {
        this.dataList = response.list;
        this.total = response.total;
        this.loading = false;
      });
    },
    getMethodList() {
      listMethod(this.queryParams).then((response) => {
        this.methodList = response.list;
      });
    },
    getTypeList() {
      listType(this.queryParams).then((response) => {
        this.typeList = response.list;
      });
    },
    handleQuery() {
      this.queryParams.page = 1;
      this.getList();
    },
    reset() {
      this.queryParams = {
        bk_id: this.$store.state.user_id,
        page: 1,
        pageSize: 10,
        expenditure_item: null,
        expenditure_method: null,
        expenditure_type: null,
        expenditure_date: null,
      };
      this.getList();
    },
    addItem() {
      this.activeAddForm = {};
      this.active = true;
      this.isConfirm = true;
      this.isUpdate = false;
      this.title = "add expenditure";
    },
    is_confirm() {
      let date = new Date();
      let monthStart = date.setDate(1);
      let thisStartDay = moment(monthStart).format("YYYY-MM-DD");
      this.$refs["activeAddForm"].validate((valid) => {
        if (valid) {
          this.activeAddForm.bk_id = this.$store.state.user_id;
          this.activeAddForm.startDate = thisStartDay;
          addExpenditure(this.activeAddForm).then((response) => {
            this.dialogLoading = true;
            if (response.msg == "success") {
              this.activeAddForm = {};
              this.$message.success("complete");
              this.getList();
              this.dialogLoading = false;
              this.cancel();
            } else {
              this.$message.error("error");
              this.dialogLoading = false;
            }
          });
        }
      });
    },
    update_expenditure(row) {
      this.activeAddForm = {};
      this.active = true;
      this.isConfirm = false;
      this.isUpdate = true;
      this.title = "edit expenditure";
      const temp = {
        sort_id: row.sort_id,
      };
      selectId(temp).then((response) => {
        this.activeAddForm = response;
      });
    },
    is_update() {
      this.$refs["activeAddForm"].validate((valid) => {
        if (valid) {
          this.activeAddForm.bk_id = this.$store.state.user_id;
          updateExpenditure(this.activeAddForm).then((response) => {
            this.dialogLoading = true;
            if (response.msg == "success") {
              this.activeAddForm = {};
              this.$message.success("complete");
              this.getList();
              this.dialogLoading = false;
              this.cancel();
            } else {
              this.$message.error("error");
              this.dialogLoading = false;
            }
          });
        }
      });
    },
    delete_expenditure(row) {
      const temp = {
        sort_id: row.sort_id,
      };
      deleteId(temp).then((response) => {
        if (response.msg == "删除成功") {
          this.$message.success("complete");
          this.getList();
        } else {
          this.$message.error("error");
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
#Bookkeeping_Page {
  .Bookkeeping_search {
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
