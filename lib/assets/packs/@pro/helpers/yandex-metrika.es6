(function (PRO) {
  const Pro = PRO()

  Pro.yandexMetrika = function (selector = '[data-yandex-metrika]') {
    Pro.to(selector).each(element => {
      if (element.dataset && element.dataset.yandexMetrika) {
        new Pro(element)
          .deactive()
          .onclick(el => window.open(
            `//metrika.yandex.ru/dashboard?id=${el.dataset.yandexMetrika}`,
            '_blank'
          ))
      }
    })
    return this
  }

  Pro.prototype.yandexMetrika = function () {
    Pro.yandexMetrika(this)
    return this
  }
}).call(this, PRO)
