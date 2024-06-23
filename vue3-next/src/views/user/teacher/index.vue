<template>
	<div style="padding: 20px">
		<el-row style="margin-bottom: 20px">
			<el-col :span="6">
				<el-input v-model="searchText" placeholder="请输入电话号码" size="default" class="search-input" />
				<el-button type="primary" size="default" @click="searchHandle">查询</el-button>
			</el-col>
		</el-row>
		<el-row>
			<el-col :span="6">
				<el-button type="primary" size="default" @click="addhHandle" icon="Plus">新增</el-button>
			</el-col>
		</el-row>
		<el-table :data="tableData" @selection-change="selectionHandle">
			<el-table-column type="selection" width="50" align="center" />
			<el-table-column type="index" width="50" />
			<el-table-column label="姓名" align="center" prop="name" />、
			<el-table-column label="性别" align="center" prop="sex" />
			<el-table-column label="工号" align="center" prop="number" :show-overflow-tooltip="true" />
			<el-table-column label="班级" align="center" prop="class_name" :show-overflow-tooltip="true" />
			<el-table-column label="邮箱" align="center" prop="email" :show-overflow-tooltip="true" />
			<el-table-column label="电话" align="center" prop="phone" width="120" />
			<el-table-column label="职称" align="center" prop="rank" width="120" />
			<el-table-column label="操作" align="center" width="200px">
				<template #default="scope">
					<el-button type="text" size="small" @click="handleEdit(scope.$index, scope.row)">修改</el-button>
					<el-button size="small" type="text" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
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
				<el-form-item label="姓名" :label-width="formLabelWidth">
					<el-input v-model="form.name" autocomplete="off" />
				</el-form-item>
				<el-form-item label="工号" :label-width="formLabelWidth">
					<el-input v-model="form.number" autocomplete="off" />
				</el-form-item>
				<el-form-item label="班级" :label-width="formLabelWidth">
					<el-input v-model="form.class_name" autocomplete="off" />
				</el-form-item>
				<el-form-item label="邮箱" :label-width="formLabelWidth">
					<el-input v-model="form.email" autocomplete="off" />
				</el-form-item>
				<el-form-item label="电话" :label-width="formLabelWidth">
					<el-input v-model="form.phone" autocomplete="off" />
				</el-form-item>
				<el-form-item label="职称" :label-width="formLabelWidth">
					<el-input v-model="form.rank" autocomplete="off" />
				</el-form-item>
				<el-form-item label="性别" :label-width="formLabelWidth">
					<!-- <el-input v-model="form.pingwei" autocomplete="off" /> -->
					<el-select v-model="form.sex">
						<el-option value="男" label="男"></el-option>
						<el-option value="女" label="女"></el-option>
					</el-select>
				</el-form-item>
			</el-form>
			<template #footer>
				<span class="dialog-footer">
					<el-button @click="dialogFormVisible = false">取消</el-button>
					<el-button type="primary" @click="addConfirm"> 确定 </el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { ElMessage } from 'element-plus';
import { classApi } from '/@/api/class/index';

const classInterface = classApi();
const loading = ref(true);
const userList = ref([]);
const total = ref(0);
const tableData = ref([]);
const searchText = ref('');
const dialogFormVisible = ref(false);
const titleindex = ref(0);
const titleList = reactive({
	title: ['新增', '修改'],
});
const formLabelWidth = '110px';
const form = ref({
	id: '',
	name: '',
	number: '',
	class_name: '',
	email: '',
	phone: '',
	rank: '',
	sex: '',
});

const data = reactive({
	queryParams: {
		pageNum: 1,
		pageSize: 10,
		userName: undefined,
		phonenumber: undefined,
		status: undefined,
		deptId: undefined,
	},
	ids: [],
});
/** 复选框触发 */
function selectionHandle(valData) {
	data.ids = [];
	valData.forEach((item) => {
		data.ids.push(item.id);
	});
}
/** 新增*/
function addhHandle() {
	reset();
	dialogFormVisible.value = true;
	titleindex.value = 0;
}
function addConfirm() {
	if (titleindex.value == 0) {
		classInterface.createTeacher(form.value).then((res) => {
			if (res.code == 200) {
				ElMessage({
					message: '添加成功！',
					type: 'success',
				});
			} else {
				ElMessage({
					message: res.data,
					type: 'error',
				});
			}
		});
	} else {
		classInterface.updateTeacher(form.value).then((res) => {
			if (res.code == 200) {
				ElMessage({
					message: '修改成功！',
					type: 'success',
				});
			} else {
				ElMessage({
					message: res.data,
					type: 'error',
				});
			}
		});
		getList();
	}

	dialogFormVisible.value = false;
	getList();
}
/** 行编辑 */
function handleEdit(index, row) {
	dialogFormVisible.value = true;
	titleindex.value = 1;
	reset();
	form.value.id = row.id;
	form.value.name = row.name;
	form.value.number = row.number;
	form.value.class_name = row.class_name;
	form.value.email = row.email;
	form.value.phone = row.phone;
	form.value.rank = row.rank;
	form.value.sex = row.sex;
}
function reset() {
	form.value = {
		id: undefined,
		name: undefined,
		number: undefined,
		class_name: undefined,
		email: undefined,
		phone: undefined,
		rank: undefined,
		sex: undefined,
	};
}
/** 行删除 */
function handleDelete(index, row) {
	const delete1 = {
		id: row.id,
	};
	classInterface.deleteTeacher(delete1).then((res) => {
		if (res.code == 200) {
			ElMessage({
				message: '删除成功！',
				type: 'success',
			});
		} else {
			ElMessage({
				message: res.data,
				type: 'error',
			});
		}
	});
	userList.value.forEach((item, i) => {
		if (row.id == item.id) {
			userList.value.splice(i, 1);
		}
	});
	tableData.value = userList.value;
	getList();
}
/** 批量删除 */
function delHandle() {
	let waiData = userList.value;
	data.ids.forEach((idItem) => {
		userList.value.forEach((item, i) => {
			if (idItem == item.id) {
				userList.value.splice(i, 1);
			}
		});
	});
	tableData.value = userList.value;
	refreshTable();
	ElMessage({
		message: '删除成功！',
		type: 'success',
	});
}
/** 查询功能 */
function searchHandle() {
	let searchvalue = searchText.value;
	if (searchvalue == '') {
		refreshTable();
	} else {
		tableData.value = userList.value.filter(function (agentlist) {
			return Object.keys(agentlist).some(function (key) {
				return String(agentlist[key]).toLowerCase().indexOf(searchvalue) > -1;
			});
		});
		tableData.value = tableData.value.slice(
			(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
			data.queryParams.pageNum * data.queryParams.pageSize
		);
	}
}
/** 页面条数触发 */
function handleSizeChange(newSize) {
	data.queryParams.pageSize = newSize;
	refreshTable();
}
/** 分页触发*/
function handleCurrentChange(newPage) {
	data.queryParams.pageNum = newPage;
	refreshTable();
}
/** 刷新列表 */
function refreshTable() {
	total.value = userList.value.length;
	tableData.value = userList.value.slice(
		(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
		data.queryParams.pageNum * data.queryParams.pageSize
	);
}
/** 查询用户列表 */
function getList() {
	classInterface.getAllTeacher().then((res) => {
		userList.value = res.data;
		total.value = userList.value.length;
		tableData.value = userList.value.slice(
			(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
			data.queryParams.pageNum * data.queryParams.pageSize
		);
	});
}
getList();
</script>

<style>
.search-input {
	width: 70%;
}
</style>
