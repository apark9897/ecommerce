<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3"> {{category.categoryName}} </h4>
      </div>
    </div>
    <div class="row">
      <div v-for="product of productList" :key="product.id" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
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
            id: null,
            category: {},
            productList: []
        };
    },
    props: ["categories", "products"],
    mounted() {
        this.id = this.$route.params.id;
        this.category = this.categories.find(category => category.id == this.id);
        this.productList = this.products.filter(product => product.categoryId == this.id);
    },
    components: { ProductBox }
}
</script>