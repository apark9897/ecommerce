import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import swal from 'sweetalert';
import axios from 'axios';

window.axios = axios;
window.Swal = swal;

createApp(App).use(router).mount('#app')