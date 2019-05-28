<template>
  <section class="video-box" id="videoBox">
    <div class="ios-video">
      <video-player :options="playerOptions" ref="videoBox" :playsinline="true" @pause="onPlayerPause($event)" @waiting="onPlayerWaiting($event)"
                    @playing="onPlayerPlaying($event)"></video-player>
      <transition name="fade">
        <p v-if="canPlay" class="video-playing" key="play">
          <i @click="playing" class="icon play"></i>
        </p>
      </transition>
      <transition name="fade">
        <p v-if="canPause" class="video-playing" key="pause">
          <i @click="pause" class="icon pause"></i>
        </p>
      </transition>
      <div class="playing-mask" @click="showPause"></div>
    </div>
    <!-- <div class="android-video" v-if="system === 'android'">
      <div class="android-video-inner">
        <img :src="poster">
        <p class="video-playing">
          <i @click="openVideo" class="icon play"></i>
        </p>
      </div>
    </div> -->
  </section>

</template>

<script>
  export default {
    name: 'videoBox',
    props: ['source', 'poster', 'page', 'game_name'],
    data: function () {
      return {
        playerOptions: {
          // videojs options
          muted: false,
          language: 'zh',
          controls: false,
          sources: [{
            type: 'video/mp4',
            src: ''
          }],
          poster: '',
          notSupportedMessage: '暂时无法播放该视频'
        },
        // 状态
        canPlay: true,
        canPause: false,
        canShowPause: false
      }
    },
    created: function () {
      this.playerOptions.sources[0].src = this.source
      this.playerOptions.poster = this.poster
    },
    methods: {
      // 开始播放
      playing: function () {
        this.player.play()
        // this.openVideo()
      },
      // 暂停播放
      pause: function () {
        this.player.pause()
      },
      // 显示暂停按钮
      showPause: function () {
        if (this.canShowPause) {
          this.canPause = true
          setTimeout(() => {
            this.canPause = false
          }, 1000)
        }
      },
      onPlayerPause: function () {
        this.canPlay = true
        this.canShowPause = false
      },
      onPlayerWaiting: function () {
        this.canPlay = false
      },
      onPlayerPlaying: function () {
        this.canPlay = false
        this.canShowPause = true
      },
      // 安卓打开播放弹窗
      openVideo: function () {
        // 需要传递播放资源链接和播放状态
        if (this.page === 'detail') window._hmt.push(['_trackEvent', '游戏详情页', '播放', '游戏视频'])
        else window._hmt.push(['_trackEvent', '游戏中心（首页）', '播放', '游戏视频'])
        this.$store.dispatch('changeVideo', this.source)
        this.$store.dispatch('changeVideoState', true)
      }
    },
    computed: {
      player: function () {
        return this.$refs.videoBox.player
      },
      system: function () {
        return this.$store.getters.getSystem
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/global/videoBox.scss"></style>

