<template>
  <div class="container">
    <div class="row pt-5">
      <div class="col-md-1"></div>
      <!-- display image -->
      <div class="col-md-4 col-12">
        <img :src="product.imageURL" class="img-fluid" />
      </div>
      <!-- display product details -->
      <div class="col-md-6 col-12 pt-3 pt-md-0">
        <h4>{{ product.name }}</h4>
        <h6 class="category font-italic"> {{ category.categoryName }} </h6>
        <h6 class="font-weight-bold"> $ {{ product.price }} </h6>
        <p>
          {{ product.description }}
        </p>
        <!-- quantity -->
        <div class="d-flex flex-row justify-content-center">
          <div class="input-group col-md-3 col-4 p-0">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Quantity</span>
            </div>
            <input class="form-control" type="number" v-model="quantity"/>
          </div>
        </div>
        <!-- features -->
        <div class="features pt-3">
          <h5><strong>Features</strong></h5>
          <ul>
            <li>Lorem ipsum dolor sit amet consectetur adipisicing elit.</li>
            <li>Officia quas, officiis eius magni error magnam voluptatem</li>
            <li>nesciunt quod! Earum voluptatibus quaerat dolorem doloribus</li>
            <li>molestias ipsum ab, ipsa consectetur laboriosam soluta et</li>
            <li>ut doloremque dolore corrupti, architecto iusto beatae.</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
      return {
        product : {},
        category : {},
        id : null,
        quantity: 1
      }
  },
  props : ["products", "categories"],
  methods:{

  },
  mounted() {
    this.id = this.$route.params.id;
    this.product = this.products.find(product => product.id == this.id);
    this.category = this.categories.find(category => category.id == this.product.categoryId);
  }
}
</script>

<style>
.category {
  font-weight: 400;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type=number] {
  -moz-appearance: textfield;
}
</style>
