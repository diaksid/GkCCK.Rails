(function (PRO) {
  const Pro = PRO()

  Pro.assign({
    fromJSON (data) {
      if (typeof data === 'string' && data.match(/\[(.+)]/)) {
        return JSON.parse(data)
      }
    },

    toJSON (data) {
      return JSON.stringify(data)
    }
  })
}).call(this, PRO)
