<template>
	<div>
		<div class="search">
			<el-row style="margin-bottom: 20px">
				<el-col :span="6">
					<el-input v-model="searchText" placeholder="请输入电话号码" size="default" class="search-input" />
					<el-button type="primary" size="default" @click="searchHandle">查询</el-button>
				</el-col>
			</el-row>
		</div>
		<!-- <div> -->
		<div class="emotionBox">
			<!-- <div class="card-header">
				<span>学生情绪倾向分析</span>
			</div> -->

			<div style="height: 380px; width: 10%; background: linear-gradient(to bottom, #f5eded, #feb0ab); display: flex; flex-direction: column">
				<div class="status" style="padding-top: 56px; color: #f77013">积极</div>
				<div class="status" style="padding-top: 135px; color: #02a1e3">正常</div>
				<div class="status" style="padding-top: 132px; color: #fb0204">消极</div>
			</div>
			<div style="height: 380px; width: 90%; background: #fff; display: flex" ref="yearRef"></div>
			<!-- </div> -->
		</div>

		<vue3-seamless-scroll class="v-s-s" :list="tableData" :step="1" :hover="true">
			<div class="v-s-s_item" v-for="(item, index) in tableData" :key="index">
				<span>姓名:{{ item.name }}</span>
				<span>情绪倾向:{{ emochange(item.sentiment) }}</span>
				<span>创建时间:{{ item.update_time }}</span>
			</div>
		</vue3-seamless-scroll>
	</div>
</template>
<script lang="ts" setup>
import { ref, reactive, toRefs, onMounted } from 'vue';
import { Vue3SeamlessScroll } from 'vue3-seamless-scroll';

import * as echarts from 'echarts';
import { classApi } from '/@/api/class/index';

const classInterface = classApi();
const tableData = ref([]);
const chartData = reactive({
	data: [],
	time: [],
});
const searchText = ref('');

onMounted(async () => {
	setTimeout(() => {
		initEcharts();
	}, 100);
});
const typeRef = ref();
const yearRef = ref();
const state = reactive([]);
function initEcharts() {
	//   let echarts1 = echarts.init(typeRef.value);
	let echarts2 = echarts.init(yearRef.value);
	const option2 = {
		tooltip: {
			trigger: 'axis',
		},
		title: {
			text: '学生情绪倾向分析',
			// x: 'center',
			// left:center,
			top: '5%',
			left: 'center',
			textStyle: { color: '#abc888' },
		},
		grid: {
			top: '20%',
			left: '3%',
			right: '10%',
			bottom: '5%',
			containLabel: true,
		},
		axisLine: {
			lineStyle: {
				color: '#abc888', // 设置坐标轴颜色
			},
		},
		xAxis: {
			name: '日期',
			type: 'category',
			data: chartData.time,
			// data:['2024.1.1'],

			axisLabel: {
				interval: 0,
				textStyle: {
					// 设置标签文字样式
					color: '#659032', // 标签文字颜色
				},
			},
			axisTick: {
				show: true, // 是否显示刻度线
				alignWithLabel: true,
				interval: 0,
				length: 15, // 刻度线的长度
				lineStyle: {
					// 刻度线样式
					color: '#333', // 刻度线颜色
					type: 'solid', // 刻度线类型，可选值为 'solid' | 'dashed' | 'dotted'
				},
			},
			axisLine: {
				//x轴线的颜色以及宽度
				show: true,
				lineStyle: {
					color: '#659032',
					width: '1px',
					type: 'solid',
				},
			},
		},
		yAxis: {
			name: '情绪分数',
			type: 'value',
			min: 0, // 配置 Y 轴刻度最小值
			max: 1, // 配置 Y 轴刻度最大值
			splitNumber: 2, // 配置 Y 轴数值间隔

			data: ['负向', '正常', '正向'],
			nameTextStyle: {
				// 设置y轴名称的文本样式
				fontSize: '20px', // 设置字体大小
				color: '#659032', // 设置字体颜色（可选）
				// 其他文本样式属性...
			},
			axisLabel: {
				textStyle: {
					// 设置标签文字样式
					color: '#659032', // 标签文字颜色
					fontSize: '26px',
				},
			},
			axisLine: {
				//x轴线的颜色以及宽度
				show: true,
				lineStyle: {
					color: '#659032',
					width: 0,
					type: 'solid',
				},
			},
		},

		series: [
			// 多组折线图数据
			{
				name: '情绪分数',
				data: chartData.data,
				// data: [0, 0.5, 1],
				type: 'line',
				textStyle: { color: '#abc888' },
			},
		],
		color: ['#97777', '#FFCC99', '#99CC33'],
		// color: ['pink'],
		// backgroundcolor: 'pink',
		backgroundColor: {
			type: 'linear',
			x: 0,
			y: 0,
			x2: 0,
			y2: 1,
			colorStops: [
				{
					offset: 0,
					color: '#f5eded', // 顶部颜色
				},
				{
					offset: 1,
					color: '#feb0ab', // 底部颜色
				},
			],
			global: false, // 缺省为 false
		},
	};

	echarts2.setOption(option2);
	window.addEventListener('resize', () => {
		echarts2.resize();
	});
}

const phone = {
	phone: '15966666666',
};
// 渲染折线图
classInterface
	.emotion2(phone)
	.then((res) => {
		chartData.data = res.data.data;
		chartData.time = res.data.time;
		// console.log(Data1.value,Data2.value);
	})
	.catch((error) => {
		console.error(error);
	});
// 渲染日志
classInterface
	.emotion(phone)
	.then((res) => {
		tableData.value = res.data;
	})
	.catch((error) => {
		console.error(error);
	});

function searchHandle() {
	const dataphone = {
		phone: searchText.value,
	};
	// 渲染折线图
	classInterface
		.emotion2(dataphone)
		.then((res) => {
			chartData.data = res.data.data;
			chartData.time = res.data.time;
			initEcharts();
			// console.log(Data1.value,Data2.value);
		})
		.catch((error) => {
			console.error(error);
		});
	// 渲染日志
	classInterface
		.emotion(dataphone)
		.then((res) => {
			tableData.value = res.data;
		})
		.catch((error) => {
			console.error(error);
		});
	searchText.value = '';
}
function emochange(data) {
	if (data == 0) {
		return '消极';
	} else if (data == 1) {
		return '正常';
	} else {
		return '积极';
	}
}
</script>
<style lang="scss">
.emotionBox {
	height: 400px;
	width: 63%;
	display: flex;
	/* position: */
	margin-left: 2%;
	box-shadow: 10px 10px 5px grey;
	border: 10px solid #bbd8d8;
	border-radius: 20px;
	/* border-radius: ; */
}
.search {
	.search-input {
		width: 70%;
	}
	margin-left: 2%;
	margin-top: 2%;
}
.status {
	height: 40px;
	width: 50px;
	font-size: 20px;
	font-weight: bold;
	text-align: right;
	font-family: 黑体;
}
.v-s-s {
	height: 410px;
	width: 390px;
	margin: 10px auto;
	overflow: hidden;
	font-size: 13px;
	position: relative;
	right: -410px;
	top: -420px;
	background-color: #fcfaff;
	box-shadow: 10px 10px 5px grey;
	border: 10px solid #98edec;
	border-radius: 20px;
	overflow: hidden; /* 隐藏溢出内容 */
	// background-color: black;

	.v-s-s_item {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 3px 0;
	}
}
</style>