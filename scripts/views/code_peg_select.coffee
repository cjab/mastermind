define [
  "jQuery",
  "Underscore",
  "Backbone",
  "cs!models/code_peg",
  "cs!collections/code_pegs",
  "cs!views/code_peg",
  "text!templates/code_peg_select.html"
],

($, _, Backbone, CodePeg, CodePegs, CodePegView, codePegSelectTemplate) ->

  class CodePegSelectView extends Backbone.View

    template: _.template(codePegSelectTemplate)


    initialize: ->
      @childViews = {}

      @codePegs = new CodePegs
      @codePegs.bind "add", @addCodePeg
      @codePegs.bind "remove", @removeCodePeg

      @codePegs.add [
        new CodePeg type: "btn-primary"
        new CodePeg type: "btn-info"
        new CodePeg type: "btn-success"
        new CodePeg type: "btn-warning"
        new CodePeg type: "btn-danger"
        new CodePeg type: "btn-inverse"
      ]

      @render()


    addCodePeg: (codePeg) =>
      view = new CodePegView model: codePeg
      @childViews[codePeg.cid] = view


    removeCodePeg: (codePeg) =>
      @childViews[codePeg.cid].remove()
      delete @childViews[codePeg.cid]


    renderChildren: -> $(view.el for own id, view of @childViews)


    render: ->
      data = id : 1, type: "btn-inverse"
      @$el.html @template(data)
      @$el.find('.dropdown-menu').html(@renderChildren())
