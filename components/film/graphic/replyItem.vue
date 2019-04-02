<template>
    <div class="reply-item" @click="showReply">
        <div class="reply-user">
            <img class="avatar-img" src="../../../static/images/avatar.jpg" alt="">
            <div class="user-info">
                <p class="name">血小板</p>
            </div>
            <div class="like">
                <i class="icon like"></i>
            </div>
        </div>
        <div class="reply-content">
            我也觉得好听
        </div>
        <div class="reply-time">
            4分钟前
        </div>
    </div>
</template>
<script>
export default {
    methods: {
        showReply () {
            console.log('hhhh')
            this.$emit('showReply', '')
        }
    }
}
</script>
<style lang="scss" src="../../../assets/css/components/film/graphic/replyItem.scss" scoped>

</style>
