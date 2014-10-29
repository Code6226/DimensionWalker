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
    @game.load.image('bound', Game.assetsRoot+'bound.png')
    @game.load.image('green', Game.assetsRoot+'green.png')
    @game.load.image('goal', Game.assetsRoot+'goal.png')
    @game.load.image('red', Game.assetsRoot+'red.png')
    @game.load.image('icon_green', Game.assetsRoot+'icon_green.png')
    @game.load.image('icon_red', Game.assetsRoot+'icon_red.png')

  create: ->
    tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true)
    tween.onComplete.add(@startMainMenu, @)

  startMainMenu: ->
    @game.state.start('TitleScreen', true, false)
