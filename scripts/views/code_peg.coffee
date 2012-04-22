define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/code_peg",
  "text!templates/code_peg.html"
],

($, _, Backbone, CodePeg, codePegTemplate) ->

  class CodePegView extends Backbone.View

    template: _.template(codePegTemplate)
    events:
      "click": "onClick"


    initialize: ->
      @model = new CodePeg unless @model?
      @render()


    onClick: => @model.trigger("select", @model)


    disable: ->
      @$el.off "click"


    render: ->
      data = type: @model.get("type")
      @$el.html @template(data)
      @delegateEvents()
