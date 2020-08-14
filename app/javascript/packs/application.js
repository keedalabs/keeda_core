// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
import "bootstrap"
import "../../assets/stylesheets/application.scss"
import './bootstrap_custom.js'
import 'jquery'
require('packs/social-share-button.js.erb')
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"

const ready = () => $('.ckeditor').each(function() {
    return CKEDITOR.replace($(this).attr('id'));
});

$(document).ready(ready);
$(document).on('page:load', ready);

window.initMap = function(...args) {
    console.log("I am called again")
    const event = document.createEvent("Events")
    event.initEvent("google-maps-callback", true, true)
    event.args = args
    window.dispatchEvent(event)
}

import CookiesEuBanner from 'cookies-eu-banner'
import 'cookies-eu-banner/css/cookies-eu-banner.default.css'

document.addEventListener('DOMContentLoaded', () => {
    new CookiesEuBanner(() => {
        console.log('Cookies EU Banner accepted')
    })
})

import LocalTime from "local-time"
LocalTime.start()