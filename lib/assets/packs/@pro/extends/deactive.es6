(function (jQuery) {
  const NAME = 'deactive'
  const DATA_KEY = jQuery.data.toKey(NAME)

  const PROdeactive = function (selector = `[data-${DATA_KEY}]`) {
    return jQuery(selector).click(event => {
      event.preventDefault()
      event.stopPropagation()
      return false
    })
  }

  jQuery.fn[NAME] = function () {
    return PROdeactive(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PROdeactive(...arguments)
    return this
  }
})(jQuery)
