<template>
  <div class="row d-flex justify-content-center pt-3">
    <router-link :to="{name: 'Category'}">
      <button class="btn btn-primary btn-large">View Categories</button>
    </router-link>
  </div>
  <div class="row d-flex justify-content-center pt-3">
    <router-link :to="{name: 'Product'}">
      <button class="btn btn-primary btn-large">View Products</button>
    </router-link>
  </div>
</template>

<script>
export default {
  data() {

  },
  methods: {

  }
}
</script>

<style scoped>
</style>