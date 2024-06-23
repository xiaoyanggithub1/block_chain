<template>
	<div class="personal layout-pd">
		<el-row>
			<!-- 个人信息 -->
			<el-col :xs="24" :sm="16">
				<el-card shadow="hover" header="个人信息" class="personinfo">
					<div class="personal-user">
						<div class="personal-user-left">
							<el-upload class="h100 personal-user-left-upload" action="https://jsonplaceholder.typicode.com/posts/" multiple :limit="1">
								<img class="touxiang" src="src\assets\smallcat.jpg" />
							</el-upload>
						</div>
						<div class="personal-user-right">
							<el-row>
								<el-col :span="24" class="personal-title mb18"
									>{{ currentTime }},{{ tableData.username }}生活变的再糟糕，也不妨碍我变得更好！
								</el-col>
								<el-col :span="24">
									<el-row>
										<el-col :xs="24" :sm="8" class="personal-item mb6">
											<div class="personal-item-label">昵称：</div>
											<div class="personal-item-value">{{ tableData.name }}</div>
										</el-col>
										<el-col :xs="24" :sm="16" class="personal-item mb6">
											<div class="personal-item-label">身份：</div>
											<div class="personal-item-value">超级管理员</div>
										</el-col>
									</el-row>
								</el-col>
								<el-col :span="24">
									<el-row>
										<el-col :xs="24" :sm="8" class="personal-item mb6">
											<div class="personal-item-label">登录IP：</div>
											<div class="personal-item-value">云南</div>
										</el-col>
										<el-col :xs="24" :sm="16" class="personal-item mb6">
											<div class="personal-item-label">登录时间：</div>
											<div class="personal-item-value">{{ currentTime2 }}</div>
										</el-col>
									</el-row>
								</el-col>
							</el-row>
						</div>
					</div>
				</el-card>
			</el-col>

			<!-- 消息通知 -->
			<el-col :xs="24" :sm="8" class="pl15 personal-info">
				<el-card shadow="hover" style="background-color: #c2f3fe">
					<template #header>
						<span>消息通知</span>
						<span class="personal-info-more">更多</span>
					</template>
					<div class="personal-info-box">
						<ul class="personal-info-ul">
							<li v-for="(v, k) in state.newsInfoList" :key="k" class="personal-info-li">
								<a :href="v.link" target="_block" class="personal-info-li-title">{{ v.title }}</a>
							</li>
						</ul>
					</div>
				</el-card>
			</el-col>

			<!-- 更新信息 -->
			<el-col :span="24">
				<el-card shadow="hover" class="personal-edit" header="更新信息">
					<div class="commenInfo">
						<div class="personal-edit-title">基本信息</div>
						<el-form :model="state.personalForm" size="default" label-width="40px" class="list">
							<el-row :gutter="35">
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="账号">
										<el-input v-model="state.personalForm.username" placeholder="请输入账号" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="昵称">
										<el-input v-model="state.personalForm.name" placeholder="请输入昵称" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="密码">
										<el-input v-model="state.personalForm.password" placeholder="请输入密码" type="password" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="邮箱">
										<el-input v-model="state.personalForm.email" placeholder="请输入邮箱" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="班级">
										<el-input v-model="state.personalForm.class_name" placeholder="请输入班级" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="手机">
										<el-input v-model="state.personalForm.phone" placeholder="请输入手机" clearable></el-input>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="mb20">
									<el-form-item label="性别">
										<el-select v-model="state.personalForm.gender" placeholder="请选择性别" clearable class="w100">
											<el-option label="男" value="1"></el-option>
											<el-option label="女" value="0"></el-option>
										</el-select>
									</el-form-item>
								</el-col>
								<el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
									<el-form-item>
										<el-button type="primary" @click="updateHandle">
											<el-icon>
												<ele-Position />
											</el-icon>
											更新个人信息
										</el-button>
									</el-form-item>
								</el-col>
							</el-row>
						</el-form>
					</div>
					<div class="personal-edit-title mb15">账号安全</div>
					<div class="personal-edit-safe-box">
						<div class="personal-edit-safe-item">
							<div class="personal-edit-safe-item-left">
								<div class="personal-edit-safe-item-left-label">账户密码</div>
								<div class="personal-edit-safe-item-left-value">当前密码强度：强</div>
							</div>
							<div class="personal-edit-safe-item-right">
								<el-button color="#626aef">立即修改</el-button>
							</div>
						</div>
					</div>
					<div class="personal-edit-safe-box">
						<div class="personal-edit-safe-item">
							<div class="personal-edit-safe-item-left">
								<div class="personal-edit-safe-item-left-label">密保手机</div>
								<div class="personal-edit-safe-item-left-value">已绑定手机：132****4108</div>
							</div>
							<div class="personal-edit-safe-item-right">
								<el-button color="#626aef">立即修改</el-button>
							</div>
						</div>
					</div>
					<div class="personal-edit-safe-box">
						<div class="personal-edit-safe-item">
							<div class="personal-edit-safe-item-left">
								<div class="personal-edit-safe-item-left-label">密保问题</div>
								<div class="personal-edit-safe-item-left-value">已设置密保问题，账号安全大幅度提升</div>
							</div>
							<div class="personal-edit-safe-item-right">
								<el-button color="#626aef">立即设置</el-button>
							</div>
						</div>
					</div>
					<div class="personal-edit-safe-box">
						<div class="personal-edit-safe-item">
							<div class="personal-edit-safe-item-left">
								<div class="personal-edit-safe-item-left-label">绑定QQ</div>
								<div class="personal-edit-safe-item-left-value">已绑定QQ：110****566</div>
							</div>
							<div class="personal-edit-safe-item-right">
								<el-button color="#626aef">立即设置</el-button>
							</div>
						</div>
					</div>
				</el-card>
			</el-col>
		</el-row>
	</div>
