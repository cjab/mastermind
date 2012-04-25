({
  appDir:  "../",
  baseUrl: "scripts",
  dir:     "../build",
  paths: {
    jQuery:       "lib/jquery/jquery",
    Underscore:   "lib/underscore/underscore",
    Backbone:     "lib/backbone/backbone",
    bootstrap:    "lib/bootstrap/bootstrap",
    cs:           "lib/require/csBuild",
    csBuild:      "lib/require/cs",
    CoffeeScript: "lib/coffeescript/coffeescript",
    text:         "lib/require/text",
    order:        "lib/require/order",
    templates:    "../templates"
  },
  modules: [
    {
      name: "main",
      exclude: ["CoffeeScript"]
    }
  ]
})
