var gulp = require('gulp'),
  nodemon = require('gulp-nodemon'),
  plumber = require('gulp-plumber'),
  cssmin = require('gulp-cssmin'),
  concat = require('gulp-concat'),
  livereload = require('gulp-livereload');


gulp.task('develop', function () {
  livereload.listen();
  nodemon({
    script: 'app.js',
    ext: 'js coffee handlebars',
    stdout: false
  }).on('readable', function () {
    this.stdout.on('data', function (chunk) {
      if(/^Express server listening on port/.test(chunk)){
        livereload.changed(__dirname);
      }
    });
    this.stdout.pipe(process.stdout);
    this.stderr.pipe(process.stderr);
  });
});

gulp.task('cssminonsave', function () {
  gulp.watch(['public/css/*.css', '!public/css/*.min.css'], function(){
    return gulp.src('./public/css/*.css')
      .pipe(concat('all.min.css'))
      .pipe(cssmin())
      .pipe(gulp.dest('./public/css/'));
  });
});

gulp.task('default', [
  'develop', 'cssminonsave'
]);
