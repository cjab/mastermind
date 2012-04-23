define [
  "Underscore",
  "Backbone",
  "cs!collections/guesses",
  "cs!models/code_peg",
  "cs!collections/code_pegs"
  "cs!models/score"
  "cs!models/guess",
],

(_, Backbone, Guesses, CodePeg, CodePegs, Score, Guess) ->

  class Board extends Backbone.Model

    defaults:
      maxGuesses: 12
      codeLength:  4
      allowDuplicates: yes
      wins:   0
      losses: 0


    initialize: ->
      @set "answer",  @randomCode()
      @set "guesses", new Guesses

      @get("guesses").on "change:codePegs", @onMakeGuess


    onMakeGuess: (guess) =>
      @scoreGuess(guess)
      if guess.get("score").get("correct") == @get("codeLength")
        @set "wins", @get("wins") + 1
      else if @get("guesses").length >= @get("maxGuesses")
        @set "losses", @get("losses") + 1
      else
        @get("guesses").add new Guess


    newCode: ->
      @set "answer", @randomCode()
      @get("guesses").reset()
      @get("guesses").add new Guess


    scoreGuess: (guess) =>
      correct     = @get("answer").numberInOrder guess.get("codePegs")
      correctType = @get("answer").numberOfCorrectType guess.get("codePegs")
      guess.get("score").set
        correct: correct
        correctType: correctType - correct


    randomCode: ->
      length = @get("codeLength")
      numberOfPegs = CodePeg.types.length
      code = (Math.floor(Math.random() * numberOfPegs) for i in [1..length])
      new CodePegs (new CodePeg type: CodePeg.types[i] for i in code)
