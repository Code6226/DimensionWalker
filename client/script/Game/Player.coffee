class Game.Player extends Phaser.Sprite

  gameState: null
  mapX: 0
  mapY: 0

  constructor: (game, gameState, mapX, mapY)->
    super(game, 0, 0, 'altas_main', 'character_blue_3')
    @anchor.setTo(0, 0) # this is the default
    @game = game
    @gameState = gameState

    @mapWarp(mapX, mapY)

    game.add.existing(@)

  mapWarp: (mapX, mapY) =>
    @mapX = mapX
    @mapY = mapY
    @reset(@mapX * @width, @mapY * @height)

  mapMove: (mapX, mapY) =>
    @mapX = mapX
    @mapY = mapY
    @reset(@mapX * @width, @mapY * @height)

  update: () -> # Called automatically by Phaser because we are a Sprite
