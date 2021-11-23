<template>
  <component :is="layout">
    <slot />
  </component>
</template>

<script setup>
import { markRaw, watchEffect } from "vue";
import { useRoute } from "vue-router";
import AppLayoutDefault from "./AppLayoutDefault.vue";

const layout = markRaw(AppLayoutDefault);
const route = useRoute();

watchEffect(() => {
  if (route.meta.layout) {
    try {
      layout = await import(`./${route.meta.layout}.vue`);
    } catch (e) {
      layout = AppLayoutDefault;
    }
  }
});
</script>
