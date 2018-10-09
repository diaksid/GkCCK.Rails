(function (jQuery) {
  const PROmailto = function (selector) {
    const DATA_KEY = 'mailto'
    const dataSet = jQuery.data.toSet(DATA_KEY)

    return jQuery(selector || `[data-${jQuery.data.toKey(DATA_KEY)}]`)
      .filter(function () {
        return this.dataset && this.dataset.hasOwnProperty(dataSet)
      })
      .deactive()
      .each(function () {
        const mail = this.dataset && atob(this.dataset[dataSet])
        if (mail) {
          this.href = `mailto://${mail}`
          if (!this.dataset.hasOwnProperty(`${dataSet}Safe`)) {
            this.innerHTML += mail
          }
        } else {
          this.style.visibility = 'hidden'
        }
      })
  }

  const NAME = 'proMailTo'

  jQuery.fn[NAME] = function () {
    return PROmailto(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PROmailto(...arguments)
    return this
  }
})(jQuery)
