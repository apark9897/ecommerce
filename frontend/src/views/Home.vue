<template>
  <div id="home">
    <div id="background-div" class="page-holder bg-cover">
      <div class="container">
        <header class="text-left text-white py-5">
          <h3 class="mb-4" id="heading">
            <a href="#start-shopping" class="bg-white px-2 py-2 rounded"> Start shopping</a>
          </h3>
          <p class="lead mb-0 bg-dark p-1 rounded"> Demo text</p>
        </header>
      </div>
    </div>
    <!-- display categories -->
    <div id="start-shopping" class="container py-2">
      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Top Categories</h2>
        </div>
      </div>
      <div class="row" v-if="categorySize">
        <div v-for="i in categorySize" :key="i" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
          <CategoryBox :category="categories[i-1]"></CategoryBox>
        </div>
      </div>
    </div>
    <!-- display products -->
    <div class="container py-2">
      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Top Products</h2>
        </div>
      </div>
      <div class="row" v-if="productSize">
        <div v-for="i in productSize" :key="i" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
          <ProductBox :product="products[i-1]"></ProductBox>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import CategoryBox from '../components/Category/CategoryBox.vue';
import ProductBox from '../components/Product/ProductBox.vue';
export default {
  name: 'Home',
  components: { CategoryBox, ProductBox },
  props: ["categories", "products"],
  data() {
    return {
      categorySize: 0,
      productSize: 0
    }
  },
  mounted() {
    this.categorySize = this.categories.length;
    this.categorySize = Math.min(6, this.categorySize);

    this.productSize = this.products.length;
    this.productSize = Math.min(8, this.productSize);
  },
}
</script>
<style>
.page-holder {
  min-height: 100vh;
}
#background-div {
  background: url("../assets/home.png");
}
.bg-cover {
  background-size: cover !important;
}
#heading {
  font-weight: 400;
}
</style>
