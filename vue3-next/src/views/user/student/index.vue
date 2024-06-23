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
				<el-button type="primary" size="default" @click="selectRole" icon="Plus">查看关联角色</el-button>
			</el-col>
		</el-row>
		<el-table :data="tableData" ref="accountRef" @select="handleTableChange">
			<el-table-column type="selection" width="55" />
			<el-table-column label="ID" type="index" width="50" prop="id" />
			<el-table-column label="姓名" align="center" prop="name" />
			<el-table-column label="账号" align="center" prop="username" :show-overflow-tooltip="true" />
			<el-table-column label="性别" align="center" prop="gender" :show-overflow-tooltip="true">
				<template #default="scope">
					{{ genderFormate(scope.row.gender) }}
				</template>
			</el-table-column>
			<el-table-column label="年龄" align="center" prop="age" :show-overflow-tooltip="true" />
			<el-table-column label="电话" align="center" prop="phone" width="120" />
			<el-table-column label="邮箱" align="center" prop="email"  />
			<el-table-column label="创建时间" align="center" prop="create_time" >
				<template #default="scope">
					{{ formatTimer(scope.row.create_time) }}
				</template>
			</el-table-column>
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
			<el-form size="large" class="login-content-form" style="height: 200px; overflow: auto" :model="state.ruleForm" :rules="rules" ref="ruleFormRef">
				<el-form-item class="login-animation1" prop="username">
					<el-input text placeholder="请输入账号" v-model="state.ruleForm.username" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="name">
					<el-input text placeholder="请输入昵称" v-model="state.ruleForm.name" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="password">
					<el-input type="password" placeholder="请输入密码" v-model="state.ruleForm.password" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="phone">
					<el-input type="text" :placeholder="'请输入手机号'" v-model="state.ruleForm.phone" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="age">
					<el-input type="text" placeholder="请输入用年龄" v-model="state.ruleForm.age" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="email">
					<el-input type="text" placeholder="请输入邮箱" v-model="state.ruleForm.email" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="gender">
					<el-radio-group v-model="state.ruleForm.gender" class="ml-4">
						<el-radio :label="1" size="large">男</el-radio>
						<el-radio :label="0" size="large">女</el-radio>
					</el-radio-group>
				</el-form-item>
			</el-form>
			<template #footer>
				<span class="dialog-footer">
					<el-button @click="dialogFormVisible = false">取消</el-button>
					<el-button type="primary" @click="addConfirm"> 确定 </el-button>
				</span>
			</template>
		</el-dialog>
		<!-- 关联角色表 -->
		<el-dialog v-model="dialogRoleVisible" title="关联角色">
			<el-table :data="roleTableData" ref="roleTableRef">
				<el-table-column label="ID" type="index" width="50" prop="id" />
				<el-table-column label="姓名" align="center" prop="name" />
			</el-table>
		</el-dialog>
	</div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { ElMessage } from 'element-plus';
import { userApi } from '/@/api/user/index';

const accountRef = ref(null);
const userInterface = userApi();
const ruleFormRef = ref(null);
const dialogRoleVisible = ref(false);
const roleTableData = ref([]);

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

