class Game.Player extends Phaser.Sprite

  gameState: null
  mapX: 0
  mapY: 0

  constructor: (game, gameState, collisionGroup)->
    super(game, 300, 300, 'altas_main', 'character_blue_3')
    @anchor.setTo(0.5, 0.5) # this is the default
    @game = game
    @gameState = gameState

    game.add.existing(@)

  update: () -> # Called automatically by Phaser because we are a Sprite
