class Game.StateGame extends Phaser.State
  constructor: -> super

  textFPS: null

  player: null

  create: () =>
    @game.world.setBounds(0, 0, 20000, 20000)

    #FPS
    @game.time.advancedTiming = true
    @textFPS = @add.text(120, 30, "FPS", { font: "30px Arial", fill: "rgb(1, 51, 209)", align: "center" })
    @textFPS.anchor.setTo(0.5, 0)


    ball = new Phaser.Sprite(@game, 200, 200, 'altas_main', 'ball_0')
    @game.add.existing(ball)

    @player = new Game.Player(@game, @)
    @game.camera.follow(@player)
    @game.camera.focusOnXY(0, 0)

    @game.add.tween(@player).to({x: 550, 350}, 1000, Phaser.Easing.None, true)

  update: () =>
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_3) or @game.input.keyboard.isDown(Phaser.Keyboard.BACKSPACE)
      @game.state.start('TitleScreen', true, false)


  render: () =>
    @textFPS.setText("FPS: " + @game.time.fps)