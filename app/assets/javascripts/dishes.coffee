# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#dish_remote_picture_url').on 'paste', (event) ->
    setTimeout ->
      newUrl = $(event.target).val()
      $('#dish_new_picture').attr('src', newUrl)
    , 100