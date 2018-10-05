(function (PRO) {
  const Pro = PRO()

  Pro.assign({
    newEvent (name, bubble = false, cancelable = false) {
      let event
      if (typeof Event === 'function') {
        event = new Event(name, {
          bubble: bubble,
          cancelable: cancelable
        })
      } else {
        event = document.createEvent('Event')
        event.initEvent(name, bubble, cancelable)
      }
      return event
    },

    onready (element, callback) {
      if (typeof element === 'function') {
        callback = element
        element = document
      }
      element.addEventListener('DOMContentLoaded', callback)
      return this
    },

    onload (element, callback) {
      if (typeof element === 'function') {
        callback = element
        element = window
      }
      element.addEventListener('load', callback)
      return this
    },

    onresize (element, callback) {
      if (typeof element === 'function') {
        callback = element
        element = window
      }
      element.addEventListener('resize', callback)
      return this
    },

    onscroll (element, callback) {
      if (typeof element === 'function') {
        callback = element
        element = window
      }
      element.addEventListener('scroll', callback)
      return this
    }
  })
}).call(this, PRO)
