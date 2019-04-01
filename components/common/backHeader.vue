<template>
    <div class="title-holder">
        <p class="back" @click="goBack">
            <i class="icon back"></i>
        </p>
        <p class="title">
            4条回复
        </p>
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
<style lang="scss" src="../../assets/css/components/common/backHeader.scss">

</style>
