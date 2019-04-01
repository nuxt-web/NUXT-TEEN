<template>
<div>
    <topic></topic>
    <item></item>
    <list></list>
</div> 
</template>
<script>
import Topic from '../../components/topic/title.vue'
import Item from '../../components/topic/item.vue'
import List from '../../components/topic/list.vue'
export default {
    components: {
        Topic,
        Item,
        List
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>
