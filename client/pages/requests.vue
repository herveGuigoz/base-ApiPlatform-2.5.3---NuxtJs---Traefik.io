<template>
  <div class="p-10 flex flex-col">
    <div class="flex-1 bg-teal-500 text-white font-bold py-2 px-4 rounded text-center">
      request from server
      </div>
    <div class="mb-5 mt-1 border border-gray-400 bg-white rounded-b p-4 flex flex-col justify-between leading-normal">
      {{ data }}
    </div>
    <div class="cursor-pointer text-center bg-teal-500 hover:bg-teal-700 text-white font-bold py-2 px-4 rounded" @click="fetchGreetings">
      request from client
    </div>
    <div v-if="dataFromClient" class="mb-5 mt-1 border border-gray-400 bg-white rounded-b p-4 flex flex-col justify-between leading-normal">
      {{ dataFromClient }}
    </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
      dataFromClient: null
    }),
    async asyncData ({ $axios }) {
      const { data } = await $axios.get('/greetings');
      return { data }
    },
    methods:{
      async fetchGreetings() {
        const response = await this.$axios.$get('/greetings')
        console.log( response )
        this.dataFromClient = response
      }
    }
  }
</script>
