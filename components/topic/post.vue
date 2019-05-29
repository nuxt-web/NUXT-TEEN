<template>
    <div>
        <div class="post-holder" v-for="item in postList">
            <div class="post">
                <div class="user">
                    <!-- <img class="avatar" src="../../static/images/avatar.jpg" alt=""> -->
                    <img class="avatar" :src="item.avator" alt="">
                    <div class="post-owner">
                        <p class="name">{{ item.user_name }}</p>
                        <p class="time">{{ transformDate(item.create_tm) }}</p>
                    </div>
                    <!-- <div class="like" v-if="parseInt(postType) === 2">
                        <i class="icon like"></i>
                    </div> -->
                </div>
                <div class="content">
                    <!-- 夏目友人帐的主题曲都好好听啊！ -->
                    {{ item.content }}
                </div>
                <div class="post-img" v-if="item.img_list">
                    <div class="img" v-for="i in item.img_list.split(',')">
                        <div class="item">
                            <img class="item-img" :src="i">
                        </div>
                    </div>
                </div>
                <!-- <div class="label">
                    夏目友人帐
                </div> -->
                <div class="other" v-if="parseInt(postType) === 1">
                    <!-- <div class="like">
                        <i class="icon like"></i>
                        <div class="circle"></div>
                    </div> -->
                    <div class="reply" @click="goPage(item.id)">
                        <i class="icon reply"></i>
                        <span class="num">{{item.reply_num}}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</template>
<script>
export default {
    props: ['postType', 'postList'],
    methods: {
        goPage (id) {
            console.log('hhh')
            this.$router.push({
                // name: 'topic-replyDetail',
                name: 'topic-replyDetails-id',
                params: {id}
            })
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
<style lang="scss" src="../../assets/css/components/topic/post.scss" scoped>

</style>
