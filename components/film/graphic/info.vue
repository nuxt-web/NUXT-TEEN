<template>
    <div>
        <div class="graphic-info">
            <img class="cover" :src="detail.detail_img" alt="电影封面">
            <div class="info">
                <!-- <div class="item">
                    <i class="icon author circle"></i>
                    <span class="text">蛋炒饭</span>
                </div> -->
                <div class="item">
                    <i class="icon label circle"></i>
                    <span class="text">{{detail.label}}</span>
                </div>
                <!-- <div class="item">
                    <i class="icon heat circle"></i>
                    <span class="text">人气 1852304</span>
                </div>
                <div class="item">
                    <i class="icon like circle"></i>
                    <span class="text">喜欢 214022</span>
                </div> -->
                <p class="read-btn" @click="goPage">
                    开始阅读
                </p>
            </div>
        </div>
        <div class="graphic-intro"  v-if="isLimit">
            <p v-html="infoLimit"></p>
            <i class="icon pull" @click="showIntro"></i>
        </div>
        <div class="graphic-intro" v-else>
            <p v-html="detail.info"></p>
            <i class="icon up" @click="showIntro"></i>
        </div>
        <!-- <p class="graphic-intro" v-html="introLimit">
        </p> -->
    </div>
</template>
<script>
export default {
    props: {
        detail: {
            type: Object,
            default: function () {
                return {}
            }
        }
    },
    data () {
        return {
            isLimit: true,
            limitNum: 40,
            intro: '继《海贼王》、《火影忍者》、《死神》三大巨作后，日本第一漫画刊《周刊少年JUMP》近十年力推巨作，《我的英雄学院》创造了一系列绝佳成绩，引人注目。这个讲述大多数人都有超能力的未来，一个毫无能力的少年如何成为英雄的故事，在日本、美国、中国等地引发绝佳成绩和好评。作为该作首部剧场版，在海外取得令人称道的成绩和好评，以主角绿谷出久与师傅欧鲁迈特联手对敌的新故事，讲述了一个简单又热血激昂的青春战斗故事，传承少年热血漫传统的同时，大胆创新、场面激烈、有笑有泪，令人侧目。'
        }
    },
    methods: {
        showIntro () {
            this.isLimit = !this.isLimit
        },
        goPage () {
            console.log('page')
            let _this = this
            this.$router.push({
                // name: 'graphic-detail'
                name: 'graphic-details-id',
                params: {
                    id: _this.detail.id
                }
            })
        }
    },
    computed: {
        infoLimit () {
            if (this.detail.info) {
                return this.detail.info.slice(0, this.limitNum) + '...'
            }
            // return '...'
        }
    }
}
</script>
<style lang="scss">
@import '../../../assets/css/common/variable';
.graphic-info {
    padding: 0 1rem;
    width: 100%;
    height: 8rem;
    background: #cccccc;
    display: flex;
    align-items: center;
    .cover {
        width: 4.5rem;
        border-radius: .2rem;
    }
    .info {
        margin-left: .8rem;
        .item {
            margin-bottom: .5rem;
            font-size: .75rem;
        }
        .circle {
            background: $color-primary;
            padding: .2rem;
            font-size: .75rem;
            border-radius: 50%;
            color: #ffffff;
        }
        .read-btn {
            display: inline-block;
            padding: .2rem .3rem;
            background: $color-primary;
            border-radius: .2rem;
            font-size: .75rem;
            color: #ffffff;
        }
    }
}
// p {
//     font-size: .75rem;
//     position: relative;
//     line-height: 1rem;
//     height: 2rem;
//     overflow: hidden;
// }
// p:after {
//     content: '...';
//     position: absolute;
//     bottom: 0;
//     right: 0;
// }
.graphic-intro {
    padding: .5rem;
    // height: 3rem;
    line-height: 1rem;
    overflow: hidden;
    width: 100%;
    box-sizing: border-box;
    // padding: 0 10px;
    font-size: .75rem;
    border-bottom: 1px solid #cccccc;
    position: relative;
    .icon {
        position: absolute;
        bottom: 0;
        right: .5rem;
        font-size: 1rem;
        color: #505050;
    }
}
</style>

