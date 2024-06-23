<template>
  <div style="padding: 20px;">
    <el-row style="margin-bottom: 20px;">
      <el-col :span="6">
        <el-input v-model="searchText" placeholder="Please input" size="default" class="search-input"/>
        <el-button type="primary" size="default" @click="searchHandle">查询</el-button>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6">
        <el-button type="primary" size="default" @click="addhHandle" icon="Plus">新增</el-button>
        <el-button icon="Delete" type="danger" size="default" @click="delHandle">删除选中行</el-button>
      </el-col>
    </el-row>
    <el-table  :data="tableData" @selection-change="selectionHandle" >
       <el-table-column type="selection" width="50" align="center" />
       <el-table-column type="index" width="50" />
       <el-table-column label="大类名称" align="center" prop="dalei"  />
       <el-table-column label="小类名称" align="center" prop="xiaolei"  :show-overflow-tooltip="true" />
       <el-table-column label="参赛队人员上限" align="center"  prop="cansai"  :show-overflow-tooltip="true" />
       <el-table-column label="指导教师人员上限" align="center"  prop="zhidao"  :show-overflow-tooltip="true" />
       <el-table-column label="国赛队伍上限" align="center" prop="guosai" width="120" />
       <el-table-column label="操作" align="center" width="200px" >
         <template #default="scope">
           <el-button type="text" size="small" @click="handleEdit(scope.$index, scope.row)"
             >修改</el-button
           >
           <el-button
             size="small"
             type="text"
             @click="handleDelete(scope.$index, scope.row)"
             >删除</el-button
           >
         </template>
       </el-table-column>
    </el-table>
    <el-pagination
     @current-change="handleCurrentChange"
     @size-change="handleSizeChange"
     :current-page="data.queryParams.pageNum"
     :page-sizes="[10, 20, 30, 40]"
     :page-size="data.queryParams.pageSize"
     layout="total, sizes, prev, pager, next, jumper"
     :total="total"
    ></el-pagination>

    <el-dialog v-model="dialogFormVisible" :title="titleList.title[titleindex]">
      <el-form :model="form" :inline="true">
        <el-form-item label="大类名称" :label-width="formLabelWidth">
          <el-input v-model="form.dalei" autocomplete="off" />
        </el-form-item>
        <el-form-item label="小类名称" :label-width="formLabelWidth">
          <el-input v-model="form.xiaolei" autocomplete="off" />
        </el-form-item>
        <el-form-item label="参赛队人员上限" :label-width="formLabelWidth">
          <el-input v-model="form.cansai" autocomplete="off" />
        </el-form-item>
        <el-form-item label="指导教师人员上限" :label-width="formLabelWidth">
          <el-input v-model="form.zhidao" autocomplete="off" />
        </el-form-item>
        <el-form-item label="国赛队伍上限" :label-width="formLabelWidth">
          <el-input v-model="form.guosai" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer> <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="addConfirm">
            确定
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
  import { ref, reactive  } from 'vue'
  import { ElMessage } from 'element-plus'
  const loading = ref(true);
  const userList = ref([]);
  const total = ref(0);
  const tableData = ref([])
  const searchText = ref('')
  const dialogFormVisible = ref(false)
  const titleindex = ref(0)
  const titleList = reactive({
    title:["新增", "修改"]
  })
  const formLabelWidth = '110px'
  const form = ref({
    id: "",
    dalei: "",
    xiaolei: "",
    cansai: "",
    zhidao: "",
    guosai: ""
  })

  const data = reactive({
    queryParams: {
      pageNum: 1,
      pageSize: 5,
      userName: undefined,
      phonenumber: undefined,
      status: undefined,
      deptId: undefined
    },
    ids: []
  })
  /** 复选框触发 */
  function selectionHandle(valData){
    data.ids = []
    valData.forEach((item) =>{
      data.ids.push(item.id)
    })
  }
  /** 新增*/
  function addhHandle(){
    reset()
    dialogFormVisible.value = true
    titleindex.value = 0
  }
  function addConfirm(){
    if(titleindex.value == 0){
      form.value.id = ('000000' + Math.floor(Math.random() * 999999)).slice(-6)
      tableData.value = userList.value.unshift(form.value)
      ElMessage({
        message: '添加成功！',
        type: 'success',
      })
    }else{
      userList.value.forEach((item, i) =>{
        if(item.id == form.value.id){
          userList.value[i] = form.value
        }
      })
      tableData.value = userList.value
      ElMessage({
        message: '修改成功！',
        type: 'success',
      })
    }

    dialogFormVisible.value = false
    refreshTable()
  }
  /** 行编辑 */
  function handleEdit(index, row){
    dialogFormVisible.value = true
    titleindex.value = 1
    reset()
    console.log(row, "row")
    form.value.id = row.id
    form.value.dalei = row.dalei
    form.value.xiaolei = row.xiaolei
    form.value.cansai = row.cansai
    form.value.zhidao = row.zhidao
    form.value.guosai = row.guosai
  }
  function reset(){
    form.value = {
      id: undefined,
      dalei: undefined,
      xiaolei: undefined,
      cansai: undefined,
      zhidao: undefined,
      guosai: undefined,
    }
  }
  /** 行删除 */
  function handleDelete(index, row){
    userList.value.forEach((item, i) =>{
      if(row.id == item.id){
        userList.value.splice(i, 1)
      }
    })
    tableData.value = userList.value
    refreshTable()
    ElMessage({
      message: '删除成功！',
      type: 'success',
    })
  }
  /** 批量删除 */
  function delHandle(){
    let waiData = userList.value
    data.ids.forEach((idItem) =>{
      userList.value.forEach((item, i) =>{
        if(idItem == item.id){
          userList.value.splice(i, 1)
        }
      })
    })
    tableData.value = userList.value
    refreshTable()
    ElMessage({
      message: '删除成功！',
      type: 'success',
    })
  }
  /** 查询功能 */
  function searchHandle(){
    let searchvalue = searchText.value
    if(searchvalue == ""){
      refreshTable()
    }else{
      tableData.value = userList.value.filter(function(agentlist) {
        return Object.keys(agentlist).some(function(key) {
          return String(agentlist[key]).toLowerCase().indexOf(searchvalue) > -1
        })
      })
      tableData.value = tableData.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
    }

  }
  /** 页面条数触发 */
  function handleSizeChange(newSize){
    data.queryParams.pageSize = newSize;
    refreshTable()
  }
  /** 分页触发*/
  function handleCurrentChange(newPage){
    data.queryParams.pageNum = newPage;
    refreshTable()
  }
  /** 刷新列表 */
  function refreshTable(){
    total.value = userList.value.length;
    tableData.value = userList.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
  }
  /** 查询用户列表 */
  function getList() {
    userList.value = [
      {id: 1,  dalei: '大类1', xiaolei: '小类1',cansai: "3", zhidao: "2", guosai: "2" },
      {id: 2,  dalei: '大类2', xiaolei: '小类2',cansai: "2", zhidao: "3", guosai: "3" },
      {id: 3,  dalei: '大类3', xiaolei: '小类3',cansai: "1", zhidao: "1", guosai: "4" },
      {id: 4,  dalei: '大类4', xiaolei: '小类4',cansai: "3", zhidao: "4", guosai: "3" },
      {id: 5,  dalei: '大类5', xiaolei: '小类5',cansai: "2", zhidao: "5", guosai: "2" },
      {id: 6,  dalei: '大类6', xiaolei: '小类6',cansai: "1", zhidao: "4", guosai: "1" },
    ];
    total.value = userList.value.length;
    tableData.value = userList.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
  };
  getList()
</script>

<style>
  .search-input{
    width: 70%;
  }
</style>
