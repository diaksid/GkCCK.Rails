(function (PRO) {
  const Pro = PRO()

  Pro.mailto = function (selector = '[data-mailto]') {
    Pro.to(selector).each(element => {
      const mail = element.dataset && atob(element.dataset.mailto)
      if (mail) {
        element.href = `mailto://${mail}`
        if (!element.dataset.hasOwnProperty('mailtoSafe')) {
          element.innerHTML += mail
        }
      } else {
        element.style.visibility = 'hidden'
      }
    })
    return this
  }

  Pro.prototype.mailto = function () {
    Pro.mailto(this)
    return this
  }
}).call(this, PRO)
