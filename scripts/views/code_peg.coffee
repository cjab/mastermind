define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/code_peg",
  "text!templates/code_peg.html"
],

($, _, Backbone, CodePeg, codePegTemplate) ->

  class CodePegView extends Backbone.View
    el: $("#content")
    codePeg: null

    initialize: ->
      console.log "Initializing CodePegView..."
      @codePeg = new CodePeg
      @render()

    render: ->
      data =
        buttonClass: @codePeg.get("class")
      template = _.template(codePegTemplate, data)
      $(@el).html(template)

  return CodePegView
