<template>
<!--  <HelloWorld msg="Welcome to Your Vue.js App"/>-->
  <ol>
    <li v-for="service in services" v-bind:key="service">
      <span>{{ service.name }}</span>
      <span>{{ service.status }}</span>
    </li>
  </ol>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
import axios from "axios";

export default {
  name: 'App',
  components: {
    // HelloWorld
  },
  props: {
    services: []
  },
  methods: {
    getServiceStatus() {
      axios.get('http://api.eastack.cn/status/services')
          .then(response => console.log(response))
    }
  },
  mounted() {
    this.getServiceStatus()
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
