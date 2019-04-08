<template>
    <div>
        <div class="item" v-for="i in 6" @click="goPage">
            <img class="img" src="../../../static/images/graphic.jpeg" alt="">
            <div class="mask">
                <div class="info">
                    <i class="icon like">
                        <span class="num">7.4k</span>
                    </i>
                    <i class="icon view">
                        <span class="num">10k</span>
                    </i>
                </div>
                <p class="text">流浪地球 -- by 蛋炒饭</p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    methods: {
        goPage () {
            this.$router.push({
                name: 'activity-graphic-detail'
            })
        }
    }
}
</script>
<style lang="scss" scoped>
    .item {
        width: 90%;
        height: 9rem;
        overflow: hidden;
        margin: 1rem auto 0;
        border-radius: .3rem;
        position: relative;
        .img { 
            width: 100%;
        }
        .mask {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height:100%;
            background: rgba(0, 0, 0, .3);
            color: #ffffff;
            font-size: .75rem;
            .info {
                width: 100%;
                padding: .5rem;
                display: flex;
                justify-content: space-between;
                // font-size: .75rem;
                .num {
                    padding: 0 .2rem;
                    font-size: .6rem;
                }
            }
            .text {
                position: absolute;
                bottom: .5rem;
                left: .5rem;
            }
            // .view {
            //     font-size: .75rem;
            //     color: #ffffff;
            //     position: absolute;
            //     right: .5rem;
            //     top: .5rem;
            // }
        }
    }
</style>
