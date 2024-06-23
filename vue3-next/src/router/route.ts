import { RouteRecordRaw } from 'vue-router';

/**
 * 建议：路由 path 路径与文件夹名称相同，找文件可浏览器地址找，方便定位文件位置
 *
 * 路由meta对象参数说明
 * meta: {
 *      title:          菜单栏及 tagsView 栏、菜单搜索名称（国际化）
 *      isLink：        是否超链接菜单，开启外链条件，`1、isLink: 链接地址不为空 2、isIframe:false`
 *      isHide：        是否隐藏此路由
 *      isKeepAlive：   是否缓存组件状态
 *      isAffix：       是否固定在 tagsView 栏上
 *      isIframe：      是否内嵌窗口，开启条件，`1、isIframe:true 2、isLink：链接地址不为空`
 *      roles：         当前路由权限标识，取角色管理。控制路由显示、隐藏。超级管理员：admin 普通角色：common
 *      icon：          菜单、tagsView 图标，阿里：加 `iconfont xxx`，fontawesome：加 `fa xxx`
 * }
 */

// 扩展 RouteMeta 接口
declare module 'vue-router' {
	interface RouteMeta {
		title?: string;
		isLink?: string;
		isHide?: boolean;
		isKeepAlive?: boolean;
		isAffix?: boolean;
		isIframe?: boolean;
		roles?: string[];
		icon?: string;
	}
}

/**
 * 定义动态路由
 * 前端添加路由，请在顶级节点的 `children 数组` 里添加
 * @description 未开启 isRequestRoutes 为 true 时使用（前端控制路由），开启时第一个顶级 children 的路由将被替换成接口请求回来的路由数据
 * @description 各字段请查看 `/@/views/system/menu/component/addMenu.vue 下的 ruleForm`
 * @returns 返回路由菜单数据
 */
