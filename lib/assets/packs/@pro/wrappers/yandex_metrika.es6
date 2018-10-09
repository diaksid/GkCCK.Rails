(function (jQuery) {
  const PROyandexMetrika = function (selector) {
    const DATA_KEY = 'yandex-metrika'
    const dataSet = jQuery.data.toSet(DATA_KEY)

    return jQuery(selector || `[data-${jQuery.data.toKey(DATA_KEY)}]`)
      .filter(function () {
        return this.dataset && this.dataset[dataSet]
      })
      .deactive()
      .click(event => window.open(
        `//metrika.yandex.ru/dashboard?id=${event.target.dataset[dataSet]}`,
        '_blank'
      ))
  }

  const NAME = 'proYandexMetrika'

  jQuery.fn[NAME] = function () {
    return PROyandexMetrika(this, ...arguments)
  }

  jQuery[NAME] = function () {
    PROyandexMetrika(...arguments)
    return this
  }
})(jQuery)
