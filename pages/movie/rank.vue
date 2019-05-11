<template>
  <div>
    <movie-list :movieList="movieList"></movie-list>
  </div>

</template>

<script>
  import MovieList from './../../components/movie/MovieList.vue'
  import api from '../../model/api.js'
  export default {
    name: 'rank',
    components: {
      MovieList
    },
    data: function () {
      return {
        movieList: []
      }
    },
    methods: {
      getMovieList: function () {
        this.$ajax.get(api.getMovieList,{
          params:{
            type: 3
          }
        }).then((res)=>{
          res.data.data.map((item)=>{
            if (item.movie_tags) {
              item.movie_tags = item.movie_tags.split(',')
              return item
            }
          })
          this.movieList = res.data.data
        }).catch((error)=>{
          console.log(error)
        })
      }
    },
    created: function () {
      this.getMovieList();
    }
  }
</script>

<style scoped>

</style>
