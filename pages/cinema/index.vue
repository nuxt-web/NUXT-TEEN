<template>
  <section>
    <teen-header :withoutBg="withoutHeaderBg">
      <p slot="back" @click="goBack">
        <img src="./../../static/images/back.png" alt="">
      </p>
      <div class="title" slot="title">
        <p>放映厅</p>
      </div>
    </teen-header>
    <div class=""></div>
    <div class="page">
      <div class="none">暂无影片播放</div>
      <video id="video" ref="video" class="video" :src="videoSrc" controls="controls">
          您的浏览器不支持 video 标签。
      </video>
      <p class="video-name"><span class="tip">{{videoTip}}：</span>{{videoInfo.film_name}}</p>
      <p class="message-title">讨论区</p>
      <div class="message-list">
        <div v-for="item in messageList">
            <!-- {{item.msg}} -->
            <div class="enter-info" v-if="item.type == 1">
              {{item.username}} 进入聊天室
            </div>
            <div v-else>
              <div class="message-right" v-if="item.uid == userInfo.uid">
                <p class="user">{{item.username}}</p>
                <p class="content">{{item.msg}}</p>
              </div>
              <div class="message-left" v-else>
                <p class="user">{{item.username}}</p>
                <p class="content">{{item.msg}}</p>
              </div>
            </div>
        </div>
      </div>
      <div class="edit-bottom">
        <input type="text" v-model="messageValue">
        <div class="send-btn" @click="sendMsg">发送</div>
      </div>
    </div>
    <!-- <teen-footer></teen-footer> -->
  </section>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import TeenScroller from './../../components/global/teenScroller'
  import TeenFooter from './../../components/global/footer'
  import VideoBox from './../../components/global/videoBox'
  import {postFetch, getFetch} from './../../model/request'
  import API from './../../model/api'
  import Tool from './../../model/tools'
import { setTimeout } from 'timers';
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
          messageValue: '',
          // withoutHeaderBg: true,
          withoutHeaderBg: false,
          isBack: false,
          ws: '',
          messageList: [],
          video: {},
          videoInfo: {},
          videoSrc: '',
          userInfo: {},
          videoTip: ''
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
        goBack: function () {
          this.$router.back()
        },
        sendMsg () {
          // console.log(this.messageValue)
          if (this.ws) {
            let data = {
              type: 2,  // 聊天信息
              uid: this.userInfo.uid,
              username: this.userInfo.user_name,
              msg: this.messageValue
            }
            this.ws.send(JSON.stringify(data));
            // data.user = 'mine'
            this.messageList.push(data)
            this.messageValue = ''
          }
        },
        playVideo: function () {
          this.$refs.scroller.scrollTo(0, true)
          this.$store.dispatch('backToTop')
          setTimeout(() => {
            this.$refs.video.playing()
          }, 500)
        },
        initWebSocket () {
          //连接到WS服务器，注意：协议名不是http！
          this.ws = new WebSocket('ws://localhost:9999');
          let ws = this.ws
          let _this = this
          ws.addEventListener("open", function(){
            console.log("已连接");
            let data = {
              type: 1,
              username: _this.userInfo.user_name
            }
            ws.send(JSON.stringify(data))
          });
          ws.addEventListener("message", (a) => {
            // console.log(a, 'message')
            let data = JSON.parse(a.data);
            // 新用户进入放映厅
            this.messageList.push(data)
            console.log(this.messageList, 'message')
            // 心跳检测
            if (data.type === "ping") {
              ws.send("{\"type\":\"pong\"}");
            }
          })
        },
        async getVideo () {
          let sendData = {
            tm: Math.round(new Date().getTime()/1000)
          }
          let res = await getFetch(API.getVideo, sendData)
          console.log(res, 'res---')
          if (res.data.code === 200) {
            if (res.data.data.length > 0) {
                let _this = this
                let st = new Date(res.data.data[0].start_time).getTime()
                let ct = new Date().getTime()
                this.videoInfo = res.data.data[0]
                if (st > ct) {
                  // 目前尚未有电影在播放
                  let offsetTime = st - ct
                  console.log(offsetTime, '还未开始')
                  this.videoTip = '即将播放'
                  setTimeout(() => {
                    this.videoSrc = res.data.data[0].src
                    this.videoTip = '正在播放'
                    this.$nextTick(() => {
                      this.$refs.video.play()
                    })
                    this.$refs.video.play()
                  }, offsetTime)
                } else {
                  // 目前已有电影在播放
                  this.videoTip = '正在播放'
                  this.videoSrc = res.data.data[0].src
                  this.$refs.video.currentTime = (ct - st)/1000
                  this.$nextTick(() => {
                    this.$refs.video.play()
                  })
                  console.log(ct - st, '时间差')
                }
              }
            }
        }
      },
      created: function () {
        // this.newsId = this.$route.params.newsId
        // this.pushNews()
        this.userInfo = Tool.getSession('user_info')
        console.log(this.userInfo)
        this.initWebSocket()
        this.getVideo()
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
