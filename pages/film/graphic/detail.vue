<template>
    <div class="graphic-detail" ref="detail">
        <!-- <graphic-header></graphic-header> -->
        <!-- <graphic-header></graphic-header> -->
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
                v-model="value10"
                >
            </el-slider>
        </div>
        
    </div>
</template>
<script>
import GraphicHeader from '../../../components/film/graphic/header'
import GraphicProgress from '../../../components/film/graphic/progress'
export default {
    components: {
        GraphicHeader,
        GraphicProgress
    },
    data () {
        return {
            value10: 10
        }
    },
    methods: {

    },
    watch: {
        value10 (val) {
            let scHeight = this.$refs.detail.scrollHeight
            let clHeight = this.$refs.detail.clientHeight
            // document.body.scrollTop = val * 100
            console.log(this.$refs.detail.scrollTop, val)
            console.log(document.body, 'hhh')
            // this.$refs.detail.scrollHeight = 
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
