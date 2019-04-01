<template>
    <div class="items">
        <div class="item" v-for="i in 6" @click="goPage">
            <div class="mask">
                <p class="name">肖申克的救赎</p>
                <p class="tip">5256人参与</p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    methods: {
        goPage () {
            this.$router.push({
                name: 'topic-detail'
            })
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/item.scss" scoped></style>
