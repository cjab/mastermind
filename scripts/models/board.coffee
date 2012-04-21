define [
  "Underscore",
  "Backbone",
  "cs!collections/guesses",
  "cs!models/code_peg",
  "cs!collections/code_pegs"
],

(_, Backbone, Guesses, CodePeg, CodePegs) ->

  class Board extends Backbone.Model

    defaults:
      codeLength: 4
      allowDuplicates: yes


    initialize: ->
      @set "answer",  @randomCode()
      @set "guesses", new Guesses

      @get("guesses").on "change", @onMakeGuess


    onMakeGuess: (guess) =>
      console.log "Board Model, Comparing Guess"
      correctType  = @get("answer").numberOfCorrectType guess.get("codePegs")
      correctOrder = @get("answer").numberInOrder guess.get("codePegs")
      console.log "TYPE:",  correctType - correctOrder
      console.log "ORDER:", correctOrder


    randomCode: ->
      length = @get("codeLength")
      numberOfPegs = CodePeg.types.length
      code = (Math.floor(Math.random() * numberOfPegs) for i in [1..length])
      new CodePegs (new CodePeg type: CodePeg.types[i] for i in code)
