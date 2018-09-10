module JsEventsHelper

  # JS Events script
  def js_events_script_tag
    content_tag :script do
      <<-JAVASCRIPT.squish.html_safe
      (function (w, d) {
        var t = w.ontouchstart || (w.DocumentTouch && d instanceof DocumentTouch);
        d.documentElement.className = 'is-js is-touch' + (t ? '' : '--not');
      })(window, document)
      JAVASCRIPT
    end
  end

end
