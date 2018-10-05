(function (PRO) {
  const Pro = PRO()

  Pro.w3c = function (selector = '[data-w3c]') {
    Pro.to(selector)
      .deactive()
      .onclick(() => window.open(
        `//validator.w3.org/nu/?doc=${encodeURIComponent(location.href)}&showsource=yes&showoutline=yes`,
        '_blank'
      ))
    return this
  }

  Pro.prototype.w3c = function () {
    Pro.w3c(this)
    return this
  }
}).call(this, PRO)
