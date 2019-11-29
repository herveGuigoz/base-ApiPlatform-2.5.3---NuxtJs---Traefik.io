<template>
  <div>
    coucou
  </div>
</template>

<script>
  export default {
    name: "test",
    async asyncData ({ params }) {
      const { response } = await this.$axios.get('https://api.localhost/greetings?page=1/');
      return { data: response }
    }
  }
</script>

<style scoped>

</style>
