(function (PRO) {
  const Pro = PRO()

  Pro.aligns = function (selector) {
    let val = 0
    Pro.to(selector)
      .each(function () {
        this.style.height = ''
        const height = PRO(this).innerHeight()
        if (height > val) {
          val = height
        }
      })
      .each(function () {
        this.style.height = `${val}px`
      })
    return this
  }

  Pro.prototype.aligns = function (selector) {
    if (selector) {
      this.each(function () {
        Pro.aligns(PRO(selector, this))
      })
    } else {
      Pro.aligns(this)
    }
    return this
  }
}).call(this, PRO)
