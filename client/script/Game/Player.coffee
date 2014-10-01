class Game.Player extends Phaser.Sprite

  gameState: null
  tweenMove: null

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
    @reset(@mapX * Game.GRID_WIDTH, @mapY * Game.GRID_WIDTH)

  mapMove: (mapX, mapY) =>
    unless @isMoving()
      @tweenMove = @game.add.tween(@).to(
        {x: mapX * Game.GRID_WIDTH, y: mapY * Game.GRID_WIDTH}
      , 300, Phaser.Easing.None, true)

      @mapX = mapX
      @mapY = mapY

  isMoving: () =>
    @tweenMove?.isRunning || false

  update: () -> # Called automatically by Phaser because we are a Sprite
