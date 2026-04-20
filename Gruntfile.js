module.exports = function (grunt) {
  const sass = require('sass');

  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['watch:scss']);

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      main: {
        options: {
          sourceMap: true,
          outputStyle: 'compressed',
          implementation: sass,
        },
        files: {
          './css/styles.css': './scss/main.scss',
          './css/styles-light.css': './scss/main-light.scss'
        }
      },
    },

    watch: {
      scss: {
        files: ['./scss/**/*.scss'],
        tasks: ['sass:main'],
        options: {
          spawn: false,
        },
      },
    },
  });
};
