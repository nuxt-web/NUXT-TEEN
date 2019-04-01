<template>
    <div class="mask" v-if="maskState">
    </div>
</template>
<script>
export default {
    computed: {
        maskState: () => {
            // return this.$store.state.maskState
            return false
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/common/commonMask.scss">

</style>


