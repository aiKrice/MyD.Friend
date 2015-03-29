customWrapper = (path, data) ->
  # if working into our app directory
  if path.match(/^app/)
    # skip files
    return "" if exports.config.skip_files.indexOf(path) > -1
    # skip wrapping for main file
    return "#{data}" if path == exports.config.main
    # commonJS style wrapping
    moduleName = exports.config.modules.nameCleaner(path.replace(new RegExp('\\\\', 'g'), '/')).replace(/\.\w+$/, '')
    'require.register("' + moduleName + '", function(exports, require, module) {\n' + data + '\n});\n\n'
  else
    # working on bower_components
    if path.match(/^bower_components/)
      if exports.config.bowerModuleNames[path]
        moduleName = exports.config.bowerModuleNames[path]
      else
        # transform "bower_components/jquery/dist/jquery.js" into "jquery" for example
        moduleName = path.replace(new RegExp('bower_components/'), '').replace(new RegExp('\/.*'), '')

      return 'require.register("' + moduleName + '", function(exports, require, module) {\n' + data + '\n});\n\n'
    else
      return "#{data}"


exports.config =
  plugins:
    react:
      harmony: yes # include some es6 transforms

  main: 'app/app.jsx'
  skip_files: []
  bowerModuleNames: # only for specific module name, not matched by RegExp
    'bower_components/moment/locale/fr.js': 'moment-locale-fr'
  modules:
    wrapper: customWrapper

  files:
    javascripts:
      joinTo:
        'js/vendor.js': /^(vendor|bower_components)/
        'js/app.js': /^app/
      order:
        after: 'app/app.jsx'
    stylesheets:
      joinTo: 'css/app.css'
    templates:
      joinTo: 'js/app.js'
  server:
    run: yes
