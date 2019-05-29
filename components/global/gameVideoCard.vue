<template>
    <div>
        <div class="game-active-title">
            <div class="label"><img src="./../../static/images/label.png" alt=""></div>
            <p class="title-name">{{movie.movie_name}} ---- 最新预告片</p>
        </div>
        <div class="game-card" :style="{background: ''}">
        <div class="game-card-video">
            <teen-video-player :border="true" :source="movie.trailer" :poster="movie.video_img" :game_name="movie.movie_name"></teen-video-player>
        </div>
        <div class="game-card-des video-des">
            <div class="game-card-img img-loading" @click="expansion(movie.img_url)">
                <img :src="movie.img_url">
            </div>
            <div class="game-card-info" @click="goGameDetail(gamovieme.app_id, 1)">
                <p class="title">{{movie.movie_name}}</p>
                <div class="des">
                    <p>{{movie.movie_des}}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="img-mask">
        <img src="" alt="">
    </div>
    </div>
    
</template>

<script>
    // import RastarBtns from './global/btnGroup.vue'
    import TeenVideoPlayer from './videoBox.vue'
    export default {
        name: 'GameVideoCard',
        props: ['movie'],
        components: {
            // RastarBtns,
            TeenVideoPlayer
        },
        methods: {
            // 打开预约弹窗
            openAppointment: function (id) {
                // this.$store.dispatch('changeAppointmentState', true)
                // this.$router.push({ name: 'gameDetail', params: { appId: id } })
                console.log(6666)
            },
            // 去往游戏详情
            goGameDetail: function (id, type) {
                // this.$router.push({ name: 'gameDetail', params: { appId: id } })
                console.log(77777)
            },
            expansion: function (url) {
                this.$emit('expansion',url)
            }
        }
    }
</script>

<style lang="scss" src="./../../assets/css/components/global/gameVideoCard.scss"></style>