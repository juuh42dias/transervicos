<template>
  <div id="home-job-list">
    <ul>
      <li v-for="job in jobs" :key="job.id">
        {{ job.title }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "home-job-list",
  data: getJobs()
}

function getJobs(){
  fetch('/jobs.json')
    .then(function(response) {
      return response.json();
    })
    .then(function(json) {
      console.log(json);
    });
};
</script>

<style scoped>
li {
  font-size: 2em;
  text-align: center;
}
</style>
