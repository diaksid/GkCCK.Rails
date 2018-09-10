module YandexHelper

  # Yandex Metrika script
  def yandex_metrika_script_tag
    if YANDEX[:metrika]
      content_tag :script do
        <<-JAVASCRIPT.squish.html_safe
        (function (w, c, p) {
          p(document).on('turbolinks:load', function () {
            (w[c] = w[c] || []).push(function () {
              try {
                w.yaCounter#{YANDEX[:metrika]} = new Ya.Metrika({
                  id: #{YANDEX[:metrika]},
                  clickmap: true,
                  trackLinks: true,
                  accurateTrackBounce: true,
                  webvisor: true,
                  trackHash: true
                });
              } catch (e) {
               }
            });
            p.script('//mc.yandex.ru/metrika/watch.js');
          });
        })(window, 'yandex_metrika_callbacks', ProJ)
        JAVASCRIPT
      end
    end
  end


  # Yandex Search script
  def yandex_search_script_tag
    if YANDEX[:search]
      content_tag :script do
        <<-JAVASCRIPT.squish.html_safe
        (function (w, d, n, c, p, e) {
          p(d).on('turbolinks:load', function () {
            e = d.documentElement;
            if (!e.classList.contains(n)) {
              e.classList.add(n);
            }
            (w[c] || (w[c] = [])).push(function () {
              Ya.Site.Form.init()
            });
            p.script('//site.yandex.net/v2.0/js/all.js');
          });
        })(window, document, 'ya-page_js_yes', 'yandex_site_callbacks', ProJ);
        JAVASCRIPT
      end
    end
  end

end
