import request from "@/utils/request";

export function dashboard(query) {
  return request({
    url: "/bookkeeping/dashboard",
    method: "get",
    params: query,
  });
}

export function getDashboard(query) {
  return request({
    url: "/bookkeeping/getDashboard",
    method: "get",
    params: query,
  });
}

export function lastDashboard(query) {
  return request({
    url: "/bookkeeping/lastDashboard",
    method: "get",
    params: query,
  });
}

export function selectDashboard(query) {
  return request({
    url: "/bookkeeping/selectDashboard",
    method: "get",
    params: query,
  });
}

export function selectSchedule(query) {
  return request({
    url: "/bookkeeping/selectSchedule",
    method: "get",
    params: query,
  });
}

export function updateDashboard(data) {
  return request({
    url: "/bookkeeping/updateDashboard",
    method: "post",
    data: data,
  });
}

export function scheduleId(query) {
  return request({
    url: "/bookkeeping/scheduleId",
    method: "get",
    params: query,
  });
}

export function deleteScid(data) {
  return request({
    url: "/bookkeeping/deleteScid",
    method: "post",
    data: data,
  });
}

export function updateSchedule(data) {
  return request({
    url: "/bookkeeping/updateSchedule",
    method: "post",
    data: data,
  });
}

export function addSchedule(data) {
  return request({
    url: "/bookkeeping/addSchedule",
    method: "post",
    data: data,
  });
}