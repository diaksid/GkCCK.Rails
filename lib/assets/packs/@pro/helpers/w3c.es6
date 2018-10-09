(function (jQuery) {
  const PROw3c = function (selector) {
    const DATA_KEY = 'w3c'

    return jQuery(selector || `[data-${jQuery.data.toKey(DATA_KEY)}]`)
      .deactive()
      .click(() => window.open(
        `//validator.w3.org/nu/?doc=${encodeURIComponent(location.href)}&showsource=yes&showoutline=yes`,
        '_blank'
      ))
  }

  const NAME = 'proW3C'

  jQuery.fn[NAME] = function () {
    return PROw3c(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PROw3c(...arguments)
    return this
  }
})(jQuery)
