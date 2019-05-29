<template>
    <div>
        <div v-for="item in replyList">
            <div class="reply-item">
                <div class="reply-user">
                    <img class="avatar-img" :src="item.avator" alt="">
                    <div class="user-info">
                        <p class="name">{{item.user_name}}</p>
                        <p class="time">{{ transformDate(item.create_tm) }}</p>
                    </div>
                    <!-- <div class="like">
                        <i class="icon like"></i>
                    </div> -->
                </div>
                <div class="reply-content">
                    {{item.content}}
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['replyList'],
    methods: {
        showReply () {
            console.log('hhhh')
            this.$emit('showReply', '')
        },
        transformDate (date) {
            // return new Date(date)
            let da = new Date(parseInt(date))
            let year = da.getFullYear()
            let month = da.getMonth()
            let day = da.getDate()

            let hour = ('0' + da.getHours()).slice(-2)
            let minute = ('0' + da.getMinutes()).slice(-2)
            let second = ('0' + da.getSeconds()).slice(-2)

            return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/replyItem.scss" scoped>

</style>
