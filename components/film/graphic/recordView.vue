<template>
    <div class="record-view">
        <div class="record-title">
            上次看到
        </div>
        <div class="progress">
            <span class="progress-text" :style="{'left': proWidth}">{{Math.round(progress)}}%</span>
            <div class="all-progress">
                <div class="current-progress" :style="{'width': proWidth}">
                    <div class="full-progress"></div>
                </div>
            </div>
            <!-- <p class="button">继续浏览</p> -->
        </div>
    </div>
</template>
<script>
export default {
    props: {
        progress: {
            default: 0
        }
    },
    data () {
        return {
            proWidth: '',
            proLeft: '100px'
        }
    },
    methods: {

    },
    mounted () {
            console.log('hhhhh')
            let _this = this
            setTimeout(() => {
                _this.proWidth = parseFloat(_this.progress) / 100 * 17 + 'rem';
                // this.proWidth = 80/100 * 17 + 'rem';
            }, 600)
            // this.proWidth = 80/100 * 17 + 'rem';
            // console.log(this.progress, 'progress-----------')
    }
}
</script>
<style lang="scss">
@import '../../../assets/css/common/variable';
.record-view {
    width: 100%;
    // padding: .5rem;
    font-size: .75rem;
    .record-title {
        padding: .5rem;
        border-bottom: 1px solid #cccccc;
    }
    .progress {
        padding: 1rem .5rem;
        // width: 100%;
        // height: .5rem;
        // border: 1px solid #cccccc;
        // position: relative;
        .progress-text {
            color: $color-primary;
            font-size: .7rem;
            left: 0;
            position: relative;
            transition: left 2s;
        }
        .all-progress {
            width: 17rem;
            height: 1rem;
            border: 1px solid $color-primary;
            border-radius: 1rem;
            position: relative;
        }
        .current-progress {
            padding: 0;
            margin: 0;
            position: absolute;
            width: 0;
            height: 1rem;
            top: 0;
            left: 0;
            overflow: hidden;
            // background: #cccccc;
            // border-radius: 1rem;
            transition: width 2s;
            .full-progress {
                 width: 17rem;
                 height: 1rem;
                 border-radius: 1rem;
                //  background: #cccccc;
                background: $color-primary;
            }
        }
        .button {
            text-align: right;
            // line-height: 1.5rem;
            margin-top: .7rem;
            font-size: .75rem;
            color: $color-primary;
        }
    }
}
</style>
