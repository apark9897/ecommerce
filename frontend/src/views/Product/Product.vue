<template>
  <div class="container pt-5">
    <div class="row">
      <div class="col-12 text-center" v-if="products">
        <h3 class="py-2">Our Products</h3>
        <router-link id="add-product" :to="{name: 'AddProduct'}">
          <button class="btn btn-dark rounded">Add a new Product</button>
        </router-link>
      </div>
    </div>
    <div class="row">
      <div v-for="product of products" :key="product.id" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
        <ProductBox :product="product"></ProductBox>
      </div>
    </div>
  </div>
</template>

<script>
import ProductBox from '@/components/Product/ProductBox.vue';

export default {
    data() {
        return {
            products: null,
        };
    },
    props: ["baseURL"],
    methods: {
        async getProducts() {
            await axios.get(`${this.baseURL}/product/`)
                .then(res => this.products = res.data)
                .catch(err => console.log(err));
        }
    },
    mounted() {
        this.getProducts();
    },
    components: { ProductBox }
}
</script>

<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}

#add-product {
  float: right;
}
</style>
