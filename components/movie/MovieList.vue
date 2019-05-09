<template>
  <section>
    <div class="game-body" v-for="(movie, index) in movieList" :key="index" @click="goMovieDetail(movie.movie_id)">
      <div class="movie-item">
        <div class="movie-img">
          <img :src="movie.img_url" alt="">
        </div>
        <div class="movie-des">
          <div class="movie-title">
            <div class="movie-name">
              <p>{{movie.movie_name}}</p>
            </div>
            <div class="movie-time">
              <p>{{movie.movie_time}}</p>
            </div>
          </div>
          <div class="movie-slogan">
            <p>{{movie.movie_slogan}}</p>
          </div>
          关键词：
          <div class="movie-tag-container">
            <div class="movie-tag" v-for="item in movie.movie_tags">{{item}}</div>
          </div>
        </div>
      </div>
    </div>
  </section>

</template>

<script>
  export default {
    name: 'MovieList',
    props: ['movieList'],
    components: {
    },
    methods: {
      goMovieDetail: function (id) {
        console.log(888)
        this.$router.push({ name: 'movieDetail-id',params: { id: id}})
      },
      goPage: function () {
        this.$router.push({ name: 'movieDetail' })
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/movie/MovieList.scss" scoped></style>

