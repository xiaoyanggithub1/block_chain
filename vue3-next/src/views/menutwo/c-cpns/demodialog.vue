<template>
	<div v-if="visible" class="dialog-overlay">
		<div class="dialog-container">
			<div class="dialog-content">
				<slot></slot>
			</div>
			<button @click="handleClose">关闭</button>
		</div>
	</div>
</template>  
  
<script>
export default {
	name: 'Dialog',
	props: {
		visible: {
			type: Boolean,
			default: false,
		},
	},
	methods: {
		handleClose() {
			this.$emit('update:visible', false);
		},
	},
};
</script>  
  
<style scoped>
.dialog-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 999;
}

.dialog-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 4px;
	position: relative;
}

.dialog-content {
}
</style>