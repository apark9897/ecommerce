<template>
  <div id="home">
    <div id="background-div">
      <img id="background-img" src="../assets/home.png" />
    </div>
    <!-- display categories -->
    <div id="start-shopping" class="container pt-5">
      <div class="row">
        <h2 class="col-12 py-2">Top Categories</h2>
      </div>
      <div class="row" v-if="categorySize">
        <div v-for="i in categorySize" :key="i" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
          <CategoryBox :category="categories[i - 1]"></CategoryBox>
        </div>
      </div>
    </div>
    <!-- display products -->
    <div class="container pt-5">
      <div class="row">
        <h2 class="col-12 py-2">Top Products</h2>
      </div>
      <div class="row" v-if="productSize">
        <div v-for="i in productSize" :key="i" class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex">
          <ProductBox :product="products[i - 1]"></ProductBox>
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
<style scoped>
#background-div {
  position: absolute;
}

#background-img {
  mask-image: linear-gradient(to bottom, rgba(0,0,0,0.5), rgba(0,0,0,0));
  max-width: 100%;
}

h2 {
  width: max-content;
}

.header {
  text-align: center;
}

</style>
