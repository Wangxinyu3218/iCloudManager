import request from "@/utils/request";

export function selectCalendar(data) {
  return request({
    url: "/bookkeeping/selectCalendar",
    method: "post",
    data: data,
  });
}
export function findCalendar(data) {
  return request({
    url: "/bookkeeping/findCalendar",
    method: "post",
    data: data,
  });
}
export function updateCalendar(data) {
  return request({
    url: "/bookkeeping/updateCalendar",
    method: "post",
    data: data,
  });
}
export function addCalendar(data) {
  return request({
    url: "/bookkeeping/addCalendar",
    method: "post",
    data: data,
  });
}
export function deleteCanlendar(data) {
  return request({
    url: "/bookkeeping/deleteCanlendar",
    method: "post",
    data: data,
  });
}
