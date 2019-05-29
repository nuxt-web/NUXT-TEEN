<template>
    <div class="dialog-mask" data-type="mask" @click="close" @touchmove.prevent>
        <div class="dialog">
            <div class="dialog-header">
                <slot name="title"></slot>
            </div>
            <div class="dialog-body">
                <slot name="body"></slot>
            </div>
            <div class="dialog-footer">
                <slot name="footer"></slot>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'dialogMask',
        methods: {
            close: function (e) {
                let type = e.target.dataset.type
                if (type === 'mask') {
                    this.$emit('close')
                }
            }
        }
    }
</script>

<style lang="scss" src="../../assets/css/components/global/dialog.scss">

</style>