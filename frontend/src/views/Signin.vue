<template>
  <div class="container">
    <div class="row">
      <div class="col-12 justify-content-center d-flex flex-row pt-5">
        <div id="signin" class="flex-item border">
          <h2 class="pt-4">Sign In</h2>
          <form @submit="signin" class="form-group pt-4 pr-4 pl-4">
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" v-model="email" required />
            </div>
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control" v-model="password" required />
            </div>
            <button class="btn btn-primary mt-2 py-0">Log In</button>
          </form>
        </div>
      </div>
    </div>
  </div>

</template>
<script>
import axios from 'axios';
import swal from 'sweetalert';
export default {
  props: ["baseURL"],
  data() {
    return {
      email: null,
      password: null
    }
  },
  methods: {
    async signin(e) {
      e.preventDefault();
      const body = {
        email: this.email,
        password: this.password
      };
      axios.post(`${this.baseURL}/user/signin`, body)
      .then(() => {
        this.$router.push('Home');
        swal({
          text: "User signin successful!",
          icon: "success",
          closeOnClickOutside: false,
        });
      })
      .catch((err) => console.log(err));
    }
  }
}
</script>

<style>
.btn-primary {
  background-color: #f0c14b;
  color: black;
}

@media screen and (min-width: 992px) {
  #signin {
    width: 40%;
  }
}
</style>