const data = reactive({
	queryParams: {
		pageNum: 1,
		pageSize: 5,
		userName: undefined,
		phonenumber: undefined,
		status: undefined,
		deptId: undefined,
	},
	ids: [],
	list: [],
	selectTable: [],
});
//验证邮箱的规则
var checkEmail = (rule, value, cb) => {
	//验证邮箱的正则表达式
	const regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (regEmail.test(value)) {
		//合法的邮箱
		return cb();
	}
	//邮箱不合法
	cb(new Error('请输入合法的邮箱！'));
};
//验证手机号的规则
var checkMobile = (rule, value, cb) => {
	const regMobile = /^(0|86|17951)?(13[0-9]|15[0123456789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	if (true) {
		//合法的手机号
		return cb();
	}
	//手机号不合法
	cb(new Error('请输入合法的手机号！'));
};

const rules = reactive({
	name: [{ required: true, message: '请输入昵称', trigger: 'blur' }],
	username: [{ required: true, message: '请输入账户', trigger: 'blur' }],
	password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
	phone: [
		{ required: true, message: '请输入电话', trigger: 'blur' },
		{ validator: checkMobile, trigger: 'blur' },
	],
	age: [{ required: true, message: '请输入年龄', trigger: 'blur' }],
	gender: [{ required: true, message: '请选择性别', trigger: 'change' }],
	email: [
		{ required: true, message: '请输入邮箱', trigger: 'blur' },
		{ validator: checkEmail, trigger: 'blur' },
	],
});
// 定义变量内容
const state = reactive({
	ruleForm: {
		username: '',
		password: '',
		phone: '',
		age: '',
		gender: '',
		email: '',
		code: '',
	},
});

function selectRole() {
	console.log(data.selectTable);
	if (data.selectTable.length == 0) {
		ElMessage({
			message: '请选择一行数据！',
			type: 'error',
		});
	} else {
		userInterface.getRoleByUserid({ user_id: data.selectTable[0].id }).then((res) => {
			console.log(res, 'guanlian的角色');
			dialogRoleVisible.value = true;
			roleTableData.value = res.data;
		});
	}
}
// 性别格式化
function genderFormate(gender) {
	if (gender == 1) {
		return '男';
	} else {
		return '女';
	}
}
/** 单选框触发 */
function handleTableChange(list, row) {
	if (list.length === 0) {
		data.selectTable = [];
		return;
	}
	// let itemData = JSON.parse(JSON.stringify(row))
	accountRef.value.clearSelection();
	tableData.value.forEach((ele) => {
		if (ele.id === row.id) {
			accountRef.value.toggleRowSelection(ele, true);
			data.selectTable = [ele];
		}
	});
}
/** 新增*/
function addhHandle() {
	reset();
	dialogFormVisible.value = true;
	titleindex.value = 0;
}
function addConfirm() {
	ruleFormRef.value.validate((isValid, invalidFields) => {
		// 表单所有元素验证通过，可以提交了
		if (isValid) {
			if (titleindex.value == 0) {
				console.log('验证通过', state.ruleForm);
				userInterface.registerUsers(state.ruleForm).then((res) => {
					console.log(res, '添加用户');
					if (res.code == 200) {
						ElMessage({
							message: '添加成功！',
							type: 'success',
						});
						dialogFormVisible.value = false;
						getList();
					} else {
						ElMessage({
							message: res.data,
							type: 'error',
						});
					}
				});
			} else {
				userInterface.updateUsers(state.ruleForm).then((res) => {
					if (res.code == 200) {
						ElMessage({
							message: '修改成功！',
							type: 'success',
						});
						dialogFormVisible.value = false;
						getList();
					} else {
						ElMessage({
							message: res.data,
							type: 'error',
						});
					}
				});
			}
		} else {
			console.log(invalidFields);
			console.log('验证不通过,不能提交,请检查');
		}
	});
}
/** 行编辑 */
function handleEdit(index, row) {
	dialogFormVisible.value = true;
	titleindex.value = 1;
	reset();
	console.log(row, 'row');
	state.ruleForm.id = row.id;
	state.ruleForm.name = row.name;
	state.ruleForm.username = row.username;
	state.ruleForm.password = row.password;
	state.ruleForm.phone = row.phone;
	state.ruleForm.age = row.age;
	state.ruleForm.gender = row.gender;
	state.ruleForm.email = row.email;
}
function reset() {
	state.ruleForm = {
		username: '',
		password: '',
		phone: '',
		age: '',
		gender: '',
		email: '',
	};
}
/** 行删除 */
function handleDelete(index, row) {
	userInterface.deleteUsers({ id: row.id }).then((res) => {
		if (res.code == 200) {
			ElMessage({
				message: '删除成功！',
				type: 'success',
			});
			getList();
		} else {
			ElMessage({
				message: res.data,
				type: 'error',
			});
		}
	});
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
// 时间格式化
function formatTimer(time) {
	let date = new Date(time);
	let y = date.getFullYear();
	let MM = date.getMonth() + 1;
	MM = MM < 10 ? '0' + MM : MM;
	let d = date.getDate();
	d = d < 10 ? '0' + d : d;
	let h = date.getHours();
	h = h < 10 ? '0' + h : h;
	let m = date.getMinutes();
	m = m < 10 ? '0' + m : m;
	let s = date.getSeconds();
	s = s < 10 ? '0' + s : s;
	return y + '-' + MM + '-' + d + ' ' + h + ':' + m;
}
/** 查询用户列表 */
function getList() {
	userInterface.getAllUsers().then((res) => {
		console.log(res);
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
