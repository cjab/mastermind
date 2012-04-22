define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/score",
  "text!templates/score.html"
],

($, _, Backbone, Score, scoreTemplate) ->

  class ScoreView extends Backbone.View

    template: _.template(scoreTemplate)


    initialize: ->
      @model = new Score unless @model?


    render: ->
      pegs = []
      _(@model.get("correct")).times -> pegs.push "correct"
      _(@model.get("correctType")).times -> pegs.push "correct-type"
      pegs.push "" while pegs.length < 4
      data =
        pegs: pegs
      @$el.html @template(data)
