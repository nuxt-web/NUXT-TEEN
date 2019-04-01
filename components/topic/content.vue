<template>
    <div class="content">
        <img class="movie" src="./../../static/images/topic.jpg" alt="">
        <div class="info">
            <p class="back" @click="goBack"><i class="icon back"></i></p>
            <p class="title">#流浪地球细节</p>
            <div class="disc">
                <div class="avatar" v-for="i in 6">
                    <img class="per-avatar" src="./../../static//images//avatar.jpg" alt="">
                </div>
                <div class="text">
                    100人关注
                </div>
            </div>
            <div class="focus">
                关注
            </div>
        </div>
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
<style lang="scss" src="../../assets/css/components/topic/content.scss" scoped="scoped"></style>