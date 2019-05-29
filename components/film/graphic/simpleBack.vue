<template>
    <div class="back-header" @click="goBack">
        <i class="icon back"></i>
    </div>
</template>
<script>
export default {
    props: {
        selfBack: {
            default: false
        }
    },
    methods: {
        goBack () {
            if (this.selfBack) {
                this.$emit('goBack')
            } else {
                this.$router.back()
            }
        }
    }
}
</script>
<style lang="scss">
.back-header {
    position: fixed;
    top: 1rem;
    left: .5rem;;
    width: 1.5rem;
    height: 1.5rem;
    background: rgba(0, 0, 0, .5);
    z-index: 999;
    text-align: center;
    line-height: 1.5rem;
    color: #ffffff;
    font-size: .75rem;
}
</style>
