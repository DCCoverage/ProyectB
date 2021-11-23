import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import router from '../router'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    new Vue({
      router
    }).$mount('#app');
})
