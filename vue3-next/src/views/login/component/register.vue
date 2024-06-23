<template>
	<el-form size="large" 
		class="login-content-form" style="height: 200px;overflow: auto;" 
		:model="state.ruleForm"
		:rules="rules"
		 ref="ruleFormRef"
		>
		<el-form-item class="login-animation1" prop="username">
			<el-input text placeholder="请输入账号" v-model="state.ruleForm.username" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="name">
			<el-input text placeholder="请输入昵称" v-model="state.ruleForm.name" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="password">
			<el-input type="password" placeholder="请输入密码" v-model="state.ruleForm.password" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="phone">
			<el-input type="text" :placeholder="'请输入手机号'" v-model="state.ruleForm.phone" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="age">
			<el-input type="text" placeholder="请输入用年龄" v-model="state.ruleForm.age" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="email">
			<el-input type="text" placeholder="请输入邮箱" v-model="state.ruleForm.email" clearable autocomplete="off">
			</el-input>
		</el-form-item>
		<el-form-item class="login-animation1" prop="gender">
			<el-radio-group v-model="state.ruleForm.gender" class="ml-4">
			  <el-radio label="1" size="large" >男</el-radio>
			  <el-radio label="0" size="large">女</el-radio>
			</el-radio-group>
		</el-form-item>
	</el-form>
	<el-button round type="primary" @click="submitForm()" class="registerBtn">
		<span>注册</span>
	</el-button>
</template>

<script setup lang="ts" name="loginMobile">
import { reactive, ref } from 'vue';
import { userApi } from '/@/api/user/index';

const userInterface = userApi();
const ruleFormRef = ref(null);
//验证邮箱的规则
var checkEmail = (rule,value,cb) => {
  //验证邮箱的正则表达式
  const regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
  if(regEmail.test(value)){
	//合法的邮箱
	return cb();
  }
  //邮箱不合法
  cb(new Error('请输入合法的邮箱！'));
}
//验证手机号的规则
var checkMobile = (rule,value,cb) =>{
  const regMobile = /^(0|86|17951)?(13[0-9]|15[0123456789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
  if(regMobile.test(value)){
	//合法的手机号
	return cb();
  }
  //手机号不合法
  cb(new Error('请输入合法的手机号！'));
}

const rules = reactive({
	name: [
		{ required: true, message: '请输入昵称', trigger: 'blur' },
	],
	username: [
		{ required: true, message: '请输入账户', trigger: 'blur' },
	],
	password: [
		{ required: true, message: '请输入密码', trigger: 'blur' },
	],
	phone: [
		{ required: true, message: '请输入电话', trigger: 'blur' },
		{ validator: checkMobile, trigger: 'blur'}
	],
	age: [
		{ required: true, message: '请输入年龄', trigger: 'blur' },
	],
	gender: [
		{ required: true, message: '请选择性别', trigger: 'change' },
	],
	email: [
		{ required: true, message: '请输入邮箱', trigger: 'blur' },
		{ validator: checkEmail, trigger: 'blur'}
	],
})
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
function submitForm(){
	ruleFormRef.value.validate((isValid, invalidFields) => {
	    if (isValid) {
	      // 表单所有元素验证通过，可以提交了
	      console.log('验证通过', state.ruleForm)
		  userInterface.registerUsers(state.ruleForm).then(res =>{
			  console.log(res, '注册')
		  })
	    } else {
	      console.log(invalidFields)
	      console.log('验证不通过,不能提交,请检查')
	    }
	  })
}
</script>

<style scoped lang="scss">
.login-content-form {
	margin-top: 20px;
	@for $i from 1 through 4 {
		.login-animation#{$i} {
			opacity: 0;
			animation-name: error-num;
			animation-duration: 0.5s;
			animation-fill-mode: forwards;
			animation-delay: calc($i/10) + s;
		}
	}
	.login-content-code {
		width: 100%;
		padding: 0;
	}
	.login-content-submit {
		width: 100%;
		letter-spacing: 2px;
		font-weight: 300;
		margin-top: 15px;
	}
	.login-msg {
		color: var(--el-text-color-placeholder);
	}
}
.registerBtn{
	width: 100%;font-size: 14px;
	height: 40px;margin-top: 25px;
	letter-spacing: 2px;
}
</style>
