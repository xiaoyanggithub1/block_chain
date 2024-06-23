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
				<el-button type="primary" size="default" @click="reset">重置</el-button>
				<el-button type="success" size="default" @click="sync">同步最长链数据</el-button>
			</el-col>
		</el-row>
		<el-table :data="tableData" ref="accountRef" @select="handleTableChange">
			<el-table-column type="selection" width="55" />
			<el-table-column label="ID" type="index" width="50" prop="id" />
			<el-table-column label="姓名" align="center" prop="name" />
			<el-table-column label="班级" align="center" prop="class_name" :show-overflow-tooltip="true" />
			<el-table-column label="性别" align="center" prop="sex" :show-overflow-tooltip="true">
				<template #default="scope">
					{{ genderFormate(scope.row.sex) }}
				</template>
			</el-table-column>
			<el-table-column label="年龄" align="center" prop="age" :show-overflow-tooltip="true" />
			<el-table-column label="电话" align="center" prop="phone" />
			<el-table-column label="情绪倾向" align="center" prop="emotion" />
			<el-table-column label="创建时间" align="center" prop="grade_time">
				<template #default="scope">
					{{ formatTimer(scope.row.grade_time) }}
				</template>
			</el-table-column>
		</el-table>
		<el-pagination
			@current-change="handleCurrentChange"
			@size-change="handleSizeChange"
			:current-page="data.queryParams.pageNum"
			:page-sizes="[7, 14]"
			:page-size="data.queryParams.pageSize"
			layout="total, sizes, prev, pager, next, jumper"
			:total="total"
		></el-pagination>

		<el-dialog v-model="dialogFormVisible" :title="titleList.title[titleindex]">
			<el-form size="large" class="login-content-form" style="height: 200px; overflow: auto" :model="state.ruleForm" :rules="rules" ref="ruleFormRef">
				<el-form-item class="login-animation1" prop="name">
					<el-input text placeholder="请输入学生姓名" v-model="state.ruleForm.name" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="age">
					<el-input text placeholder="请输入年龄" v-model="state.ruleForm.age" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="class_name">
					<el-input type="text" placeholder="请输入班级" v-model="state.ruleForm.class_name" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="phone">
					<el-input type="text" :placeholder="'请输入电话号码'" v-model="state.ruleForm.phone" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="emotion">
					<el-input type="text" :placeholder="'请输入情绪倾向'" v-model="state.ruleForm.emotion" clearable autocomplete="off"> </el-input>
				</el-form-item>
				<el-form-item class="login-animation1" prop="mind_issue">
					<el-input v-model="state.ruleForm.mind_issue" :autosize="{ minRows: 2, maxRows: 4 }" type="textarea" placeholder="请输入心理问题" />
				</el-form-item>
				<el-form-item class="login-animation1" prop="mind_advice">
					<el-input v-model="state.ruleForm.mind_advice" :autosize="{ minRows: 2, maxRows: 4 }" type="textarea" placeholder="请输入问题建议" />
				</el-form-item>
				<el-form-item class="login-animation1" prop="tutor_log">
					<el-input v-model="state.ruleForm.tutor_log" :autosize="{ minRows: 2, maxRows: 4 }" type="textarea" placeholder="请输入辅导记录" />
				</el-form-item>
				<el-form-item class="login-animation1" prop="sex">
					<el-radio-group v-model="state.ruleForm.sex" class="ml-4">
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
	</div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { ElMessage } from 'element-plus';
import { stuinfoApi } from '/@/api/studentInfo/index';
// import { log } from 'console';

const accountRef = ref(null);
const userInterface = stuinfoApi();

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

const state = reactive({
	ruleForm: {
		name: '',
		sex: '',
		age: '',
		class_name: '',
		phone: '',
		mind_score: '',
		mind_issue: '',
		mind_advice: '',
		tutor_log: '',
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
	dialogFormVisible.value = true;
	titleindex.value = 0;
}
function addConfirm() {
	ruleFormRef.value.validate((isValid, invalidFields) => {
		// 表单所有元素验证通过，可以提交了
		if (isValid) {
			if (titleindex.value == 0) {
				// console.log('验证通过', state.ruleForm);
				userInterface.transaction(state.ruleForm).then((res) => {
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
				state.ruleForm = {};
				// 延时1秒执行函数
				const delayExecution = async () => {
					await new Promise((resolve) => setTimeout(resolve, 100)); // 延时1秒
					userInterface.mine().then((res) => {
						if (res.code == 200) {
							ElMessage({
								message: '广播成功！',
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
				};
				// 调用延时函数
				delayExecution();
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

const searchHandle = () => {
	// 获取输入框中的电话号码
	const phone = searchText.value;
	const data = {
		phone: phone,
	};
	tableData.value = ''; // 清空tableData的值
	//   调用接口
	userInterface
		.phoneSelectStudent(data)
		.then((res) => {
			tableData.value = [res.data]; // 将返回的数据赋给tableData
			total.value = 1;
		})
		.catch((error) => {
			console.error(error);
		});
	searchText.value = '';
};

function reset() {
	getList();
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

/** 页面条数触发 */
function handleSizeChange(newSize) {
	data.queryParams.pageSize = newSize;
	getList();
}
/** 分页触发*/
function handleCurrentChange(newPage) {
	data.queryParams.pageNum = newPage;
	getList(newPage);
}

// 同步最长链
function sync() {
	userInterface.chainSync().then((res) => {
		if (res.code == 200) {
			userInterface.BlockAddMysql().then((res) => {
				console.log(res);
				ElMessage({
					message: '同步成功！',
					type: 'success',
				});
				getList();
			});
		} else {
			ElMessage({
				message: res.data,
				type: 'error',
			});
		}
	});
}

function getList(newPage) {
	const pagedata = {
		page: newPage,
		size: 10,
	};
	userInterface.getAllStudent(pagedata).then((res) => {
		userList.value = res.data.mental;
		total.value = res.data.total_count;
		tableData.value = res.data.mental;
	});
}
getList();
</script>

<style>
.search-input {
	width: 70%;
}
</style>
