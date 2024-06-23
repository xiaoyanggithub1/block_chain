import request from '/@/utils/request';

/**
 *  用户模块
 */
export function doctorApi() {
    return {
        doctor: (data: object) => { // 获取医生列表
            return request({
                url: '/ylh/doctor/getAllDoctor',
                method: 'post',
                data,
            });
        },
        studentAddDoctor: (data: object) => { // 预约医生
            return request({
                url: '/ylh/doctor/studentAddDoctor',
                method: 'post',
                data,
            });
        },

        updateOrder: (data: object) => { // 更换预约时间
            return request({
                url: '/ylh/doctor/updateOrder',
                method: 'post',
                data,
            });
        },
        studentDeleteDoctor: (data: object) => { // 取消预约
            return request({
                url: '/ylh/doctor/studentDeleteDoctor',
                method: 'post',
                data,
            });
        },

        getDoctort: (data: object) => { // 根据id查找医生
            return request({
                url: '/ylh/doctor/getDoctort',
                method: 'post',
                data,
            });
        },
        addDoctor: (data: object) => { // 添加医生
            return request({
                url: '/ylh/doctor/addDoctor',
                method: 'post',
                data,
            });
        },

        getAllOrder:(data:object)=>{ //获取所有预约信息
            return request({
                url:'/ylh/doctor/getAllOrder',
                method: 'post',
                data,
            })
        },

        updateDoctor:(data:object)=>{ //更新医生信息
            return request({
                url:'/ylh/doctor/updateDoctor',
                method: 'post',
                data,
            })
        },
        
        deleteDoctor:(data:object)=>{ //更新医生信息
            return request({
                url:'/ylh/doctor/deleteDoctor',
                method: 'post',
                data,
            })
        },
    };
}
