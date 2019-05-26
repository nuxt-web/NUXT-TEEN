<template>
    <main id="Protocol" v-if="showEl">
        <rastar-header back=true>
            <p class="title" slot="title">我的头像</p>
        </rastar-header>
        <section class="page-wrapper my-head">
            <rastar-scroller padding='2.4rem'>
                <div class="my-head-list">
                    <div class="head-img" v-for="(img, index) in headImgs" :key='index' @click="checkImg(index,img.avatar)" :class="{active: currentImg == index}">
                        <img :src="img.avatar">
                    </div>
                </div>
                <div class="me-btn"> 
                    <div class="btn" @click="saveHead">保存</div>
                </div>
            </rastar-scroller>
        </section>
    </main>
</template>

<script>
    import qs from 'qs'
    import RastarHeader from './../../components/global/header.vue'
    import RastarScroller from './../../components/global/teenScroller.vue'
    import api from "../../model/api.js"

    export default {
        name: 'mePage',
        components: {
            RastarHeader,
            RastarScroller
        },
        data: function () {
            return {
                // ui控制
                showEl: true,
                // model数据
                userInfo: {},
                headImgs: [
                    {isvip: 0, avatar: "http://mydatabase.com/user/A1.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/A2.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/A3.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/B1.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/B2.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/C1.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/C2.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/C3.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/D1.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/D2.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/E1.png"},
                    {isvip: 0, avatar: "http://mydatabase.com/user/E2.png"}
                ],
                currentImg: -1,
                uid: '',
                avatar: ''
            }
        },
        methods: {
            // 选择头像
            checkImg: function (index,avatar) {
                if (index === this.currentImg) {
                    return
                }
                this.headImgs.map((img, i) => {
                    if (index === i) {
                        img.checked = true
                        this.currentImg = i
                    } else {
                        img.checked = false
                    }
                })
                this.showEl = false
                this.$nextTick(() => {
                    this.showEl = true
                })

                this.avatar = avatar
            },
            // 保存头像
            saveHead: function () {
                this.$ajax.get(api.setAvatar,{
                        params: {
                            uid: this.uid,
                            avatar: this.avatar
                        }
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$router.back()
                        }
                    }).catch((err) => {
                        // this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
                        console.log(err)
                    })
            }
        },
        mounted: function () {
            // this.getUserHead()
            this.uid = this.$tools.getCookie('_TEEN_')
        }
    }
</script>

<style lang="scss" src="./../../assets/css/views/mine/meHead.scss" scoped></style>