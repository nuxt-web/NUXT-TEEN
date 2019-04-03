<template>
  <section id="mine">
    <div class="mine-me">
      <!--<div class="me-tag">-->
      <!--<div class="tag-bar">-->
      <!--<div class="tag" :style="{background: color[0]}">正太</div>-->
      <!--<div class="tag" :style="{background: color[1]}">电影迷</div>-->
      <!--<div class="tag" :style="{background: color[2]}">悬疑</div>-->
      <!--</div>-->
      <!--<div class="tag-bar">-->
      <!--<div class="tag" :style="{backgetrtefground: color[3]}">漫威</div>-->
      <!--<div class="tag" :style="{background: color[4]}">小清新</div>-->
      <!--</div>-->
      <!--</div>-->
      <div class="me-head">
        <div class="head">
          <div class="avatar">
            <img src="./../static/mine/corn.png" alt="">
          </div>
          <div class="edit" @click="goPage('me')">
            <p>账号资料</p>
          </div>
        </div>
        <div class="body">
          <span>血小板</span>
        </div>
        <div class="footer">
          <p class="text">粉丝:<span>88</span></p>
          <p class="text">关注:<span>568</span></p>
        </div>
      </div>
    </div>
    <mine-tab></mine-tab>
    <section class="mine-wrapper">
      <nuxt-child/>
    </section>
    <!--<div class="mine-btn" @click="showLogoutDialog" v-if="isLogin">退出账号</div>-->
    <div class="mine-bg"></div>

    <teen-footer></teen-footer>
    <!-- 页面底部 -->
    <!--<transition :name="footerTransition">-->
      <!--<rastar-footer v-if="showFooter"></rastar-footer>-->
    <!--</transition>-->
    <!-- 页面底部 结束 -->

    <!--<transition name="fade">-->
      <!--<rastar-dialog v-if="showLogout" type="close" @close="close">-->
        <!--<div class="body-title" slot="body">是否退出当前账号？</div>-->
        <!--<div class="btns" slot="footer">-->
          <!--<div class="btn cancel" @click="close">取消</div>-->
          <!--<div class="btn submit" @click="logout">确定</div>-->
        <!--</div>-->
      <!--</rastar-dialog>-->
    <!--</transition>-->
  </section>
</template>

