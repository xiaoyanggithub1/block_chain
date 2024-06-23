<template>
	<div class="content">
		<div class="box">
			<el-input v-model="searchText" placeholder="请输入电话号码查询" size="default" class="search-input" />
			<el-button type="primary" size="default" @click="searchHandle">查询</el-button>>
		</div>

		<div class="title-class">{{ state.responseData.name }}的心理健康信息</div>
		<div class="card">
			<el-descriptions :column="4" border>
				<el-descriptions-item label="姓名" label-align="center" align="center" width="150px">{{ state.responseData.name }}</el-descriptions-item>
				<el-descriptions-item label="性别" label-align="center" align="center" width="150px">{{ state.sexData }}</el-descriptions-item>
				<el-descriptions-item label="年龄" label-align="center" align="center" width="150px">{{ state.responseData.age }}</el-descriptions-item>

				<el-descriptions-item label="班级" label-align="center" align="center" width="150px">
					<!-- <el-tag size="small">School</el-tag> -->
					{{ state.responseData.class_name }}
				</el-descriptions-item>
				<el-descriptions-item label="手机号码" label-align="centert" align="center">{{ state.responseData.phone }}</el-descriptions-item>
				<el-descriptions-item label="情绪" label-align="centert" align="center" label-class-name="my-label" class-name="my-content">{{
					state.responseData.emotion
				}}</el-descriptions-item>
				<el-descriptions-item label="更新时间" label-align="centert" align="center">{{ state.responseData.grade_time }}</el-descriptions-item>
			</el-descriptions>
		</div>

		<div class="demo-collapse">
			<el-collapse v-model="activeNames" @change="handleChange">
				<el-collapse-item name="1" class="collapse1">
					<template #title>
						<div class="one">心理问题</div>
					</template>
					<div>
						{{ state.responseData.mind_issue }}
					</div>
				</el-collapse-item>
				<el-collapse-item title="心理建议" title-class-name="one" name="2" class="collapse2">
					<div>{{ state.responseData.mind_advice }}</div>
				</el-collapse-item>
				<el-collapse-item title="心理辅导记录" name="3" class="collapse3">
					<div>{{ state.responseData.tutor_log }}</div>
				</el-collapse-item>
				<el-collapse-item title="情绪" name="4" class="collapse4">
					<div>{{ state.responseData.emotion }}</div>
				</el-collapse-item>
			</el-collapse>
		</div>
	</div>
</template>

<script setup lang="ts">
import { log } from 'console';
import { computed, reactive, ref } from 'vue';
import { stuinfoApi } from '/@/api/studentInfo/index';

const userInterface = stuinfoApi();
const title = ref('莉莉的心理健康信息');
const searchText = ref('');

const activeNames = ref(['1']);
const handleChange = (val: string[]) => {
	console.log(val);
};

const state = reactive({
	ruleForm: {
		name: '',
		password: '',
		phone: '',
		age: '',
		sex: '',
		email: '',
		code: '',
		emotion: '',
	},
	responseData: reactive({}), // 使用reactive创建响应式数据对象
	sexData: reactive({}), // 使用reactive创建响应式数据对象
});

userInterface
	.loginStudent(state)
	.then((res) => {
		state.responseData = res.data; // 将返回的数据赋给响应式数据responseData
		// console.log(res.data.sex);
		if (res.data.sex == 1) {
			state.sexData = '男';
		} else {
			state.sexData = '女';
		}
	})
	.catch((error) => {
		console.error(error);
	});

const searchHandle = () => {
	// 获取输入框中的电话号码
	const phone = searchText.value;
	const data = {
		'phone':phone
	}
	//   调用接口
	userInterface
		.phoneSelectStudent(data)
		.then((res) => {
			console.log(res);			
			state.responseData = res.data; // 将返回的数据赋给响应式数据responseData
		})
		.catch((error) => {
			console.error(error);
		});
};
</script>

<style scoped>
:deep(.my-label) {
	background: var(--el-color-success-light-9) !important;
}
:deep(.my-content) {
	background: var(--el-color-danger-light-9);
}

.title-class {
	font-family: 'Arial', sans-serif;
	font-size: 50px;
	color: rgb(62, 60, 60);
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}
.card {
	margin-left: 20px;
	margin-right: 20px;
	border: 5px solid rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;

	/* box-shadow: 0 0 0 10px #009688;
	border: 10px solid #e2e3e3;
	outline: dashed 10px white; */
}
.info {
	margin-left: 15%;
}
.demo-collapse {
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
	border: 5px solid rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
}
.el-collapse-item__header_ {
	color: aqua;
	font-size: 60px;
	/* padding-left: 20px; */
}

.el-collapse {
	--el-collapse-border-color: var(--el-border-color-lighter);
	--el-collapse-header-height: 60px;
	--el-collapse-header-bg-color: #fde6e0;
	--el-collapse-header-text-color: #414441;
	--el-collapse-header-font-size: 20px;
	--el-collapse-content-bg-color: var(--el-fill-color-blank);
	--el-collapse-content-font-size: 13px;
	--el-collapse-content-text-color: var(--el-text-color-primary);
	/* --el-collapse-content-text-align: center; */
	border-top: 1px solid var(--el-collapse-border-color);
	border-bottom: 1px solid var(--el-collapse-border-color);
}
* {
	margin: 0;
	padding: 2px;
	box-sizing: border-box;
	outline: none !important;
}
.el-collapse-item__header {
	width: 100%;

	border: none;
	display: flex;
	align-items: center;
	height: var(--el-collapse-header-height);
	line-height: var(--el-collapse-header-height);
	background-color: var(--el-collapse-header-bg-color);
	color: var(--el-collapse-header-text-color);
	cursor: pointer;
	border-bottom: 1px solid var(--el-collapse-border-color);
	font-size: var(--el-collapse-header-font-size);
	font-weight: 500;
	transition: border-bottom-color var(--el-transition-duration);
	outline: 0;
	text-align: center;
	padding-left: 20px;
}
.search-input {
	width: 20%;
}
.box {
	position: relative;
	left: 20px;
	top: 25px;
}
.el-button {
	width: 50px;
}
.content{
	display: block;
}
</style>
