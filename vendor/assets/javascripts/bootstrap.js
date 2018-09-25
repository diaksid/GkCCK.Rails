//= require_self
//
//= require bootstrap/js/dist/util.js
//= require bootstrap/js/dist/collapse.js
//= require bootstrap/js/dist/dropdown.js
//= require bootstrap/js/dist/button.js
//  require bootstrap/js/dist/tab.js
//= require bootstrap/js/dist/alert.js
//= require bootstrap/js/dist/tooltip.js
//  require bootstrap/js/dist/popover.js
//  require bootstrap/js/dist/modal.js
//  require bootstrap/js/dist/carousel.js
//  require bootstrap/js/dist/scrollspy.js

(function ($) {
    if (typeof $ === 'undefined') {
        throw new TypeError('Bootstrap\'s JavaScript requires jQuery. jQuery must be included before Bootstrap\'s JavaScript.');
    }

    var version = $.fn.jquery.split(' ')[0].split('.');
    var minMajor = 1;
    var ltMajor = 2;
    var minMinor = 9;
    var minPatch = 1;
    var maxMajor = 4;

    if (version[0] < ltMajor && version[1] < minMinor || version[0] === minMajor && version[1] === minMinor && version[2] < minPatch || version[0] >= maxMajor) {
        throw new Error('Bootstrap\'s JavaScript requires at least jQuery v1.9.1 but less than v4.0.0');
    }
})($);
