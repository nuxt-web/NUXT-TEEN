<template>
  <footer class="rastar-footer">
    <div class="footer-item" v-for="(tab, index) in tabList" :key="index" :data-router="tab.type" @click="goPage(tab.type)" :class="{cinema: index === 2 }">
      <div class="footer-icon" :class="[tab.type, {active: tab.active}]"></div>
      <p :class="{active: tab.active}">{{tab.label}}</p>
    </div>
  </footer>
</template>

<script>
  export default {
    name: 'TeenFooter',
    data: function () {
      return {
        tabList: [{ label: '首页', type: 'teen', active: false },
          // { label: '电影', type: 'gift', active: false},
          { label: '电影', type: 'movie', active: false },
          // { label: '放映室', type: 'scoreShop', active: false},
          { label: '放映室', type: 'cinema', active: false },
          { label: '活动', type: 'news', active: false },
          { label: '我的', type: 'mine', active: false }]
      }
    },
    methods: {
      // 去往页面
      goPage: function (route) {
        this.$router.push({ name: route })
        this.setIconActive(route)
      },
      // 设置当前页的状态
      setIconActive: function (route) {
        this.tabList.map((tab) => {
          if (tab.type === route) {
            tab.active = true
          } else {
            tab.active = false
          }
        })
      }
    },
    mounted: function () {
      let route = this.$route.name
      console.log(route)
      console.log(this.$route)
      if (route === '' || !route) route = 'game'
      this.setIconActive(route)
    },
    watch: {
      $route: function (val) {
        let module = val.meta.module
        this.setIconActive(module)
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/global/footer.scss" scoped></style>
