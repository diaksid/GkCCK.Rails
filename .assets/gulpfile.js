var path = require('path'),
    gulp = require('gulp');

var css = require('./utils/css'),
    js = require('./utils/js'),
    icon = require('./utils/icon');

var root = path.dirname(__dirname);


gulp.task('font:icons', function () {
    icon.read(
        path.join(root, 'lib', 'assets'),
        path.join(__dirname, 'icons')
    )
});


gulp.task('style:app', function () {
    css.sass(path.join(root, 'public', 'stylesheets'), [
        path.join(__dirname, 'stylesheets', '**.scss'),
    ])
});


gulp.task('script:assets', function () {
    js(path.join(root, 'public', 'assets'), [
        path.join(__dirname, 'javascripts', '**'),
    ], {
        min: true
    })
});


gulp.task('script:html5', function () {
    js(path.join(root, 'public', 'javascripts'), [
        path.join(__dirname, 'vendor', 'html5', 'es5-shim.js'),
        path.join(__dirname, 'vendor', 'html5', 'html5shiv.js'),
        path.join(__dirname, 'vendor', 'html5', 'html5shiv-printshiv.js'),
        path.join(__dirname, 'vendor', 'html5', 'respond.js')
    ], {
        concat: 'html5bility'
    })
});

gulp.task('script:flex', function () {
    js.ify(path.join(root, 'public', 'javascripts'), [
        path.join(__dirname, 'vendor', 'flex', 'index.js'),
    ], {
        basename: 'flexibility'
    })
});


gulp.task('watch', function () {
    gulp.watch([
        path.join(__dirname, 'icons', '**')
    ], [
        'iconfont'
    ]);

    gulp.watch([
        path.join(__dirname, 'stylesheets', '**')
    ], [
        'style:app'
    ]);

    gulp.watch([
        path.join(__dirname, 'javascripts', '**')
    ], [
        'script:assets'
    ]);

    gulp.watch([
        path.join(__dirname, 'vendor', 'html5', '**')
    ], [
        'script:html5'
    ]);

    gulp.watch([
        path.join(__dirname, 'vendor', 'flex', '**')
    ], [
        'script:flex'
    ])
});


gulp.task('default', [
    'style:app',
    'script:html5',
    'script:flex'
]);
