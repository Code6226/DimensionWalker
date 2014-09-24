
class Game.Main
  constructor: ->
    @game = new Phaser.Game(Game.WIDTH, Game.HEIGHT, Phaser.AUTO, 'gameHolderID', null)
    @game.state.add('Boot', new Game.StateBoot, false)
    @game.state.add('Preloader', new Game.StatePreloader, false)
    @game.state.add('TitleScreen', new Game.StateTitleScreen, false)
    @game.state.add('Game', new Game.StateGame, false)

    @game.state.start('Boot')


##Let's begin
(-> new Game.Main())()