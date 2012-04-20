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

    events:
      "select": "onSelect"


    initialize: ->
      @childViews = {}

      @codePegs = new CodePegs
      @codePegs.on "add",    @onAddCodePeg
      @codePegs.on "remove", @onRemoveCodePeg
      @codePegs.on "select", @onSelect

      @codePegs.add [
        new CodePeg type: "btn-primary"
        new CodePeg type: "btn-info"
        new CodePeg type: "btn-success"
        new CodePeg type: "btn-warning"
        new CodePeg type: "btn-danger"
        new CodePeg type: "btn-inverse"
      ]

      @render()


    onAddCodePeg: (codePeg) =>
      view = new CodePegView model: codePeg
      @childViews[codePeg.cid] = view


    onRemoveCodePeg: (codePeg) =>
      @childViews[codePeg.cid].remove()
      delete @childViews[codePeg.cid]


    onSelect: (codePeg) => @render()


    renderChildren: ->
      # Events have to be re-attached to the child views
      view.delegateEvents() for own id, view of @childViews
      $(view.el for own id, view of @childViews)


    render: ->
      data =
        id:   @codePegs.selected?.get("cid")
        type: @codePegs.selected?.get("type")

      @$el.html @template(data)
      @$el.find('.dropdown-menu').html(@renderChildren())
      @delegateEvents()
