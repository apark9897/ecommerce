<template>
  <div>
    <Navbar :cartCount="cartCount" @resetCartCount="resetCartCount" />
    <div style="min-height: 60vh">
      <router-view v-if="products && categories"
         :baseURL="baseURL"
         :products="products"
         :categories="categories"
         @fetchData = "fetchData">
      </router-view>
    </div>
    <Footer />
  </div>
</template>

<script>
import axios from 'axios';
import Navbar from "./components/Navbar.vue"
import Footer from "./components/Footer.vue"
export default {
  data() {
    return {
      baseURL : process.env.VUE_APP_API_URL,
      products : null,
      categories : null,
      token: null,
      cartCount: null
    }
  },
  emits: ['fetchData'],
  components : { Navbar, Footer},
  methods : {
    async fetchData() {
      // fetch products
      await axios.get(`${this.baseURL}/product/`)
              .then(res => this.products = res.data)
              .catch(err => console.log(err))

      //fetch categories
      await axios.get(`${this.baseURL}/category/`)
              .then((res) => {
                this.categories = res.data;
              })
              .catch(err => console.log(err))
      //fetch cart items if logged in
      if (this.token) {
        await axios.get(`${this.baseURL}/cart/?token=${this.token}`)
          .then((res) => {
            this.cartCount = res.data.cartItems.length;
          })
          .catch(err => console.log(err))
      }
    },
    resetCartCount() {
      this.cartCount = 0;
    }
  },
  mounted() {
    this.token = localStorage.getItem("token");
    this.fetchData();
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
