# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#category").change ->
    console.log('cate')
    $("#category_filter").submit()

  $("#page_limit").change ->
    console.log('page form')
    $("#page_limit_form").submit()
