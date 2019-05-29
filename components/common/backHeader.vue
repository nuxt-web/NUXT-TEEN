<template>
    <div class="title-holder">
        <p class="back" @click="goBack">
            <i class="icon back"></i>
        </p>
        <p class="title">
            <!-- 4条回复 -->
            {{backTitle}}
        </p>
        <p class="right-btn">
            <slot name="right"></slot>
        </p>
    </div>
</template>
<script>
export default {
    props: {
        backTitle: {
            default: ''
        },
        selfBack: {
            default: false
        }
    },
    // props: ['backTitle', 'selfBack'],
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
<style lang="scss" src="../../assets/css/components/common/backHeader.scss">

</style>