</template>

<script setup lang="ts" name="personal">
import { reactive, computed, onMounted, ref } from 'vue';
import { formatAxis } from '/@/utils/formatTime';
import { newsInfoList, recommendList } from './mock';
import { userApi } from '/@/api/user/index';
import { ElMessage } from 'element-plus';

const tableData = ref([]);
const userInterface = userApi();
const currentTime2 = ref('');
// 定义变量内容
const state = reactive<PersonalState>({
	newsInfoList,
	recommendList,
	personalForm: {
		id: '',
		username: '',
		name: '',
		password: '',
		email: '',
		class_name: '',
		phone: '',
		gender: '',
	},
});

userInterface.currentUser().then((res) => {
	console.log(res.data);
	tableData.value = res.data;
	state.personalForm.id = res.data.id;
});
function updateHandle() {
	userInterface.updateUsers(state.personalForm).then((res) => {
		if (res.code == 200) {
			ElMessage({
				message: '个人信息更新成功',
				type: 'success',
			});
		} else {
			ElMessage({
				message: res.data,
				type: 'error',
			});
		}
	});
}
// 当前时间提示语
const currentTime = computed(() => {
	return formatAxis(new Date());
});

const getCurrentTime = () => {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, '0');
	const day = String(date.getDate()).padStart(2, '0');
	const hour = String(date.getHours()).padStart(2, '0');
	const minute = String(date.getMinutes()).padStart(2, '0');
	const second = String(date.getSeconds()).padStart(2, '0');
	currentTime2.value = `${year}-${month}-${day} ${hour}:${minute}:${second}`;
	console.log(currentTime2.value);
};
getCurrentTime();
</script>

<style scoped lang="scss">
@import '../../theme/mixins/index.scss';

