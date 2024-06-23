// 数据类型定义
export interface ResponseData {
    code: number,
    errno: boolean,
    msg: string
}
// 菜单数据与按钮数据的ts类型
export interface permisstion {
    // "menu_id"?: number,
    // "path": string,
    // "component": string,
    // "label": null,
    // "icon": string,
    // "redirect": string,
    // "name": string,
    // "parent_id": number,
    // "hidden": boolean,
    // "order_num": boolean,
    // // "remark": string,
    // "children": PermisstionList,
    // "status": boolean,
    "total_count": 9,
    "total_pages": 1,
    "current_page": 1,
    "per_page": 10,
    // "mental": [
    //     {
    "id": 1,
    "name": string,
    "sex": 1,
    "age": string,
    "class_name": string,
    "phone": string,
    "emotion": string,
    "mind_score": 90,
    "mind_issue": string,
    "mind_advice": string,
    "tutor_log": string,
    "grade_time": string
    // }]
}

export type PermisstionList = permisstion[];
// 菜单接口返回的数据类型
export interface PermisstionResponseData extends ResponseData {
    data: PermisstionList
}
// 添加与修改菜单携带的参数的ts类型
export interface nodeParams {
    // id?:number,
    // menu_id?: number,?

    menu_id: number,
    "path": string,
    "component": string,
    "redirect": string,
    "name": string,
    "title": string,
    "icon": string,
    "parent_id": number,
    "status": boolean,
    "perm": number,
    "hidden": boolean,
    "menu_type": string,
    "order_num": boolean,
    "remark": string,
    // "status": number,
}