class Game.StateWinScreen extends Phaser.State
  constructor: -> super

  create: () =>

    stylePressButton = { font: "20px Arial", fill: "#12D523", align: "center" }
    textPressButton = @add.text(Game.WIDTH/2, Game.HEIGHT/2, "A winner is *YOU*!", stylePressButton)
    textPressButton.anchor.setTo(0.5, 0.5)

    styleCopyright = { font: "20px Arial", fill: "#E2D533", align: "center" }
    textCopyright = @add.text(Game.WIDTH/2, Game.HEIGHT - 50, "Thank you for playing.", styleCopyright)
    textCopyright.anchor.setTo(0.5, 1)


  goStart: () ->
    @game.state.start('TitleScreen', true, false)

  update: () =>
    @game.camera.reset()
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_0) ||
       @game.input.activePointer.isDown ||
       @game.input.keyboard.isDown(Phaser.Keyboard.SPACEBAR)
      @goStart()
