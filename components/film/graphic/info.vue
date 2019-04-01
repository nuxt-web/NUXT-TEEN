<template>
    <div>
        <div class="graphic-info">
            <img class="cover" src="../../../static/images/film-cover.jpg" alt="电影封面">
            <div class="info">
                <div class="item">
                    <i class="icon author circle"></i>
                    <span class="text">蛋炒饭</span>
                </div>
                <div class="item">
                    <i class="icon label circle"></i>
                    <span class="text">动漫 热血</span>
                </div>
                <div class="item">
                    <i class="icon heat circle"></i>
                    <span class="text">人气 1852304</span>
                </div>
                <div class="item">
                    <i class="icon like circle"></i>
                    <span class="text">喜欢 214022</span>
                </div>
                <p class="read-btn">
                    开始阅读
                </p>
            </div>
        </div>
        <p class="graphic-intro">
            　　继《海贼王》、《火影忍者》、《死神》三大巨作后，日本第一漫画刊《周刊少年JUMP》近十年力推巨作，《我的英雄学院》创造了一系列绝佳成绩，引人注目。这个讲述大多数人都有超能力的未来，一个毫无能力的少年如何成为英雄的故事，在日本、美国、中国等地引发绝佳成绩和好评。作为该作首部剧场版，在海外取得令人称道的成绩和好评，以主角绿谷出久与师傅欧鲁迈特联手对敌的新故事，讲述了一个简单又热血激昂的青春战斗故事，传承少年热血漫传统的同时，大胆创新、场面激烈、有笑有泪，令人侧目。
        </p>
    </div>
</template>
<script>
export default {
    
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
    height: 2rem;
    line-height: 1rem;
    overflow: hidden;
    width: 100%;
    box-sizing: border-box;
    padding: 0 10px;
    display: -webkit-box;
    word-break: break-all;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    font-size: .75rem;
}
</style>

