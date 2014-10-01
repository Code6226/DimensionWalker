module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: {
            build: ['build/'],
            dist: ['dist/']
        },
        copy: {
            build: {
                files: [
                    {src: ['client/index.html'], dest: 'build/index.html'},
                    {src: ['client/icon.png'], dest: 'build/icon.png'},
                    {src: ['client/logo.png'], dest: 'build/logo.png'},
                    {src: ['client/manifest8.json'], dest: 'build/manifest8.json'},
                    {src: 'client/lib/*', dest: 'build/lib/', expand: true, flatten: true},
                    {src: 'assets/output/*', dest: 'build/assets/', expand: true, flatten: true}
                ]
            },
            dist: {
                files: [
                    {cwd: 'build/', src: '**', dest: 'dist/', expand: true, flatten: false},
                    //{src: 'bower_components/phaser/phaser.min.js', dest: 'dist/lib/phaser.js', expand: false, flatten: false},
                    //{src: 'bower_components/lodash/dist/lodash.min.js', dest: 'dist/lib/lodash.js', expand: false, flatten: false},
                ]
            }
        },
        coffee: {
            compileForWeb: {
                files: {
                    'build/js/game.js': ['client/script/bootstrap.coffee','client/script/**/*.coffee'],
                    'spec/mainSpec.js': 'spec/mainSpec.coffee'
                }
            },
            compileForTests: {
                files: {
                    'spec/tests.js': ['client/script/bootstrap.coffee','client/script/**/*.coffee','!client/script/main.coffee'],
                    'spec/allSpec.js': 'spec/*Spec.coffee'
                }
            }
        },
        texturepacker: {
            all: {
                targetdir: 'assets/output',
                dirs: [ 'assets/main' ]
            }
        },
        jasmine: {
            test: {
                src: ['bower_components/phaser/phaser.js','bower_components/lodash/dist/lodash.min.js','spec/tests.js'],
                options: {
                    specs: 'spec/*Spec.js',
                    helpers: 'spec/*Helper.js'
                }
            }
        },
        coffeelint: {
            all: {
                files: {
                    src: ['client/script/**/*.coffee','spec/*.coffee']
                },
                options: {
                    'max_line_length': {
                        'level': 'ignore'
                    }
                }
            }
        },
        connect: {
            server: {
                options: {
                    hostname: '0.0.0.0',
                    port: 9000,
                    base: 'build'
                }
            }
        },
        watch: {
            source: {
                files: ['client/**/*', 'spec/*.coffee'],
                tasks: ['build','lint'],
                options: {
                    livereload: true
                }
            },
            assets: {
                files: ['assets/**/*'],
                tasks: ['texturepacker'],
                options: {
                    livereload: true
                }
            }

        },
        uglify: {
            dist: {
                options: {
                    banner: '/*! <%= grunt.template.today("yyyy-mm-dd") %> */\n',
                    mangle: true
                },
                files: {
                    'dist/js/game.js': ['dist/js/game.js']
                }
            }
        },
        'gh-pages': {
            options: {
                base: 'dist',
                repo: 'https://github.com/Code6226/DimensionWalker.git'
            },
            src: '**'
        }
    });

    // Load the plugins
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-jasmine');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-gh-pages');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadTasks('./tasks');

    // Make production version
//    grunt.registerTask('dist', ['clean:dist','texturepacker','copy:dist','coffee:compileForWeb']);
    grunt.registerTask('test', ['coffee:compileForTests','jasmine']);
    grunt.registerTask('lint', ['coffeelint']);
    grunt.registerTask('build', ['clean:build','copy:build','coffee:compileForWeb']);
    grunt.registerTask('dist', ['build','clean:dist','copy:dist','uglify:dist']);
    grunt.registerTask('deploy', ['test','build','dist','gh-pages']);

    // Default task(s).
    grunt.registerTask('default', ['build','connect:server','watch']);

};
