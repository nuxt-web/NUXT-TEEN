<template>
    <div class="filter">
        <div class="title">
            按热度选择
        </div>
        <div class="type" @click="showFilter">
            筛选
            <i class="icon pull"></i>
        </div>
        <!-- <div class="mask" v-if="isShow"> -->
            <div class="filter-options" v-if="isShow">
                <div :class="['option', {active: parseInt(selectedIndex) === index}]" v-for="(item, index) in options" :key="index" :data-index="index" @click="checkType">
                    按热度选择
                    <i v-if="parseInt(selectedIndex) === index" class="icon select"></i>
                </div>
            </div>
        <!-- </div> -->
    </div>
</template>
<script>
export default {
    data () {
        return {
            options: ['按热度排序', '按时间排序'],
            selectedIndex: 0,
            isShow: false
        }
    },
    methods: {
        showFilter () {
            this.isShow = !this.isShow
            // if (this.isShow) {
            //     this.$store.dispatch('changeMaskState', true)
            // } else {
            //     this.$store.dispatch('changeMaskState', false)
            // }
        },
        checkType (e) {
            console.log('hhh')
            console.log(e.currentTarget.dataset.index, 'e')
            this.selectedIndex = e.currentTarget.dataset.index
            this.isShow = false
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/filter.scss" scoped>

</style>
