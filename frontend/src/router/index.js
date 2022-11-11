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
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
