<template>
  <div class="game-detail-tab game-detail-tab-top" ref="detailTab" @click="changeTab">
    <div class="tab-item active" v-if="currentTab == 0" data-index="0" data-name="mine">主页</div>
    <div class="tab-item" v-if="currentTab != 0" data-index="0" data-name="mine">主页</div>

    <div class="tab-item active" v-if="currentTab == 1" data-index="1" data-name="post">帖子</div>
    <div class="tab-item" v-if="currentTab != 1" data-index="1" data-name="mine-post">帖子</div>

    <div class="tab-item active" v-if="currentTab == 2" data-index="2" data-name="mineTopic">我的</div>
    <div class="tab-item" v-if="currentTab != 2" data-index="2" data-name="mine-mineTopic">我的</div>

    <div class="tab-paging" :style="[tabStyle]"></div>
  </div>
</template>

<script>
  export default {
    name: 'MineTab',
    data: function () {
      return {
        // 当前位置
        currentTab: 0,
        // Tab游标的位移
        tabStyle: {
          width: '100%'
          // left: '100%'
        }
      }
    },
    methods: {
      changeTab: function (e) {
        const path = e.target.dataset.name
        const index = e.target.dataset.index
        if (!path) return
        this.$router.push({ name: path })
        this.currentTab = index

        // 计算游标移动的位置和他的宽度
        this.calcIndex(index)
        this.$emit('changeIndex', index)
      },
      // 计算游标位置
      calcIndex: function (index) {
        let width = this.$refs.detailTab.children[index].clientWidth * 0.54
        let left = this.$refs.detailTab.children[index].offsetLeft + this.$refs.detailTab.children[index].clientWidth * 0.5 - width * 0.5
        this.tabStyle = {
          width: width + 'px',
          left: left + 'px'
        }
      },
      // 重置游标
      resetIndex: function () {
        let path = this.$route.path.split('/')[this.$route.path.split('/').length - 1]
        let currentTab = this.currentTab
        switch (path) {
          case '':
            currentTab = 0
            break
          case 'post':
            currentTab = 1
            break
          case 'topic':
            currentTab = 2
            break
        }
        this.currentTab = currentTab
        this.calcIndex(currentTab)
      }
    },
    mounted: function () {
      this.resetIndex()
    },
    watch: {
      $route: function () {
        this.resetIndex()
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/mine/mineTab.scss" scoped></style>
