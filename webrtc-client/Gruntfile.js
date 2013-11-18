module.exports = function (grunt) {
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-growl');

    grunt.registerTask('compile-eco', 'Compile eco template', function () {
        var fs = require('fs');
        var Eco = require('eco');
        var files = fs.readdirSync('src/views');

        if( !fs.existsSync("build") ) {
            fs.mkdirSync("build");
            fs.mkdirSync("build/views");
        }

        files.forEach(function (file) {
            var fileContent = fs.readFileSync('src/views/' + file);
            var compiled = Eco.precompile(fileContent.toString());
            var name = file.split(".");
            var functionString = "define('view/" + name[0] + "', function() { return " + compiled + " });";
            fs.writeFileSync('build/views/' + name[0] + '.js', functionString);
        });
    });

    grunt.initConfig({
        coffee: {
            compileJoined: {
                options: {
                    join: true
                },
                files: {
                    "build/app.js": ["src/**/*.coffee"]
                }
            }
        },
        watch: {
            scripts: {
                files: ["src/**/*.coffee", "src/views/*.eco"],
                tasks: ['default']
            }
        },
        concat: {
            dist: {
                src: ["build/views/*.js", "build/app.js"],
                dest: "build/application.js"
            }
        },
        uglify: {
            my_target: {
                files: {
                    'js/app.min.js': ['build/application.js']
                }
            }
        },
        growl : {
            buildComplete : {
                message : "Build complited",
                title : "Build status"
            }
        }
    });

    grunt.registerTask('default', ['compile-eco', 'coffee', 'concat', 'uglify', 'growl:buildComplete']);
}