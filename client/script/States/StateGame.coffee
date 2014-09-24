class Game.StateGame extends Phaser.State
  constructor: -> super

  textFPS: null

  ball: null

  create: () =>
    #FPS
    @game.time.advancedTiming = true
    @textFPS = @add.text(120, 30, "FPS", { font: "30px Arial", fill: "rgb(1, 51, 209)", align: "center" })
    @textFPS.anchor.setTo(0.5, 0)

    @ball = new Game.Ball(@game, @)

  update: () =>
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_3) or @game.input.keyboard.isDown(Phaser.Keyboard.BACKSPACE)
      @game.state.start('TitleScreen', true, false)


  render: () =>
    @textFPS.setText("FPS: " + @game.time.fps)