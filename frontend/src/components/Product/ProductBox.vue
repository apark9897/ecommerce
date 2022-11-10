<template>
  <div class="card w-100 h-100">
    <div class="embed-responsive embed-responsive-16by9">
      <img class="card-img-top embed-responsive-item" :src="product.imageURL" alt="Product Image">
    </div>

    <div class="card-body">
      <h5 class="card-title">{{product.name}}</h5>
      <p class="card-text font-italic">{{product.description.substring(0,65)}}...</p>
      <router-link :to="{name: 'EditProduct', params: {id: product.id}}">
        <button class="btn">Edit</button>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "ProductBox",
  props: ["product"],
  methods: {

  }
}
</script>

<style scoped>
.embed-responsive .card-img-top {
  object-fit: cover;
}

.card-title {
  color: #484848;
  font-size: 1.1rem;
  font-weight: 400;
}

.card-title:hover {
  font-weight: bold;
}

.card-text {
  font-size: 0.9rem;
}

</style>