<template>
	<div>
		<el-row style="padding: 20px;" :gutter="20" justify="center">
			<el-col :span="8">
				<el-card>
					<template #header>
					  <div class="card-header">
						<span>作品数</span>
					  </div>
					</template>
					33
				</el-card>
			</el-col>
			<el-col :span="8">
				<el-card>
					<template #header>
					  <div class="card-header">
						<span>教师数</span>
					  </div>
					</template>
					33
				</el-card>
			</el-col>
			<el-col :span="8">
				<el-card>
					<template #header>
					  <div class="card-header">
						<span>学生数</span>
					  </div>
					</template>
					666
				</el-card>
			</el-col>
		</el-row>
		<el-row style="padding: 20px;" justify="space-between">
			<el-col :span="11">
				<el-card>
					<template #header>
					  <div class="card-header">
						<span>大赛类别</span>
					  </div>
					</template>
					<div style="height: 500px;width: 100%;background: #000;" ref="typeRef"></div>
				</el-card>
			</el-col>
			<el-col :span="11">
				<el-card>
					<template #header>
					  <div class="card-header">
						<span>历年参赛人数</span>
					  </div>
					</template>
					<div style="height: 500px;width: 100%;background: #000;" ref="yearRef"></div>
				</el-card>
			</el-col>
		</el-row>
	</div>
</template>

<script setup lang="ts">
	import { ref, reactive, onMounted  } from 'vue'
	import * as echarts from 'echarts';
	onMounted(async () =>{
		setTimeout(() => {initEcharts()}, 1000)
	})
	const typeRef = ref();
	const yearRef = ref();
	function initEcharts(){
		  let echarts1 = echarts.init(typeRef.value);
		  let echarts2 = echarts.init(yearRef.value);
		  const option = {
			  legend: {
				// 图例
				data: ["类别1", "类别2", "类别3" ],
				right: "",
				top: "",
				orient: "vertical",
				textStyle: { color: "#fff" },
			},
			title: {
				// 设置饼图标题，位置设为顶部居中
				text: "参加大赛类别作品数",
				top: "0%",
				left: "center",
				textStyle: { color: "#fff" },
			},
			series: [
				{
					type: "pie",
					label: {
						show: true,
						formatter: "{b} : {c} ({d}%)" // b代表名称，c代表对应值，d代表百分比
					},
					radius: ["30%", "40%"], //圆环内半径40%，外半径70%
					data: [
						{
							value: 463,
							name: "类别1"
						},
						{
							value: 395,
							name: "类别2"
						},
						{
							value: 157,
							name: "类别3"
						},
					]
				}
			]
		};
		const option2 = {
			title: {
			  text: '历年参赛人数',
			  x: 'center',
			  textStyle: { color: "#fff" },
			},
			grid: {
				top: '20%',  
				left: '3%', 
				right: '10%',
				bottom: '5%',
				containLabel: true
			},
			axisLine: {
				lineStyle: {
					color: '#fff', // 设置坐标轴颜色
				}
			},
			xAxis: {
			  name: '年份',
			  type: 'category',
			  data: ['2020年','2021年','2022月','2023月'],
			  axisLabel: {
				  textStyle: { // 设置标签文字样式
					color: '#fff' ,// 标签文字颜色
				  },
			  },
			  axisLine: {
				//x轴线的颜色以及宽度
				show: true,
				lineStyle: {
				  color: "#fff",
				  width: 0,
				  type: "solid",
				},
			  },
			},
			yAxis: {
			  name: '人数',
			  type: 'value',
			  min:0, // 配置 Y 轴刻度最小值
			  max:2000,  // 配置 Y 轴刻度最大值
			  splitNumber:7,  // 配置 Y 轴数值间隔
			  axisLabel: {
				  textStyle: { // 设置标签文字样式
					  color: '#fff' // 标签文字颜色
				  }
			  },
			  axisLine: {
				//x轴线的颜色以及宽度
				show: true,
				lineStyle: {
				  color: "#fff",
				  width: 0,
				  type: "solid",
				},
			  },
			},
	
			series: [ // 多组折线图数据
			  {
				name: '猜想',
				data: [454,226,891,978,901,581,400,543,272,955,1294,1581],
				type: 'line',
				textStyle: { color: "#fff" },
			  }
			],
			color: ['#3366CC', '#FFCC99','#99CC33']
		}
		echarts1.setOption(option)
		echarts2.setOption(option2)
		window.addEventListener("resize", () => {
			echarts1.resize();
			echarts2.resize();
		});
	}
	
</script>

<style>
	a{
		text-decoration: none;    /* 去除链接的下划线 */
		color:black;
	}
	table{
		width: 100%;
		height: 50px;
		text-align: center;    /* 文字在单元格中居中 */
		border: 0.1px solid #F4F6F9;
	}
	h1{
		text-align: center;
	}
	.label-name{
		width: 100px;
		background: #F5F7FA;
	}
	.require-xing{
		color: red;
	}
	td{
		padding: 10px;
	}
	.el-descriptions__cell{
	}
</style>