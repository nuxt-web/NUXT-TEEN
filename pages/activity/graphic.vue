<template>
    <div>
        <!-- <film-header></film-header> -->
        <div class="page-main">
            <graphic-item></graphic-item>
        </div>
        
    </div>
</template>
<script>
import GraphicItem from '../../components/film/graphic/item'
import TeenScroller from '../../components/global/scroller'
export default {
    components: {
        GraphicItem,
        TeenScroller
    }
}
</script>
<style lang="scss" scoped>
.page-main {
    padding: 4.8rem 0 2.4rem;
}
</style>
