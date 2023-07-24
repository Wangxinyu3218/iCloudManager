import request from "@/utils/request";

export function login(data) {
  return request({
    url: "/bookkeeping/login",
    method: "post",
    // params: query,
    data: data,
  });
}
