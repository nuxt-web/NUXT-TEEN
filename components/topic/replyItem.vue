<template>
    <div class="reply-item" @click="showReply">
        <div class="reply-user">
            <img class="avatar-img" src="../../static/images/avatar.jpg" alt="">
            <div class="user-info">
                <p class="name">血小板</p>
                <p class="time">44分钟前</p>
            </div>
            <div class="like">
                <i class="icon like"></i>
            </div>
        </div>
        <div class="reply-content">
            我也觉得好听
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
<style lang="scss" src="../../assets/css/components/topic/replyItem.scss" scoped>

</style>
