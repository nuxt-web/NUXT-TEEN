<template>
  <section>
    <div class="game-body" v-for="(movie, index) in movieList" :key="index" @click="goPage">
      <div class="movie-item">
        <div class="movie-img">
          <img :src="movie.url" alt="">
        </div>
        <div class="movie-des">
          <div class="movie-title">
            <div class="movie-name">
              <p>{{movie.title}}</p>
            </div>
            <div class="movie-time">
              <p>{{movie.time}}</p>
            </div>
          </div>
          <div class="movie-slogan">
            <p>{{movie.slogan}}</p>
          </div>
          关键词：
          <div class="movie-tag-container">
            <div class="movie-tag" v-for="item in movie.tags">{{item}}</div>
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
      goPage: function () {
        this.$router.push({ name: 'movieDetail' })
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/movie/MovieList.scss" scoped></style>

