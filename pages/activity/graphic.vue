<template>
    <div>
        <!-- <film-header></film-header> -->
        <div class="page-main">
            <graphic-item :graphicList="graphicList"></graphic-item>
        </div>
    </div>
</template>
<script>
import GraphicItem from '../../components/film/graphic/item'
import TeenScroller from '../../components/global/scroller'
import API from '../../model/api'
import { getFetch } from '../../model/request'
export default {
    data () {
        return {
            graphicList: []
        }
    },
    components: {
        GraphicItem,
        TeenScroller
    },
    methods: {
        async getGraphicList () {
            let res = await getFetch(API.getGraphicList)
            if (res.data.code === 200) {
                this.graphicList = res.data.data
                console.log(this.graphicList, 'graphicList')
            }
        }
    },
    created () {
        console.log('hhhhhhhhhhh')
        this.getGraphicList()
    }
}
</script>
<style lang="scss" scoped>
.page-main {
    padding: 4.8rem 0 2.4rem;
}
</style>
