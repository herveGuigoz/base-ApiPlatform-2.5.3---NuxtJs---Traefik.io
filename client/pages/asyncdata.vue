<template>
  <div>
  </div>
</template>

<script>
  export default {
    name: "test",
    async asyncData ({ $axios }) {
      const { data } = await $axios.get('http://api.localhost/greetings');
      console.log( data )
      return { data }
    }
  }
</script>

<style scoped>

</style>
