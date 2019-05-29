<template>
    <div class="items">
        <div class="item" v-for="item in itemList" @click="goPage(item.id)">
            <img class="img" :src="item.img" alt="">
            <div class="mask">
                <p class="name">{{ item['name'] }}</p>
                <!-- <p class="tip">{{ item['attention_num'] }}</p> -->
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        itemList: {
            default: []
        }
    },
    methods: {
        goPage (id) {
            // console.log(id)
            this.$router.push({ name: 'topic-id',params: { id}})
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/item.scss" scoped></style>
