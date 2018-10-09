(function (jQuery) {
  const PROdeactive = function (selector) {
    const DATA_KEY = 'deactive'

    return jQuery(selector || `[data-${jQuery.data.toKey(DATA_KEY)}]`).click(event => {
      event.preventDefault()
      event.stopPropagation()
      return false
    })
  }

  const NAME = 'deactive'

  jQuery.fn[NAME] = function () {
    return PROdeactive(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PROdeactive(...arguments)
    return this
  }
})(jQuery)
