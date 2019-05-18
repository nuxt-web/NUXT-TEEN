import Vue from 'vue'
import axios from 'axios'



export default () => {
  // axios.defaults.withCredentials=true
  Vue.prototype.$ajax = axios
}
