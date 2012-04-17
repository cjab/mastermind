require.config({
  paths: {
    jQuery:     "lib/jquery/jquery",
    Underscore: "lib/underscore/underscore",
    Backbone:   "lib/backbone/backbone"
  }
});

require([
  "cs!app",
  "order!lib/jquery/jquery-min",
  "order!lib/underscore/underscore-min",
  "order!lib/backbone/backbone-min"
], function(App) {
  App.initialize();
});
