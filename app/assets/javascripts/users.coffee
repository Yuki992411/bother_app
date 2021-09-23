# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.jumbotron').closest('body').css 'background-image', 'url()'
  $('.jumbotron').closest('.page__base').toggleClass 'page__base'

  $('.new__form').closest('body').css 'background-image', 'url()'
  $('.new__form').closest('.page__base').toggleClass 'page__base'
