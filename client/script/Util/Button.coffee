class Game.Button extends Phaser.Button

  style:
    enabled: {
      'font': '20px Arial',
      'fill': 'black'
    }
    disabled: {
      'font': '20px Arial',
      'fill': '#5A5A5A'
    }

  callback: null

  constructor: (game, x, y, text, key, callback, callbackContext, width) ->
    super(game, x, y, key)
    game.add.existing(@)

    @callback = _.bind(callback, callbackContext)

    @label = new Phaser.Text(game, 0, 0, "Label", @style.enabled)
    @addChild(@label)
    @label.anchor.setTo(0.5, 0.5)
    @setText(text || "Label")
    @inputEnabled = false # for setDisabled, so it's a change
    @setDisabled(false)

    @width = width
    @label.scale.x = 1.0 / @scale.x # funky child scale-along countering

  setText: (text) ->
    @label.setText text
    @centerLabel()

  centerLabel: () ->
    @label.x = Math.floor((@width) * 0.5)
    @label.y = Math.floor((@height) * 0.5)

  setDisabled: (isDisabled) ->
    if @inputEnabled != !isDisabled
      @inputEnabled = !isDisabled
      if isDisabled
        @label.setStyle @style.disabled
        @events.onInputUp.removeAll()
      else
        @label.setStyle @style.enabled
        @events.onInputUp.add(@callback)