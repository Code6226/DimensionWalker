class Game.DimensionPicker

  game: null
  pickedCallback: null
  dimNames: []
  pickerButtons: null

  constructor: (game, pickedCallback)->
    @game = game
    @pickedCallback = pickedCallback

    @pickerButtons = @game.add.group()

  load: (maps)->
    # remove and destroy all buttons
    @pickerButtons.removeAll(true)

    @dimNames = _.pluck(maps, 'name')

    _.each(@dimNames, (name, i) =>
      button = @game.add.sprite( 50+ 120 * i, Game.HEIGHT - 100, 'icon_'+name)
      button.inputEnabled = true
      button.events.onInputUp.add(() => @pickedCallback(i))
      @pickerButtons.add(button)
    )
