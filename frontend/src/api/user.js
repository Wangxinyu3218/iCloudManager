import request from "@/utils/request";

export function listUser(query) {
  return request({
    url: "/bookkeeping/selectUser",
    method: "get",
    params: query,
  });
}

export function findUser(data) {
  return request({
    url: "/bookkeeping/findUser",
    method: "post",
    data: data,
  });
}

export function updateUser(data) {
  return request({
    url: "/bookkeeping/updateUser",
    method: "post",
    data: data,
  });
}

export function addUser(data) {
  return request({
    url: "/bookkeeping/addUser",
    method: "post",
    data: data,
  });
}

export function deleteUser(data) {
  return request({
    url: "/bookkeeping/deleteUser",
    method: "post",
    data: data,
  });
}
