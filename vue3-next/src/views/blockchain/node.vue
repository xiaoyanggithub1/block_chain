<template>
	<div class="layout-pd">
		<el-card shadow="hover" header="区块链节点">
			<el-row :gutter="20">
				<el-col :sm="6" class="mb15" v-for="(v, k) in state.topCardItemList" :key="k">
					<div class="countup-card-item countup-card-item-box" :style="{ background: `var(${v.color})` }">
						<div class="countup-card-item-flex" ref="topCardItemRefs">
							<div class="countup-card-item-title pb3">{{ v.title }}</div>
							<div class="countup-card-item-title-num pb6">{{ v.url }}</div>
							<div class="countup-card-item-tip pb3">{{ v.tip }}</div>
							<div class="countup-card-item-tip-num"></div>
						</div>
						<i :class="v.icon" :style="{ color: v.iconColor }"></i>
					</div>
				</el-col>
			</el-row>
			<div class="flex-warp">
				<div class="flex-warp-item">
					<div class="flex-warp-item-box">
						<el-input v-model="input1" style="max-width: 600px" placeholder="请输入节点ip">
							<template #prepend>Http://</template>
						</el-input>
						<el-button type="primary" size="default" @click="refreshCurrent">
							<el-icon>
								<ele-Share />
							</el-icon>
							节点添加
						</el-button>
					</div>
				</div>
			</div>
		</el-card>
	</div>
</template>

<script setup lang="ts" name="funCountup">
import { reactive, onMounted, nextTick, ref } from 'vue';
import { CountUp } from 'countup.js';
import { chainApi } from '/@/api/blockchain/index';
import { ElMessage } from 'element-plus';

const chainInterface = chainApi();
// 定义变量内容
const input1 = ref('');
const topCardItemRefs = ref<RefType[]>([]);
const state = reactive({
	topCardItemList: [
		{
			title: '学校节点',
			titleNum: '123',
			tip: '使用中',
			tipNum: '911',
			color: '--el-color-school',
			iconColor: '#ffcb47',
			icon: 'iconfont icon-shouye',
			url: 'http://8.137.71.7:8000',
		},
		{
			title: '医院节点',
			titleNum: '123',
			tip: '使用中',
			tipNum: '611',
			color: '--el-color-hospital',
			iconColor: '#70cf41',
			icon: 'iconfont icon-shenqingkaiban',
			url: 'http://47.109.181.36:8000',
		},
		{
			title: '心理健康机构一节点',
			titleNum: '123',
			tip: '未使用',
			tipNum: '911',
			color: '--el-color-doctorone',
			iconColor: '#dfae64',
			icon: 'iconfont icon-gongju',
			url: 'http://192.168.0.121:8000',
		},
		{
			title: '心理健康机构二节点',
			titleNum: '123',
			tip: '未使用',
			tipNum: '911',
			color: '--el-color-doctortwo',
			iconColor: '#e56565',
			icon: 'iconfont icon-gongju',
			url: 'http://192.168.0.121:8000',
		},
	],
});
function refreshCurrent() {
	const url = {
		node_address: input1,
	};
	chainInterface.addNewPeer(url).then((res) => {
		if (res.code == 200) {
		input1.value = '';	
			ElMessage({
				message: '节点添加成功！',
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
</script>

<style scoped lang="scss">
.countup-card-item {
	width: 100%;
	height: 103px;
	background: var(--el-text-color-secondary);
	border-radius: 4px;
	transition: all ease 0.3s;
	&:hover {
		box-shadow: 0 2px 12px 0 rgb(0 0 0 / 10%);
		transition: all ease 0.3s;
	}
}
.countup-card-item-box {
	display: flex;
	align-items: center;
	position: relative;
	overflow: hidden;
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
	.countup-card-item-flex {
		padding: 0 20px;
		color: var(--el-color-white);
		.countup-card-item-title,
		.countup-card-item-tip {
			font-size: 13px;
		}
		.countup-card-item-title-num {
			font-size: 18px;
		}
		.countup-card-item-tip-num {
			font-size: 13px;
		}
	}
}
.flex-warp-item-box {
	display: flex;
}
.el-button {
	height: 38px;
}
</style>
