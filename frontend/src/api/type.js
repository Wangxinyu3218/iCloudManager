import request from "@/utils/request";

export function listType(query) {
  return request({
    url: "/bookkeeping/listType",
    method: "get",
    params: query,
  });
}

export function findType(data) {
  return request({
    url: "/bookkeeping/findType",
    method: "post",
    data: data,
  });
}

export function updateType(data) {
  return request({
    url: "/bookkeeping/updateType",
    method: "post",
    data: data,
  });
}

export function addType(data) {
  return request({
    url: "/bookkeeping/addType",
    method: "post",
    data: data,
  });
}

export function deleteType(data) {
  return request({
    url: "/bookkeeping/deleteType",
    method: "post",
    data: data,
  });
}
