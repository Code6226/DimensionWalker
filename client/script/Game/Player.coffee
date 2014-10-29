class Game.Player extends Phaser.Sprite

  gameState: null
  tweenMove: null

  mapX: 0
  mapY: 0

  constructor: (game, gameState, mapX, mapY)->
    super(game, 0, 0, 'altas_main', 'player_1')
    @anchor.setTo(0.5, 0.5) # this is the default
    @game = game
    @gameState = gameState

    @animations.add('walking', ['player_1','player_2','player_3','player_4','player_5','player_4','player_3','player_2'], 10, true, false)

    @mapWarp(mapX, mapY)

    game.add.existing(@)

  mapWarp: (mapX, mapY) =>
    @mapX = mapX
    @mapY = mapY
    @reset(@mapX * Game.GRID_WIDTH + Game.GRID_WIDTH_HALF, @mapY * Game.GRID_WIDTH + Game.GRID_WIDTH_HALF)

  mapMove: (mapX, mapY) =>
    unless @isMoving()
      @animations.play('walking')

      @angle = 90 if mapX > @mapX
      @angle = 180 if mapY > @mapY
      @angle = 270 if mapX < @mapX
      @angle = 0 if mapY < @mapY

      @tweenMove = @game.add.tween(@).to({
        x: mapX * Game.GRID_WIDTH + Game.GRID_WIDTH_HALF
        y: mapY * Game.GRID_WIDTH + Game.GRID_WIDTH_HALF
      }, 700, Phaser.Easing.None, true)
      @tweenMove.onComplete.add(@onDoneMoving)

      @mapX = mapX
      @mapY = mapY

  isMoving: () =>
    @tweenMove?.isRunning || false

  onDoneMoving: () =>
    @animations.stop('walking')

  update: () -> # Called automatically by Phaser because we are a Sprite
