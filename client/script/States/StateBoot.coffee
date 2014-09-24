class Game.StateBoot extends Phaser.State
  constructor: -> super

  preload: ->
    @load.image('preloadBar', Game.assetsRoot+'loader.png')

    # Prevent Phaser from pausing when focus is lost
    @stage.disableVisibilityChange = true

    @scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
    @scale.minWidth = 480 # / 4
    @scale.minHeight = 270
    @scale.maxWidth = 5760 # * 3
    @scale.maxHeight = 3240
    @scale.pageAlignHorizontally = true
    @scale.pageAlignVertically = true
    @scale.setScreenSize(true)

    @game.input.gamepad.start()

    # Prevent these keys from bubbling to the browser (and scroll the page)
    @game.input.keyboard.addKeyCapture([
      Phaser.Keyboard.LEFT,
      Phaser.Keyboard.RIGHT,
      Phaser.Keyboard.UP,
      Phaser.Keyboard.DOWN,
      Phaser.Keyboard.BACKSPACE,
      Phaser.Keyboard.SPACEBAR
    ])

  create: ->
    @game.state.start('Preloader', true, false)