const pkg = require('./package')


module.exports = {
  mode: 'universal',

  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: [
    'element-ui/lib/theme-chalk/index.css',
    {
      src: '~assets/css/style.scss',
      lang: 'scss'
    },
    { src: "swiper/dist/css/swiper.css" }
  ],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
    '@/plugins/element-ui',
    {
      src: '~/plugins/vue-scroller.js',
      ssr: false
    },
    {
      src: '~/plugins/vue-awesome-swiper.js',
      ssr: false
    },
    {
      src: '~/plugins/vue-video-player.js',
      ssr: false
    },
    {
      src: '~/plugins/axios.js',
      ssr: true
    },
    {
      src: '~/plugins/tools.js',
      ssr: false
    }
  ],

  /*
  ** Nuxt.js modules
  */
  modules: [
  ],

  /*
  ** Build configuration
  */
  build: {
    transpile: [/^element-ui/],

    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {

    }
  }
}
