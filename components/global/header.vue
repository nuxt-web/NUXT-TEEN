<template>
  <header @click="backToTop" class="rastar-header" :class="[{'rastar-header-transparent': withoutBg}, {'rastar-header-fill': redBg}]">
    <div :style="{background : color?color.bg_main:''}" v-if="special" class="header-content">
      <div v-if="back" class="rastar-back" @click="goBack" :style="{color: color ? color.body_main : ''}">
        <i class="icon left"></i>
      </div>
      <div v-else class="rastar-back">
        <slot name="back"></slot>
      </div>
      <div class="rastar-title" :style="{color: color ? color.body_main : ''}">
        <slot name="title"></slot>
      </div>
      <div class="rastar-filter" :style="{color: color ? color.page_import : ''}">
        <slot class="filter" name="filter"></slot>
      </div>
      <slot></slot>
    </div>
    <div :style="{background : color?color.bg_supply:''}" v-else class="header-content">
      <div v-if="back" class="rastar-back" @click="goBack" :style="{color: color ? color.body_main : ''}">
        <i class="icon left"></i>
      </div>
      <div v-else class="rastar-back">
        <slot name="back"></slot>
      </div>
      <div class="rastar-title" :style="{color: color ? color.body_main : ''}">
        <slot name="title"></slot>
      </div>
      <div class="rastar-filter" :style="{color: color ? color.page_import : ''}">
        <slot class="filter" name="filter"></slot>
      </div>
      <slot></slot>
    </div>
  </header>
</template>

<script>
  export default {
    name: 'rastarHeader',
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
