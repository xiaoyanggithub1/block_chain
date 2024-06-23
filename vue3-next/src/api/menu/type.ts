// 数据类型定义
export interface ResponseData {
    code: number,
    errno: boolean,
    msg: string
}
// 菜单数据与按钮数据的ts类型
export interface permisstion {
    "menu_id"?: number,
    "path": string,
    "component": string,
    "label": null,
    "icon": string,
    "redirect": string,
    "name": string,
    "parent_id": number,
    "hidden": boolean,
    "order_num": boolean,
    // "remark": string,
    "children": PermisstionList,
    "status": boolean,
}

export type PermisstionList = permisstion[];
// 菜单接口返回的数据类型
export interface PermisstionResponseData extends ResponseData {
    data: PermisstionList
}
// 添加与修改菜单携带的参数的ts类型
export interface MenuParams {
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