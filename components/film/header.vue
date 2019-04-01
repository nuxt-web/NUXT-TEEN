<template>
    <div class="header">
        <i class="icon back"></i>
        <div class="center">
            <p class="title">电影</p>
            <p class="separate"></p>
            <p class="title">图解</p>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss">
@import '../../assets/css/common/variable';
.header {
    width: 100%;
    height: 2rem;
    background: $color-primary;
    display: flex;
    align-items: center;
    position: relative;
    padding: 0 .5rem;
    .icon {
        font-size: 1rem;
    }
    .center {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        font-size: .75rem;
        .title {
            padding: 0 .5rem;
        }
        .separate {
            height: .9rem;
            border-right: 1px solid $color-text-primary;
        }
    }
}
</style>
