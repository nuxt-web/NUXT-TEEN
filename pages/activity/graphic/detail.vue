<template ref="detail">
    <div>
        <graphic-back></graphic-back>
        <graphic-detail></graphic-detail>
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
import GraphicDetail from '../../../components/film/graphic/detail'
export default {
    components: {
        GraphicBack,
        GraphicHeader,
        GraphicProgress,
        GraphicDetail
    },
    data () {
        return {
            progressValue: 0,
            proValue: 0
        }
    },
    methods: {
        scroll () {
            console.log('scroll')
        }
    },
    watch: {
        progressValue (val) {
            let scHeight = document.documentElement.scrollHeight
            let clHeight = document.documentElement.clientHeight
            this.$nextTick(() => {
                // console.log(this.$refs.detail.scrollTop, 'hhhh')
                document.documentElement.scrollTop = val/100 * scHeight
            }, false)
        }
    },
    mounted () {
        // console.log('hhhhhhhhh')
        let _this = this
        this.$nextTick(() => {
            // 详情高度, 滚动条位置
            let scHeight, scTop
            function loadEvent () {    
                scHeight = document.documentElement.scrollHeight
                scTop = document.documentElement.scrollTop              
                _this.progressValue = scTop/scHeight * 100
                console.log(_this.progressValue)
            }
            window.addEventListener('scroll', loadEvent, true);
        }, false)
        
    }
}
</script>
<style lang="scss">
// body {
//     height: auto;
// }
  .progress {
        width: 10rem;
        height: 10px;
        position: fixed;
        bottom: 1.5rem;
        left: 50%;
        transform: translateX(-50%);
    }
</style>
