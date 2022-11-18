<template>
  <div style="display: flex; align-items: center; justify-content: center">
    <div class="div_class">
      <h3>You will be redirected to payment page</h3>

      <div class="alert alert-primary" role="alert">
        While making payment use card number 4242 4242 4242 4242 and enter random cvv(3 digit)
      </div>

      <button class="btn checkout_button" id="proceed-to-checkout" @click="goToCheckout()">
        Make payment
      </button>
    </div>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  data() {
    return {
      stripeAPIToken: `${process.env.STRIPE_PUBLIC_KEY}`,
      stripe: '',
      token: null,
      sessionId: null,
      checkoutBodyArray: [],
    }
  },
  name: 'Checkout',
  props: ["baseURL"],
  methods: {
    getAllItems() {
      axios.get(`${this.baseURL}/cart/?token=${this.token}`)
        .then((res) => {
          if (res.status = 200) {
            let products = res.data;
            for (let i = 0; i < products.cartItems.length; i++) {
              this.checkoutBodyArray.push({
                price: products.cartItems[i].product.price,
                quantity: products.cartItems[i].quantity,
                productName: products.cartItems[i].product.name,
                productId: products.cartItems[i].product.id
              })
            }
          }
        })
    },
    goToCheckout() { 
      axios.post(`${this.baseURL}/order/create-checkout-session`, this.checkoutBodyArray)
      .then((res) => {
        localStorage.setItem("sessionId", res.data.sessionId);
        window.location = res.data.redirectUrl;
      })
    },
    /* Includes Stripe.js dynamically */
    includeStripe(URL, callback) {
      let documentTag = document, tag = 'script',
        object = documentTag.createElement(tag),
        scriptTag = documentTag.getElementsByTagName(tag)[0];
      object.src = '//' + URL;
      if (callback) { object.addEventListener('load', function (e) { callback(null, e); }, false); }
      scriptTag.parentNode.insertBefore(object, scriptTag);
    },

    /* Configures Stripe by setting up the elements and creating the card element. */
    configureStripe() {
      /* global Stripe */
      this.stripe = Stripe(this.stripeAPIToken);
    },
  },
  mounted() {
    // get the token
    this.token = localStorage.getItem("token");
    this.includeStripe('js.stripe.com/v3/', function () {
      this.configureStripe();
    }.bind(this));
    this.getAllItems();
  },
}

</script>

<style >
.div_class {
  margin-top: 5%;
  width: 50%;
  align-content: center;
}

.checkout_button {
  background-color: #5d3dec;
  border: none;
  color: white;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  font-size: 15px;
  font-weight: bold;
  border-radius: 15px;
}

.checkout_button:focus {
  outline: none;
  box-shadow: none;
}

.checkout_button:disabled {
  background-color: #9b86f7;
  border: none;
  color: white;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  font-weight: bold;
  border-radius: 15px;
  cursor: not-allowed;
}
</style>
