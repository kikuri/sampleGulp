gulp = require 'gulp'  # gulpを読み込む
uglify = require 'gulp-uglify' # gulp-uglifyを読み込む
sass = require 'gulp-sass'
autoprefixer = require "gulp-autoprefixer"
browser = require 'browser-sync'
haml = require 'gulp-ruby-haml'
coffee = require 'gulp-coffee'
minifyCss   = require 'gulp-minify-css'
concat      = require 'gulp-concat'
runSequence = require 'run-sequence'

# 「uglify」タスクを定義する
gulp.task 'uglify', () ->
    # タスクを実行するファイルを指定
    gulp.src('.example.js')
    # 実行する処理をpipeでつないでいく
        .pipe(uglify()) # uglifyを実行
        .pipe(gulp.dest('dist')) # 圧縮したファイルをdistに出力

#coffeescript コンパイル
gulp.task 'compile-coffee', () ->
    gulp.src 'src/coffee/**/*.coffee'
        .pipe coffee()
        .pipe gulp.dest('./src/js/')
#        .pipe browser.reload({stream:true})


gulp.task 'compile-js', () ->
    compileFileName = 'application.js'
    gulp.src 'src/js/**/*.js'
        .pipe concat(compileFileName)
        .pipe uglify()
        .pipe gulp.dest('dist/js')
#        .pipe browser.reload({stream:true})


# hamlタスク設定
gulp.task 'haml', () ->
    gulp.src './src/*.haml'
        .pipe haml()
        .pipe gulp.dest('./src/')
#        .pipe browser.reload({stream:true})


# SassとCssの保存先を指定
gulp.task 'sass', () ->
    gulp.src './src/sass/*.scss'
        .pipe sass({outputStyle: 'expanded'})
        .pipe autoprefixer()
        .pipe gulp.dest('./dist/css/')
#        .pipe browser.reload({stream:true})


gulp.task 'compile-css', () ->
    compileFileName = 'application.css'
    gulp.src 'src/css/**/*.css'
        .pipe autoprefixer()
        .pipe concat(compileFileName)
        .pipe minifyCss()
        .pipe gulp.dest('dist/css')
#        .pipe browser.reload({stream:true})

gulp.task 'compile', -> runSequence(
  'haml',
  ['compile-coffee','sass'],
  ['compile-js', 'compile-css']
)

gulp.task 'watch', ->
  gulp.watch ['./src/sass/**/*.scss', './src/coffee/**/*.coffee', './src/*.haml'], ['compile']



# タスク"task-watch"がgulpと入力しただけでdefaultで実行されるようになる
gulp.task 'default', ['sass', 'compile-coffee', 'haml', 'compile-js', 'compile-css']


