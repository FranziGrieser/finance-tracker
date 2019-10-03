$(document).on "turbolinks:load", ->
  $('.alert-primary').delay(2500).slideUp 500, ->
    $('.alert').alert 'close'
  $('.alert-danger').delay(2500).slideUp 500, ->
    $('.alert').alert 'close'
