class Game.StatePreloader extends Phaser.State
  constructor: -> super

  preloadBar: null

  preload: ->

    #  Set-up our preloader sprite
    @preloadBar = @add.sprite(@world.centerX - 200, 250, 'preloadBar')
    @load.setPreloadSprite(@preloadBar)

    #Tell Crosswalk are ready to show ourselves
#    window?.screen?.show?()

    #  Load our actual games assets
    @game.load.atlas('altas_main', Game.assetsRoot+'main0.png', Game.assetsRoot+'main0.json')

    @game.load.image('title', Game.assetsRoot+'title.png')

    @game.load.image('Button', Game.assetsRoot+'Button.png')
    @game.load.image('background', Game.assetsRoot+'background.png')
    @game.load.image('paddle', Game.assetsRoot+'paddle.png')
    @game.load.image('bound', Game.assetsRoot+'bound.png')

  create: ->
    tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true)
    tween.onComplete.add(@startMainMenu, @)

  startMainMenu: ->
    @game.state.start('TitleScreen', true, false)
