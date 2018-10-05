(function (PRO) {
  const Pro = PRO()

  Pro.base64 = function (selector = '[data-base64]') {
    Pro.to(selector).each(element => {
      if (element.dataset) {
        element.innerHTML += atob(element.dataset.base64)
      }
    })
    return this
  }

  Pro.prototype.base64 = function () {
    Pro.base64(this)
    return this
  }
}).call(this, PRO)
