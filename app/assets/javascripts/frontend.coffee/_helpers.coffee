((document, location, $, ProJ) ->
  'use strict'

  ProJ.fn ?= {}


  ProJ.fn.submit = ->
    $('[data-submit]').on 'change', ->
      if @dataset.submit
        document.querySelector(@dataset.submit).submit()
      else
        @parentNode.submit()
    @


  ProJ.fn.scroll = ->
    if screen.width > 767
      $navbar = $ '.pro-navbar'
      fix = $navbar.find '.collapse'
      fix = fix.hasClass('collapsing') or fix.hasClass('in')
      cls = 'pro-navbar--fixed'
      if $(window).scrollTop() > 96
        if not $navbar.hasClass cls
          if fix
            $navbar.addClass cls
          else
            $navbar.hide ->
              $navbar
                .addClass cls
                .slideDown 200
      else
        if $navbar.hasClass cls
          if fix
            $navbar.removeClass cls
          else
            $navbar.slideUp 200, ->
              $navbar
                .removeClass cls
                .fadeIn 500
    @

) document, location, jQuery, ProJ
