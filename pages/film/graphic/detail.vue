<template>
    <div class="graphic-detail" ref="detail">
        <!-- <graphic-header></graphic-header> -->
        <!-- <graphic-header></graphic-header> -->
        <graphic-back></graphic-back>
        <img class="image" src="../../../static/images/graphic/1.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/2.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/3.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/4.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/5.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/6.jpg" alt="">
        <img class="image" src="../../../static/images/graphic/7.jpg" alt="">
        <!-- <graphic-progress></graphic-progress> -->
        <div class="progress">
            <el-slider
                v-model="progressValue"
                >
            </el-slider>
        </div>
        
    </div>
</template>
<script>
import GraphicBack from '../../../components/film/graphic/simpleBack'
import GraphicHeader from '../../../components/film/graphic/header'
import GraphicProgress from '../../../components/film/graphic/progress'
export default {
    components: {
        GraphicBack,
        GraphicHeader,
        GraphicProgress
    },
    data () {
        return {
            progressValue: 0
        }
    },
    methods: {
    },
    watch: {
        progressValue (val) {
            let scHeight = document.documentElement.scrollHeight
            let clHeight = document.documentElement.clientHeight
            // this.$refs.detail.scrollTop = val/100 * scHeight
            // console.log(this.$refs.detail.scrollTop, 'hhhh')
            document.documentElement.scrollTop = val/100 * scHeight
            console.log(document.documentElement.scrollTop, 'hhhh')
        }
    }
}
</script>
<style lang="scss">
body {
    height: auto;
}
.graphic-detail {
    width: 100%;
    overflow: auto;
    .image {
        width: 100%;
    }
    .progress {
        width: 10rem;
        height: 10px;
        position: fixed;
        bottom: 1rem;
        left: 50%;
        transform: translateX(-50%);
    }
}

</style>
