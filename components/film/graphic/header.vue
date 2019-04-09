<template>
    <div class="header">
        <i class="icon back" @click="goBack"></i>
        <p class="text">流浪地球</p>
    </div>
</template>
<script>
export default {
    methods: {
        goBack () {
            this.$router.back()
        }
    }
}
</script>
<style lang="scss">
@import '../../../assets/css/common/variable';
.header {
    width: 100%;
    height: 2rem;
    background: $color-primary;
    display: flex;
    align-items: center;
    position: relative;
    padding: 0 .5rem;
    font-size: .75rem;
    .icon {
        font-size: 1rem;
    }
    .text {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
}
   
</style>
