<template>
  <section id="newsDetail">
    <teen-header :withoutBg="withoutHeaderBg" @back="goBack" v-if="news.news_type === 1">
      <p v-if="headerType === 'null'" class="title" slot="title"></p>
      <p v-if="headerType === 'play'" class="title" slot="title" @click="playVideo">
        <i class="icon play"></i>播放视频</p>
    </teen-header>
    <div class="page-wrapper news-detail" v-if="showEl">
      <teen-scroller ref="scroller" :refresh="pushNews" :infinite="pullReply" @scroll="onScroll" padding="2.4rem">
        <!-- 游戏信息 -->
        <div class="game-detail">
          <div class="game-detail-top" ref="detailTop" v-if="showTop">
            <video-box page="detail" ref="video" :source="news.content" :poster="news.kv_img"></video-box>
          </div>
        </div>
        <!-- 官方信息 -->
        <div class="game-info">
          <div class="game-info-des">
            <div class="game-info-img">
              <img src="./../../static/images/label.png">
            </div>
            <div class="game-info-body official">
              <p>比悲伤更悲伤的故事</p>
            </div>
          </div>
        </div>
        <!-- 官方信息结束 -->


        <div class="news-reply">
          <div class="reply-title">客官评论区：</div>
          <reply-item v-if="replyList.length > 0" :list="replyList" category="news" :newsId="$route.params.newsId"></reply-item>
          <div v-else class="reply-null">
            <div class="null-img">
              <!--<img src="./../../assets/img/common/null-reply.png">-->
            </div>
            <p class="null-des">沙发 or 板凳，取决于你的手速</p>
          </div>
        </div>
      </teen-scroller>
    </div>

    <!--<div class="page-loading" v-else>-->
      <!--<rastar-loading></rastar-loading>-->
    <!--</div>-->

    <!--<reply-sub-news :news="news" @reply="confirmReply" :islike="news.is_like" @ifLike="whetherLike(news.is_like)" :emotion=true></reply-sub-news>-->


    <!-- 评论回复弹窗 结束 -->

    <teen-footer></teen-footer>
  </section>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import TeenScroller from './../../components/global/teenScroller'
  import TeenFooter from './../../components/global/footer'
  import VideoBox from './../../components/global/videoBox'
    export default {
        name: "cinema",
      components: {
        TeenHeader,
        TeenScroller,
        TeenFooter,
        VideoBox
      },
      data: function () {
        return {
          showTop: true,
          withoutHeaderBg: true,
          is_like: true,
          // 页面控制
          showEl: false,
          canReturn: false,
          // 数据
          news: {},
          newsId: 0,
          gameInfo: {},
          recomGame: {},
          replyList: [],
          // 请求参数
          params: {
            page: 1,
            limit: 10
          },
          // 微信分享数据
          shareData: {},
          fromRouter: {},
          // 限制回复数据请求，因为在没有回复的情况下，添加新回复会生成一个临时回复，同时也会请求回复数据，造成数据重复
          isPullReply: true,
          headerType: null,
          type: '',
          padding: '2.4rem',
          isBack: false
        }
      },
      watch: {
        type: function (curr) {
          if (curr === 1) {
            this.padding = '0'
          } else {
            this.padding = '2.4rem'
          }
        }
      },
      methods: {
        onScroll: function (e) {
          if (e > 230){
            this.headerType = 'play'
            this.withoutHeaderBg = false
            if(this.$refs.video) {
              this.$refs.video.pause()
            }
          } else if (e < 230) {
            this.headerType = null
            this.withoutHeaderBg = true
          }
        },
        goBack: function () {
          if (this.canReturn) {
            window.location.href = '//' + window.location.host + '/shop'
          } else {
            if (this.fromRouter.name) {
              this.$router.back()
            } else {
              this.$router.push({
                name: 'news'
              })
            }
          }
        },
        // 去往游戏详情
        goGameDetail: function (id) {
          window._hmt.push(['_trackEvent', '资讯详情页', '点击', '推荐游戏'])
          this.$router.push({ name: 'gameDetail', params: { appId: id } })
        },
        // 关注游戏
        follow: function (like) {
          let userCookie = this.$xh.getCookieArray('_XH_U_CL')
          if (userCookie[0]) {
            let oper = 0
            if (like === 1) oper = 2
            else if (like === 2) oper = 1

            this.$ajax({
              url: this.$api.followGame + '/' + this.news.app_id + '/' + oper,
              method: 'get'
            }).then((res) => {
              if (res.data.code === 200) {
                this.gameInfo.is_like = oper
                this.$store.dispatch('changeToastText', '关注是一种态度')
              } else {
                this.$store.dispatch('changeToastText', res.data.msg)
              }
            }).catch(() => {
              this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
            })
          } else {
            this.$router.push({ name: 'login' })
          }
        },
        //  点赞资讯
        whetherLike: function (like) {
          let userCookie = this.$xh.getCookieArray('_XH_U_CL')
          if (userCookie[0]) {
            let oper, temp
            if (like === 0) {
              oper = 1
              temp = 1
            }
            else if (like === 1) {
              oper = 0
              temp = -1
            }

            this.$ajax({
              url: this.$api.likeNews + '/' + this.news.id + '/' + oper,
              method: 'get'
            }).then((res) => {
              if (res.data.code === 200) {
                this.news.is_like = oper
                this.news.like_num += temp
                console.log(oper)
                if(oper === 1) this.$store.dispatch('changeToastText', '点赞成功')
              } else {
                this.$store.dispatch('changeToastText', res.data.msg)
              }
            }).catch(() => {
              this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
            })
          } else {
            this.$router.push({ name: 'login' })
          }
        },
        // 去往预约
        openAppointment: function (id) {
          this.$store.dispatch('changeAppointmentState', true)
          this.$router.push({ name: 'gameDetail', params: { appId: id } })
        },
        // 确认回复（主评论列表）
        confirmReply: function (reply) {
          // if (this.replyList.length > 0 ||  this.news.news_count > 0) {
          // if (this.replyList[0].is_official === 1) {
          //     // 第一条是官方，插入到第二条中去
          //     this.replyList.splice(1, 0, reply)
          // } else {
          //     // 不是官方
          //     this.replyList.unshift(reply)
          // }
          // 临时主评论是否显示，只有当所有评论都显示的时候，才将临时主评论放在最后，news_count为该条资讯的所有主评论
          //     if (this.replyList.length >= this.news.news_count) {
          //         this.replyList.unshift(reply + 666666)
          //         console.log(reply)
          //         this.isPullReply = true
          //     }
          // } else {
          this.replyList.unshift(reply)
          this.isPullReply = true
          // }
        },
        // 获取资讯详情
        pushNews: function (done) {
          done()
        },
        // 获取评论列表
        pullReply: function (done) {
          done(true)
        },
        // 微信中分享
        weChatShare: function () {
          new Promise((resolve, reject) => {
            // 获取微信签名
            this.$ajax({
              url: this.$api.getWechat,
              method: 'get',
              params: {
                redirect_url: window.location.href
              }
            }).then((res) => {
              resolve(res.data)
            }).catch((err) => {
              reject(err)
            })
          }).then((data) => {
            setShareInfo({
              title: this.shareData.title, // 分享标题
              summary: this.shareData.desc, // 分享内容
              pic: this.shareData.icon, // 分享图片
              url: this.shareData.link, // 分享链接
              // 微信权限验证配置信息，若不在微信传播，可忽略
              WXconfig: {
                swapTitleInWX: false, // 是否标题内容互换（仅朋友圈，因朋友圈内只显示标题）
                appId: data.appId, // 公众号的唯一标识
                timestamp: data.timestamp, // 生成签名的时间戳
                nonceStr: data.nonceStr, // 生成签名的随机串
                signature: data.signature // 签名
              }
            })
          })
        },
        playVideo: function () {
          this.$refs.scroller.scrollTo(0, true)
          this.$store.dispatch('backToTop')
          setTimeout(() => {
            this.$refs.video.playing()
          }, 500)
        },
      },
      created: function () {
        // this.newsId = this.$route.params.newsId
        // this.pushNews()
        let res = {
          app_id: 0,
          content: 'https://img02.rastargame.com/gameCenter/video/video_news/2018/12/25/1545726390424.mp4',
          create_time: '3个月前',
          game_info: {
            is_like: 2
          },
          is_like: 2,
          id: 4392,
          is_platform: 1,
          kv_img: 'https://img3.doubanio.com/img/trailer/small/2540028255.jpg?',
          like_num: 0,
          news_count: 0,
          news_type: 1,
          recom_game: [],
          title: '是驴？是猪？没想到吧，竟然是.....！'
        }
        console.log(res)
        this.news = res
        this.type = res.news_type
        this.gameInfo = res.game_info
        this.recomGame = res.recom_game
        this.shareData = {
          title: this.news.title,
          link: window.location.href,
          icon: this.gameInfo.icon?this.gameInfo.icon: window.CUSTOM_DOMAIN + '/dist/static/img/b4cae36b2ba58488f87422c59ebeb8ce.png',
          desc: this.news.content.replace(/<[^>]+>/g, '')
        }
        this.showEl = true
      },
    }
</script>

<style lang="scss" src="./../../assets/css/views/cinema/cinema.scss" scoped></style>
<!--因为加上scoped的话，样式仅对当前组件有效，对v-html渲染出来的内容无效，所以添加下面的样式-->
<style>
  .news-content p {
    font-size: 14px;
  }
</style>
