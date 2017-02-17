$(document).on 'turbolinks:load', ->
  navbar = $('.navbar ul')

  path = window.location.pathname
  navbar.find("[href$='#{path}']").parent().addClass('active')
