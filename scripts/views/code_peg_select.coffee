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
      @codePegs.on "add",    @onAddCodePeg
      @codePegs.on "remove", @onRemoveCodePeg
      @codePegs.on "select", @onSelect

      @codePegs.add (new CodePeg type: t for t in CodePeg.types)

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


    disable: ->
      @$el.find(".btn").attr "data-toggle", ""
      @$el.find(".btn").prop "disabled"
      @$el.find(".caret").removeClass("caret")


    render: ->
      data =
        id:   @codePegs.selected?.get("cid")
        type: @codePegs.selected?.get("type")

      @$el.html @template(data)
      @$el.find('.dropdown-menu').html(@renderChildren())