export const dynamicRoutes: Array<RouteRecordRaw> = [
	{
		path: '/',
		name: '/',
		component: () => import('/@/layout/index.vue'),
		redirect: '/dashboard',
		meta: {
			isKeepAlive: true,
		},
		children: [
			{
				path: '/dashboard',
				name: 'dashboard',
				component: () => import('/@/views/personal/index.vue'),
				meta: {
					title: '首页',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: true,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-shouye',
				},
			},
			{
				path: '/user',
				name: 'user',
				meta: {
					title: '权限管理',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: false,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-quanxian',
				},
				children: [
					{
						path: '/user/listing',
						name: 'listing',
						component: () => import('/@/views/user/student/index.vue'),
						meta: {
							title: '用户管理',
							isHide: false,
							isKeepAlive: false,
							isAffix: false,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-icon-',
						},

					},
					{
						path: '/user/role',
						name: 'role',
						component: () => import('/@/views/system/role/index.vue'),
						meta: {
							title: '角色管理',
							isHide: false,
							isKeepAlive: false,
							isAffix: false,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-gerenzhongxin',
						},

					},
					{
						path: '/user/menu',
						name: 'menu',
						component: () => import('/@/views/system/menu/index.vue'),
						meta: {
							title: '菜单管理',
							isHide: false,
							isKeepAlive: false,
							isAffix: false,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-caidan',
						},

					},


				]
			},

			{
				path: '/menutwo',
				name: 'menutwo',
				component: () => import('/@/views/menutwo/cb.vue'),
				meta: {
					title: '学生心理健康信息',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: true,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-zidingyibuju',
				},
				children: [
					{
						path: '/list',
						name: 'list',
						component: () => import('/@/views/infodetail/list.vue'),
						meta: {
							title: '学生健康信息列表',
							isHide: false,
							isKeepAlive: false,
							isAffix: false,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-gerenzhongxin',
						},

					},
					{
						path: '/stuinfodetail',
						name: 'stuinfodetail',
						component: () => import('/@/views/infodetail/index.vue'),
						meta: {
							title: '学生心理健康信息详情',
							isLink: '',
							isHide: false,
							isKeepAlive: true,
							isAffix: true,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-shenqingkaiban',
						},
					},
					{
						path: '/user/emotion',
						name: 'emotion',
						component: () => import('/@/views/infodetail/emotion.vue'),
						meta: {
							title: '学生情绪倾向',
							isHide: false,
							isKeepAlive: false,
							isAffix: false,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-shuju1',
						},

					},
				]
			},
			{
				path: '/instructor',
				name: 'instructor',
				meta: {
					title: '辅导员管理',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: false,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-icon-',
				},
				children: [
					{
						path: '/class',
						name: 'class',
						component: () => import('/@/views/baoxiao/sanji/index.vue'),
						meta: {
							title: '班级情绪状态',
							isLink: '',
							isHide: false,
							isKeepAlive: true,
							isAffix: true,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-shenqingkaiban',
						},
					},
					{
						path: '/teacher',
						name: 'teacher',
						component: () => import('/@/views/user/teacher/index.vue'),
						meta: {
							title: '辅导员列表',
							isLink: '',
							isHide: false,
							isKeepAlive: true,
							isAffix: true,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-icon-',
						},
					},

				]
			},

			{
				path: '/order',
				name: 'order',
				meta: {
					title: '预约管理',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: false,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-diannao1',
				},
				children: [
					{
						path: '/doctorlist',
						name: 'doctorlist',
						component: () => import('/@/views/doctor/index.vue'),
						meta: {
							title: '医生列表',
							isLink: '',
							isHide: false,
							isKeepAlive: true,
							isAffix: true,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-gerenzhongxin',
						},
					},
					{
						path: '/orderlist',
						name: 'orderlist',
						component: () => import('/@/views/doctor/order.vue'),
						meta: {
							title: '预约列表',
							isLink: '',
							isHide: false,
							isKeepAlive: true,
							isAffix: true,
							isIframe: false,
							roles: ['admin', 'common'],
							icon: 'iconfont icon-shenqingkaiban',
						},
					},

				]
			},
			{
				path: '/stuinfo',
				name: 'stuinfo',
				component: () => import('/@/views/blockchain/index.vue'),
				meta: {
					title: '区块链管理',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: true,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-caozuo-wailian',
				},
			},
			{
				path: '/node',
				name: 'node',
				component: () => import('/@/views/blockchain/node.vue'),
				meta: {
					title: '节点管理',
					isLink: '',
					isHide: false,
					isKeepAlive: true,
					isAffix: true,
					isIframe: false,
					roles: ['admin', 'common'],
					icon: 'iconfont icon-webicon318',
				},
			},


		],
	},
];


export const notFoundAndNoPower = [
	{
		path: '/:path(.*)*',
		name: 'notFound',
		component: () => import('/@/views/error/404.vue'),
		meta: {
			title: 'message.staticRoutes.notFound',
			isHide: true,
		},
	},
	{
		path: '/401',
		name: 'noPower',
		component: () => import('/@/views/error/401.vue'),
		meta: {
			title: 'message.staticRoutes.noPower',
			isHide: true,
		},
	},
];

/**
 * 定义静态路由（默认路由）
 * 此路由不要动，前端添加路由的话，请在 `dynamicRoutes 数组` 中添加
 * @description 前端控制直接改 dynamicRoutes 中的路由，后端控制不需要修改，请求接口路由数据时，会覆盖 dynamicRoutes 第一个顶级 children 的内容（全屏，不包含 layout 中的路由出口）
 * @returns 返回路由菜单数据
 */
export const staticRoutes: Array<RouteRecordRaw> = [
	{
		path: '/login',
		name: 'login',
		component: () => import('/@/views/login/index.vue'),
		meta: {
			title: '登录',
		},
	},
	/**
	 * 提示：写在这里的为全屏界面，不建议写在这里
	 * 请写在 `dynamicRoutes` 路由数组中
	 */
	{
		path: '/visualizingDemo1',
		name: 'visualizingDemo1',
		component: () => import('/@/views/visualizing/demo1.vue'),
		meta: {
			title: 'message.router.visualizingLinkDemo1',
		},
	},
	{
		path: '/visualizingDemo2',
		name: 'visualizingDemo2',
		component: () => import('/@/views/visualizing/demo2.vue'),
		meta: {
			title: 'message.router.visualizingLinkDemo2',
		},
	},
];
