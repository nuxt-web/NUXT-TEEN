<template>
  <div>
    <movie-list :movieList="movieList"></movie-list>
  </div>

</template>

<script>
  import MovieList from './../../components/movie/MovieList.vue'
  export default {
    name: 'hotLine',
    components: {
      MovieList
    },
    data: function () {
      return {
        movieList: []
      }
    },
    mounted: function () {
      this.movieList = [
        {
          url: require('../../static/images/BLUE1.jpg'),
          title: '比悲伤更悲伤的故事',
          time: '2019-3-14',
          slogan: '唯一观影建议：请带着纸巾',
          tags: [
            '6666', '感动', '哭了三分之一', '爱', '6666', '6666'
          ]
        }
      ]
    }
  }
</script>

<style scoped>

</style>
