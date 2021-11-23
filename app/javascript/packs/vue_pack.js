import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue";
import router from "../router";

const app = Vue.createApp({});
app.use(TurbolinksAdapter);
app.use(router);
app.mount("#app");
