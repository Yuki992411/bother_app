# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.comment__accordion > p').on 'click', ->
    $(@).next('div').slideToggle()
    $(@).children('i').toggleClass 'bi-chevron-compact-up'

$(document).on 'turbolinks:load', ->
  $('.p-comment__list').find('.p-comment__item').each((comment_i, comment_el) ->
    acum = 0;
    $(comment_el).children('.comment__body').children('p').each((p_i, p_el) ->
      acum += $(p_el).outerHeight(true)
    )
    # 全pタグのheight(+margin)が閾値以下→read__moreを無効
    if acum <= 160
      $(comment_el).children('.p-comment__bottomLine').children('.read__more').removeAttr('class');
  )

$(document).on 'turbolinks:load', ->
  $('.read__more').on 'click', ->
    $(@).toggleClass 'bi-chevron-double-up'
    selected_comment = $(@).closest('.p-comment__item')
    selected_comment.children('.comment__body').toggleClass 'comment__body__nodisplay'
    selected_comment.children('.comment__body__detail').slideToggle()