<script>
  import TeenHeader from './../components/global/teenScroller'
  import TeenScroller from "./../components/global/teenScroller";
  import TeenFooter from "./../components/global/footer"
  import MineTab from "./../components/mine/MineTab"

  export default {
    name: 'mine',
    components: {
      TeenHeader,
      TeenFooter,
      TeenScroller,
      MineTab
    },
    data: function () {
      return {
        isLogin: false,
        canDownload: false,
        showLogout: false,
        userInfo: {},
        showFooter: true,
        footerTransition: '',
        haveNotice: false,
        newmessage: false,
        color: [],
        gameDetail: {
          activity: {},
          android_download_url: 'http://down.dszl.resources.3737.com/CGG_IPay_2371.apk',
          android_game_version: '2050003215',
          android_package_name: 'com.tt.dszn.m3737',
          android_package_size: '163.49',
          app_id: 100013,
          category: '动作游戏',
          cch_id: 222,
          comment_num: 47,
          compatible_os: '1|2',
          concerned: 2,
          detail_desc: '《大圣之怒》是由天拓游戏自主研发的西游后传动作手游，在这里寻找取经背后的真相。精致唯美的3D画面，殿堂级原声配乐，缔造震撼视听盛宴；野外自由激战，怒气无双连招，尽享畅快战斗体验；一怒扫四方，热血战八荒，美人相伴万人国战；地府时装，齐天大圣，新手即赠丰厚福利；荣耀巅峰，酣畅竞技，大圣为正义与荣耀而战！',
          detail_img: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/02/26/1519635087494.jpg?imageView2/2/w/720/h/404',
          detail_origin_img: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/02/26/1519635087494.jpg',
          detail_video: {video_img: '', video_url: '', video_origin_img: ''},
          display_media: 1,
          forum_id: '',
          forum_url: '',
          game_status: {android_game_status: '现已上线', ios_game_status: '现已上线'},
          gift: {id: 33, name: '新手礼包'},
          h5_dst_url: '',
          icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/03/06/1520328789698.png',
          icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/03/06/1520328789698.png?imageView2/2/w/128/h/128',
          ios_app_id_main: 100043,
          ios_certificate_url: '',
          ios_download_url: 'https://down.dszl.resources.3737.com/dszl-ios.html',
          ios_package_size: '452',
          is_enterprise: 0,
          media_group_type: 2,
          name: '大圣之怒',
          post_num: 0,
          qq_group_key: {qq_android_group_key: '', qq_ios_group_key: '', qq_web_group_key: ''},
          qq_number: '',
          rank_number: 32222,
          service_phone: '020-89293727',
          slogan: '一个西游在老去，一个大圣在归来',
          star: '4.13',
          website_url: ''
        }
      }
    },
    methods: {
      // 下载app
      downloadApp: function () {
        window._hmt.push(['_trackEvent', '我的主页', '点击', '下载APP'])
        // 下载app
        if (this.$xh.isWeChat()) {
          // 进入微信引导页面
          this.$router.push({
            name: 'wechat',
            params: {
              url: 'http://files.rastargame.com/andriodapk/RSClient.apk'
            }
          })
        } else {
          window.location.href = 'http://files.rastargame.com/andriodapk/RSClient.apk'
        }
      },
      // 去往登录页
      goLogin: function () {
        window._hmt.push(['_trackEvent', '我的主页', '点击', '立即登录'])
        this.$router.push({
          name: 'login'
        })
      },
      trackEvent: function (e) {
        window._hmt.push(['_trackEvent', '我的主页', '点击', e])
      },
      // 页面跳转
      goPage: function (route) {
        this.$router.push({ name: route })
      },
      // 获取当前用户信息
      getUserInfo: function () {
        let uInfo = this.$xh.getCookieArray('_XH_U_CL')
        this.$store.dispatch('changeUserInfo', uInfo)
        this.$ajax({
          url: this.$api.getUserInfo,
          method: 'post'
        }).then((res) => {
          if (res.data.code === 200) {
            let userInfo = res.data.data
            let precent = userInfo.precent.split('%')[0]
            if (parseInt(precent) >= 100) precent = 100
            userInfo.money = String(userInfo.balance).split('.')[0]
            userInfo.vipPrecent = precent + '%'
            // 这里要注意vue的对象检测更新问题，为已有对象赋予多个新属性，应创建一个新的对象
            this.userInfo = Object.assign({}, this.userInfo, userInfo)
            this.isLogin = true
          } else {
            this.$store.dispatch('changeToastText', res.data.msg)
          }
        }).catch(() => {
          this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
        })
      },
      // 获取用户信息
      getUserData: function (uid) {
        let xhr = new XMLHttpRequest()
        let reponseText
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            reponseText = JSON.parse(xhr.responseText)
          }
        }
        xhr.open('get', this.$api.getReplyUserInfo + '/' + uid, false)
        xhr.send()
        return reponseText
      },
      // 获取用户的authenticate_name
      getAuthName: function () {
        this.$ajax({
          url: this.$api.getUid,
          method: 'get'
        }).then((res) => {
          if (res.data.code === 200) {
            let userData = this.getUserData(res.data.data)
            // 这里要注意vue的对象检测更新问题， Vue 不能检测对象属性的删除和添加问题，所以使用Vue.set来实现,this.$set相当于Vue.set
            this.$set(this.userInfo, 'authenticate_name', userData.data.authenticate_name)
          }
        })
      },
      showLogoutDialog: function () {
        window._hmt.push(['_trackEvent', '我的主页', '点击', '退出账号'])
        this.showLogout = true
      },
      close: function () {
        window._hmt.push(['_trackEvent', '我的主页', '点击', '取消退出账号'])
        this.showLogout = false
      },
      getrtef: function (done) {
        console.log(444)
        done()
      },
      // 滑动事件
      onScroll: function (scroll) {
        if (this.scrollTop - scroll < -20) {
          this.footerTransition = 'slideDown'
          this.$nextTick(() => {
            this.showFooter = false
          })
        } else if (this.scrollTop - scroll > 20) {
          this.footerTransition = 'slideUp'
          this.$nextTick(() => {
            this.showFooter = true
          })
        }
        this.scrollTop = scroll
      },
      // 退出登录
      logout: function () {
        window._hmt.push(['_trackEvent', '我的主页', '点击', '确定退出账号'])
        this.$ajax({
          url: this.$api.logout,
          method: 'get'
        }).then((res) => {
          if (res.data.code === 200) {
            this.isLogin = false
            this.$store.dispatch('changeUserInfo', {})
          }
          this.showLogout = false
          this.$store.dispatch('changeToastText', res.data.msg)
        }).catch(() => {
          this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
        })
      },
      setSystem: function () {
        if (this.system === 'android') {
          this.canDownload = true
        }
      },
      getColor: function () {
        let r = Math.floor(Math.random() * 255)
        let g = Math.floor(Math.random() * 255)
        let b = Math.floor(Math.random() * 255)
        let color = 'rgba(' + r + ',' + g + ',' + b + ',0.8)'
        this.color.push(color)
      }
    },
    created: function () {
      this.setSystem()
      for (let i = 0; i < 5; i++) {
        this.getColor()
      }
    }
  }
</script>

<style lang="scss" src="./../assets/css/components/mine/mine.scss" scoped></style>
