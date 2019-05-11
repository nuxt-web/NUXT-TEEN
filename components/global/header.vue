<template>
  <header @click="backToTop" class="teen-header" :class="[{'teen-header-transparent': withoutBg}, {'teen-header-fill': redBg}]">
    <div :style="{background : color?color:''}" v-if="special" class="header-content">
      <div v-if="back" class="teen-back" @click="goBack" :style="{color: color ? color : ''}">
        <i class="icon left"></i>
      </div>
      <div v-else class="teen-back">
        <slot name="back"></slot>
      </div>
      <div class="teen-title" :style="{color: color ? color : ''}">
        <slot name="title"></slot>
      </div>
      <div class="teen-filter" :style="{color: color ? color : ''}">
        <slot class="filter" name="filter"></slot>
      </div>
      <slot></slot>
    </div>
    <div :style="{background : color?color:''}" v-else class="header-content">
      <div v-if="back" class="teen-back" @click="goBack" :style="{color: color ? color : ''}">
          <img src="./../../static/images/back.png" alt="">
      </div>
      <div v-else class="teen-back">
        <slot name="back"></slot>
      </div>
      <div class="teen-title" :style="{color: color ? color : ''}">
        <slot name="title"></slot>
      </div>
      <div class="teen-filter" :style="{color: color ? color: ''}">
        <slot class="filter" name="filter"></slot>
      </div>
      <slot></slot>
    </div>
  </header>
</template>

<script>
  export default {
    name: 'teenHeader',
    /**
     * 参数说明
     * back：是否启用默认返回按钮，启用后，slot的back将无效
     * withoutBg：是否透明背景
     */
    props: ['back', 'withoutBg', 'redBg', 'color', 'special', 'steps'],
    methods: {
      // 默认返回按钮操作
      goBack: function () {
        if (this._events.back) {
          this.$emit('back')
        } else {
          this.$router.back()
        }
      },
      // 双击回到顶部
      backToTop: function () {
        this.$store.dispatch('backToTop')
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/global/header.scss" scoped></style>
