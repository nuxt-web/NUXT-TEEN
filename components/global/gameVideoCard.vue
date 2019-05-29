<template>
    <div>
        <div class="game-active-title">
            <div class="label"><img src="./../../static/images/label.png" alt=""></div>
            <p class="title-name">{{game.name}} ---- 最新预告片</p>
        </div>
        <div class="game-card" :style="{background: ''}">
        <div class="game-card-video">
            <teen-video-player :border="true" :source="game.video.video_url" :poster="game.video.video_img" :game_name="game.name"></teen-video-player>
        </div>
        <div class="game-card-des video-des">
            <div class="game-card-img img-loading" @click="goGameDetail(game.app_id, 0)">
                <img :src="game.icon_url">
            </div>
            <div class="game-card-info" @click="goGameDetail(game.app_id, 1)">
                <p class="title">{{game.name}}</p>
                <div class="des">
                    <p>月球探测器在月亮上捕捉到了白影，大雄认为这道白影是月亮上的兔子，惹来了大家的耻笑，于是哆啦A 梦为了帮助大雄，利用道具“异说俱乐部徽章”，在月球背面制造了一个兔子王国。一天，神秘少年露卡转学而来，与大雄</p>
                </div>
            </div>
            <!-- <div class="game-card-oper">
                <rastar-btns :btns="game" :color="game.color_conf" @appointment="openAppointment(game.app_id)"></rastar-btns>
            </div> -->
        </div>
    </div>
    </div>
    
</template>

<script>
    // import RastarBtns from './global/btnGroup.vue'
    import TeenVideoPlayer from './videoBox.vue'

    export default {
        name: 'GameVideoCard',
        props: ['game'],
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
            }
        }
    }
</script>

<style lang="scss" src="./../../assets/css/components/global/gameVideoCard.scss"></style>