.personal {
	.personinfo {
		background-color: #ffe1e1;
		// background-image: url('/@/assets/smallcat.jpg');
	}
	.personal-user {
		height: 130px;
		display: flex;
		align-items: center;
		.personal-user-left {
			width: 130px;
			height: 130px;
			border-radius: 50%;
			// border: solid #fffdfd 2px;

			:deep(.el-upload) {
				height: 100%;
			}
			.touxiang {
				border-radius: 50%;
				// border-radius: 50%;
				border: solid #fffdfd 3px;
			}
			.personal-user-left-upload {
				img {
					width: 100%;
					height: 100%;
					border-radius: 50%;
				}
				&:hover {
					img {
						animation: logoAnimation 0.3s ease-in-out;
					}
				}
			}
		}
		.personal-user-right {
			flex: 1;
			padding: 0 15px;
			.personal-title {
				font-size: 18px;
				@include text-ellipsis(1);
			}
			.personal-item {
				display: flex;
				align-items: center;
				font-size: 13px;
				.personal-item-label {
					color: var(--el-text-color-secondary);
					@include text-ellipsis(1);
				}
				.personal-item-value {
					@include text-ellipsis(1);
				}
			}
		}
	}

	.personal-info {
		.personal-info-more {
			float: right;
			color: var(--el-text-color-secondary);
			font-size: 13px;
			&:hover {
				color: var(--el-color-primary);
				cursor: pointer;
			}
		}
		.personal-info-box {
			height: 130px;
			overflow: hidden;
			.personal-info-ul {
				list-style: none;
				.personal-info-li {
					font-size: 13px;
					padding-bottom: 10px;
					.personal-info-li-title {
						display: inline-block;
						@include text-ellipsis(1);
						color: var(--el-text-color-secondary);
						text-decoration: none;
					}
					& a:hover {
						color: var(--el-color-primary);
						cursor: pointer;
					}
				}
			}
		}
	}
	.personal-recommend-row {
		.personal-recommend-col {
			.personal-recommend {
				position: relative;
				height: 100px;
				border-radius: 3px;
				overflow: hidden;
				cursor: pointer;
				&:hover {
					i {
						right: 0px !important;
						bottom: 0px !important;
						transition: all ease 0.3s;
					}
				}
				i {
					position: absolute;
					right: -10px;
					bottom: -10px;
					font-size: 70px;
					transform: rotate(-30deg);
					transition: all ease 0.3s;
				}
				.personal-recommend-auto {
					padding: 15px;
					position: absolute;
					left: 0;
					top: 5%;
					color: var(--next-color-white);
					.personal-recommend-msg {
						font-size: 12px;
						margin-top: 10px;
					}
				}
			}
		}
	}
	.personal-edit {
		background-image: url('/@/assets/bgbg.png');
		background-size: cover;
		margin-top: 5px;
		// color: #0000;
		// .list {
		// 	color: hsl(0, 54%, 65%);
		// 	background-color: #ffe1e1;
		// }
		// .commenInfo {
		// 	background: #ffe1e1;
		// }
		.personal-edit-title {
			position: relative;
			padding-left: 10px;
			// color: var(--el-text-color-regular);
			color: #000000;
			&::after {
				content: '';
				width: 2px;
				height: 10px;
				position: absolute;
				left: 0;
				top: 50%;
				transform: translateY(-50%);
				background: var(--el-color-primary);
			}
		}
		.personal-edit-safe-box {
			border-bottom: 1px solid var(--el-border-color-light, #ebeef5);
			padding: 15px 0;
			.personal-edit-safe-item {
				width: 100%;
				display: flex;
				align-items: center;
				justify-content: space-between;
				.personal-edit-safe-item-left {
					flex: 1;
					overflow: hidden;
					.personal-edit-safe-item-left-label {
						color: var(--el-text-color-regular);
						margin-bottom: 5px;
					}
					.personal-edit-safe-item-left-value {
						// color: var(--el-text-color-secondary);
						@include text-ellipsis(1);
						margin-right: 15px;
					}
				}
			}
			&:last-of-type {
				padding-bottom: 0;
				border-bottom: none;
			}
		}
	}
}
</style>
