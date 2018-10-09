(function (jQuery) {
  const PRObase64 = function (selector) {
    const DATA_KEY = 'base64'
    const dataSet = jQuery.data.toSet(DATA_KEY)

    return jQuery(selector || `[data-${jQuery.data.toKey(DATA_KEY)}]`)
      .filter(function () {
        return this.dataset && this.dataset[dataSet]
      })
      .each(function () {
        this.innerHTML += atob(this.dataset[dataSet])
      })
  }

  const NAME = 'proBase64'

  jQuery.fn[NAME] = function () {
    return PRObase64(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PRObase64(...arguments)
    return this
  }
})(jQuery)
