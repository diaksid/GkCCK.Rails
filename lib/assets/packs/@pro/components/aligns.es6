(function (jQuery) {
  const NAME = 'aligns'

  const PROaligns = function (selector, context) {
    let val = 0
    return jQuery(selector, context)
      .each(function () {
        this.style.height = ''
        const height = jQuery(this).innerHeight()
        if (height > val) {
          val = height
        }
      })
      .each(function () {
        this.style.height = `${val}px`
      })
  }

  jQuery.fn[NAME] = function (selector) {
    if (selector) {
      this.each(function () {
        PROaligns(selector, this)
      })
    } else {
      PROaligns(this)
    }
    return this
  }

  jQuery[NAME] = function () {
    PROaligns(...arguments)
    return this
  }
})(jQuery)
