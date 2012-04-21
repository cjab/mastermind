define [
  "Underscore",
  "Backbone"
],

(_, Backbone) ->

  class CodePeg extends Backbone.Model

    @types: [
      "btn-primary"
      "btn-info"
      "btn-success"
      "btn-warning"
      "btn-danger"
      "btn-inverse"
    ]
