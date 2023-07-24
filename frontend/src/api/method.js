import request from "@/utils/request";

export function listMethod(query) {
  return request({
    url: "/bookkeeping/listMethod",
    method: "get",
    params: query,
  });
}

export function findMethod(data) {
  return request({
    url: "/bookkeeping/findMethod",
    method: "post",
    data: data,
  });
}

export function updateMethod(data) {
  return request({
    url: "/bookkeeping/updateMethod",
    method: "post",
    data: data,
  });
}

export function addMethod(data) {
  return request({
    url: "/bookkeeping/addMethod",
    method: "post",
    data: data,
  });
}

export function deleteMethod(data) {
  return request({
    url: "/bookkeeping/deleteMethod",
    method: "post",
    data: data,
  });
}
