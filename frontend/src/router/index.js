/* eslint-disable */
import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import AddCategory from '../views/Category/AddCategory.vue'
import Category from '../views/Category/Category.vue'
import EditCategory from "../views/Category/EditCategory.vue";
import Product from '../views/Product/Product.vue'
import EditProduct from "../views/Product/EditProduct.vue"
import AddProduct from "../views/Product/AddProduct.vue"
import Admin from '../views/Admin.vue'
import ShowDetails from '../views/Product/ShowDetails.vue'
import ListProducts from '../views/Category/ListProducts.vue'
import Signup from '../views/Signup.vue'
import Signin from '../views/Signin.vue'
import Wishlist from "../views/Product/Wishlist.vue";
import Cart from "../views/Cart/Cart.vue"
import Success from "../views/Payment/Success.vue";
import Failed from "../views/Payment/Failed.vue";
import Checkout from "../views/Checkout/Checkout.vue"
import OrderHistory from "../views/Order/OrderHistory.vue";

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/admin',
    name: 'Admin',
    component: Admin
  },
  {
    path: "/admin/category/add",
    name: "AddCategory",
    component: AddCategory,
  },
  {
    path: "/admin/category",
    name: "Category",
    component: Category,
  },
  {
    path: "/admin/product/add",
    name: "AddProduct",
    component: AddProduct
  },
  {
    path: "/admin/product",
    name: "Product",
    component: Product,
  },
  {
    path: "/admin/category/:id",
    name: "EditCategory",
    component: EditCategory
  },
  {
    path: "/admin/product/:id",
    name: "EditProduct",
    component: EditProduct
  },
  {
    path: "/product/show/:id",
    name: "ShowDetails",
    component: ShowDetails
  },
  {
    path: "/category/show/:id",
    name: "ListProducts",
    component: ListProducts
  },
  {
    path: '/signup',
    name: 'Signup',
    component: Signup
  },
  {
    path: '/signin',
    name: 'Signin',
    component: Signin
  },
  {
    path: '/wishlist',
    name: 'Wishlist',
    component: Wishlist
  },
  {
    path: '/cart',
    name: 'Cart',
    component: Cart
  },
  {
    path: '/payment/success',
    name: 'PaymentSuccess',
    component:Success
  },
  {
    path: '/payment/failed',
    name: 'PaymentFailed',
    component:Failed
  },
  {
    path: '/checkout',
    name: 'Checkout',
    component: Checkout
  },
  {
    path: '/orders',
    name: 'OrderHistory',
    component: OrderHistory
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
