<template>
    <div>
        <div class="post-holder" v-for="item in postList">
            <div class="post">
                <div class="user">
                    <!-- <img class="avatar" src="../../static/images/avatar.jpg" alt=""> -->
                    <img class="avatar" :src="item.avator" alt="">
                    <div class="post-owner">
                        <p class="name">{{ item.user_name }}</p>
                        <p class="time">44分钟前</p>
                    </div>
                    <div class="like" v-if="parseInt(postType) === 2">
                        <i class="icon like"></i>
                    </div>
                </div>
                <div class="content">
                    <!-- 夏目友人帐的主题曲都好好听啊！ -->
                    {{ item.content }}
                </div>
                <!-- <div class="label">
                    夏目友人帐
                </div> -->
                <div class="other" v-if="parseInt(postType) === 1">
                    <div class="like">
                        <i class="icon like"></i>
                        <div class="circle"></div>
                    </div>
                    <div class="reply" @click="goPage">
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
        goPage () {
            console.log('hhh')
            this.$router.push({
                name: 'topic-replyDetail'
            })
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/post.scss" scoped>

</style>
