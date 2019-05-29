<template>
    <div class="content">
        <img class="movie" :src="detail.img" alt="">
        <div class="info">
            <p class="back" @click="goBack"><i class="icon back"></i></p>
            <p class="title">#{{detail.name}}</p>
            <!-- <div class="disc">
                <div class="avatar" v-for="i in 6">
                    <img class="per-avatar" src="./../../static//images//avatar.jpg" alt="">
                </div>
                <div class="text">
                    {{detail.attention_num}}人关注
                </div>
            </div> -->
            <!-- <div class="focus">
                关注
            </div> -->
        </div>
    </div>
</template>
<script>
export default {
    props: ['detail'],
    methods: {
        goBack () {
            // this.$router.back()
            this.$router.push({
                name: 'activity'
            })
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/content.scss" scoped="scoped"></style>