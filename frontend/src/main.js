import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import swal from 'sweetalert';
import axios from 'axios';

createApp(App).use(router).mount('#app')
window.axios = axios;
window.Swal = swal