<template>
  <div class="container">
    <div class="flex flex-col items-center justify-center">
        <logo />
      <h2 class="subtitle pt-10">
        base ApiPlatform - NuxtJs - Traefik.io
      </h2>
      <div class="links">
        <a
          href="https://nuxtjs.org/"
          target="_blank"
          class="button--green"
        >
          Nuxt Documentation
        </a>
        <a
          href="https://api-platform.com/docs"
          target="_blank"
          class="button--grey"
        >
          Api Platform Documentation
        </a>
      </div>
      <div class="links">
        <nuxt-link to="/requests" class="button--green">
          Test Requests
        </nuxt-link>
      </div>
    </div>
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo
  }
}
</script>

<style>
/* Sample `apply` at-rules with Tailwind CSS
.container {
  @apply min-h-screen flex justify-center items-center text-center mx-auto;
}
*/
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
