(function (jQuery) {
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

  const NAME = 'proAligns'

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
