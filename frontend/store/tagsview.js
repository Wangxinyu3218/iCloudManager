// import {set } from "core-js/fn/dict"

export const state = () => ({
  visitedviews: [], //存放所有浏览过的且不重复的路由数据
  uuid: null,
  roleid: null,
  nickname: null,
  roleName: null,
  username: null,
});

export const mutations = {
  ADD_VISITED_VIEWS: (state, view) => {
    //打开新页签--添加路由数据的方法      if(state.visitedviews.some(v=>v.path==view.path))return;
    // console.log(3, state.visitedviews, view)
    state.visitedviews.push({
      name: view.name,
      path: view.path,
      title: view.name || "no-title",
    });

    function unique(arr) {
      const res = new Map();
      return arr.filter((arr) => !res.has(arr.name) && res.set(arr.name, 1));
    }
    state.visitedviews = unique(state.visitedviews);
  },
  DEL_VISITED_VIEWS: (state, view) => {
    //关闭页签--删除路由数据的方法
    for (let [i, v] of state.visitedviews.entries()) {
      // console.log(v, view, 'view')
      if (v.path == view.path) {
        state.visitedviews.splice(i, 1);
        break;
      }
    }
  },
  changeCommit(state, value) {
    // console.log("mutations", state, value);
    // 修改 state 中存储的数据
    state.name = value; // 这里直接修改 state 的属性可能会导致问题，因为 state 是一个函数。您应该调用 state() 来获取它的返回值。
    // 修改后，页面会重新渲染
  },
};

export const actions = {
  addVisitedViews({ commit }, view) {
    //通过解构赋值得到commit方法
    commit("ADD_VISITED_VIEWS", view); //去触发ADD_VISITED_VIEWS，并传入参数
  },
  delVisitedViews({ commit, state }, view) {
    //删除数组存放的路由之后，需要再去刷新路由，这是一个异步的过程，需要有回掉函数，所以使用并返回promise对象，也可以让组件在调用的时候接着使用.then的方法
    //commit('DEL_VISITED_VIEWS',view)
    return new Promise((resolve) => {
      //resolve方法：未来成功后回掉的方法
      commit("DEL_VISITED_VIEWS", view);
      resolve([...state.visitedviews]);
    });
  },
  changeDispatch(context, value) {
    // console.log("actions", context, value);
    // 将数据 commit 给 mutations
    // 设置 2 个实参: commit 中的方法名 & 发送的数据
    context.commit("changeCommit", value);
  },
};

export const getters = {
  visitedviews: (state) => state.tagsview.visitedviews,
};
