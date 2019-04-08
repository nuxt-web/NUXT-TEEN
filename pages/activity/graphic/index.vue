<template>
    <div>
        <!-- <film-header></film-header> -->
        <div class="page-main">
            <graphic-item></graphic-item>
        </div>
        
    </div>
</template>
<script>
// import FilmHeader from '../../../components/film/header'
import GraphicItem from '../../../components/film/graphic/item'
export default {
    components: {
        GraphicItem
    }
}
</script>
<style lang="scss" scoped>
.page-main {
    padding: 4.8rem 0 2.4rem;
}
</style>
