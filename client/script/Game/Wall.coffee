class Game.Wall extends Phaser.Sprite

  gameState: null
  mapX: 0
  mapY: 0

  constructor: (game, gameState, mapX, mapY, tile)->
    super(game, 0, 0, 'altas_main', tile)
    @anchor.setTo(0, 0) # this is the default
    @mapX = mapX
    @mapY = mapY
    @game = game
    @gameState = gameState

    @reset(@mapX * @width, @mapY * @height)

    game.add.existing(@)

  update: () -> # Called automatically by Phaser because we are a Sprite
