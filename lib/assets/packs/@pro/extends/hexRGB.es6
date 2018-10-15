(function (jQuery) {
  const PROhexRGB = hex => {
    if (hex.length === 4) {
      hex = hex.replace(/^#?([a-f\d])([a-f\d])([a-f\d])$/i, (match, r, g, b) => `${r}${r}${g}${g}${b}${b}`)
    }
    const rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)
    return rgb ? {
      r: parseInt(rgb[1], 16),
      g: parseInt(rgb[2], 16),
      b: parseInt(rgb[3], 16),
    } : null
  }

  jQuery.hexRGB = PROhexRGB
})(jQuery)
