<template>
  <div>
    <teen-header back=true>
      <p slot="back" @click="goBack">
        <img src="./../../static/images/back.png" alt="">
      </p>
      <div class="title" slot="title">
        <p>电影详情</p>
      </div>
    </teen-header>

    <section class="page-wrapper" style="height: 100%">
      <teen-scroller padding="2.4rem">
        <div class="container">
          <div class="movie-des">
            <div class="left-side">
              <img :src="movie.img_url" alt="">
            </div>
            <div class="right-side">
              <div class="name">
                {{movie.movie_name}}
              </div>
              <div class="type">
                {{movie.movie_type}}
              </div>
              <div class="time">
                {{movie.appear_time}}上映
              </div>
              <div class="slogan">
                {{movie.movie_slogan}}
              </div>
              <div class="btns">
                <div class="btn">
                  收藏
                </div>
                <div class="btn nowatch" v-if="!watched" @click="doSeeMovie(1)">
                  已看过
                </div>
                <div class="btn watched" v-if="watched" @click="doSeeMovie(2)">
                  看过
                </div>
              </div>
            </div>
          </div>
          <div class="synopsis">
            <div class="des-label">
              <p>剧情简介</p>
            </div>
            <div class="des" v-html="movie.movie_des">

            </div>
          </div>
          <div class="comment">
            <div class="comment-label">
              <p>网友评价</p>
            </div>
            <div class="comment-card" v-for="item in comment">
              <div class="comment-avator">
                <img :src="item.avator" alt="">
              </div>
              <div class="comment-des">
                <div class="user-name">
                  {{item.user_name}}
                </div>
                <div class="comment-time">
                  {{item.comment_time}}
                </div>
                <div class="comment-detail">
                  {{item.comment}}
                </div>
              </div>
            </div>
          </div>
        </div>
      </teen-scroller>
    </section>
  </div>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import TeenScroller from "../../components/global/teenScroller";
  import api from "../../model/api.js"
  import tools from "../../model/tools.js"
  export default {
    name: "movieDetail",
    components: {
      TeenHeader,
      TeenScroller
    },
    data: function () {
      return {
        movie_id: '',
        movie:{
          appear_time: "",
          img_url: "",
          movie_des: "",
          movie_id: "",
          movie_name: "",
          movie_slogan: "",
          movie_tags: "",
          background_color: '#FF0000',
          movie_type: ''
        },
        watched: false,
        comment: []
      }
    },
    methods: {
      getMovieDetail:function () {
          this.$ajax.get(api.getMovieDetail,{
            params:{
              movie_id: this.movie_id
            }
          }).then((res)=>{
            if (res.data.code == 200) {
              this.movie = res.data.data
              this.comment = res.data.comment
              this.doSeeMovie()
            }
          }).catch((error)=>{
            console.log(error)
          })
      },
      goBack: function () {
        this.$router.back()
      },
      doSeeMovie: function (type) {
        let uid = this.$tools.getCookie('_TEEN_')
        let params = {
          movie_id :this.movie.movie_id,
          uid: uid
        }
        if (type) {
          params.type = type
        }
        this.$ajax.get(api.doSeeMovie,{
          params: params
        }).then((res)=>{
          if (res.data.code == 200) {
            this.watched = res.data.data
            console.log(this.watched)
          }
          console.log(res)
        }).catch((error)=>{
          console.log(error)
        })
      }
    },
    mounted: function () {
      this.movie_id = this.$route.params.id
      this.getMovieDetail();
      this.doSeeMovie()
    }
  }
</script>

<style lang="scss" src="./../../assets/css/views/movieDetail/movieDetail.scss" scoped></style>
