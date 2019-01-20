<template>
  <div id="home-job-list">
    <ul>
      <li v-for="job in jobs">
        {{ job.title }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "home-job-list"
  data: function () {
    let response = await fetch('/jobs.json');
    return {
      response
    }
  }
}
</script>

<style scoped>
li {
  font-size: 2em;
  text-align: center;
}
</style>
