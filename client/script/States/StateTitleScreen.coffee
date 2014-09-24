class Game.StateTitleScreen extends Phaser.State
  constructor: -> super

  create: () =>
    #Background
#    bg = @game.add.tileSprite(0, 0, Game.WIDTH, Game.HEIGHT, 'background')
#    bg.autoScroll(-50,0)
    # Odd bug in Crosswalk that it doesn't support an atlas
#    @game.add.tileSprite(0, 0, Game.WIDTH, Game.HEIGHT, 'altas_main','background')


    stylePressButton = { font: "20px Arial", fill: "#12D523", align: "center" }
    textPressButton = @add.text(@world.centerX, @world.centerY, "Play Game!", stylePressButton)
    textPressButton.anchor.setTo(0.5, 0.5)

    styleCopyright = { font: "20px Arial", fill: "#E2D533", align: "center" }
    textCopyright = @add.text(@world.centerX, Game.HEIGHT - 50, "(c) 2014 Cool dudes", styleCopyright)
    textCopyright.anchor.setTo(0.5, 1)

#    @buttonSingle = new Game.Button(@game, @world.centerX - 110, @world.centerY - 35, 'Single Player', 'Button', @goTakeTurn, @, 220)

  goPlay: () ->
    @game.state.start('Game', true, false)

  update: () =>
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_0) or @game.input.keyboard.isDown(Phaser.Keyboard.SPACEBAR)
      @goPlay()
