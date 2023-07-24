import request from "@/utils/request";

export function select(query) {
  return request({
    url: "/bookkeeping/select",
    method: "get",
    params: query,
  });
}

export function selectId(query) {
  return request({
    url: "/bookkeeping/selectId",
    method: "get",
    params: query,
  });
}

export function updateExpenditure(data) {
  return request({
    url: "/bookkeeping/updateExpenditure",
    method: "post",
    data: data,
  });
}

export function addExpenditure(data) {
  return request({
    url: "/bookkeeping/addExpenditure",
    method: "post",
    data: data,
  });
}

export function deleteId(data) {
  return request({
    url: "/bookkeeping/deleteId",
    method: "post",
    data: data,
  });
}
