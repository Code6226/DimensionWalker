class Game.StateGame extends Phaser.State
  constructor: -> super

  textFPS: null

  player: null

  makeWalls: () =>
    @mapObjects = @game.add.group()

    for xBundle,yIndex in @map
      for type,xIndex in xBundle
        if type == 1
          console.log xIndex + ' ' + yIndex
          new Game.Wall(@game, @, xIndex, yIndex)

  movePlayer: (mapX, mapY) =>
    destX = @player.mapX + mapX
    destY = @player.mapY + mapY
    if @isSpace(destX, destY)
      @player.mapMove(destX, destY)

  isSpace: (mapX, mapY) =>
    @map[mapY]?[mapX] == 0

  create: () =>
    @game.world.setBounds(0, 0, 20000, 20000)

    #FPS
    @game.time.advancedTiming = true
    @textFPS = @add.text(120, 30, "FPS", { font: "30px Arial", fill: "rgb(1, 51, 209)", align: "center" })
    @textFPS.anchor.setTo(0.5, 0)

    @map = [
      [ 0, 1, 1, 0, 0 ],
      [ 0, 1, 0, 0, 1 ],
      [ 0, 0, 0, 1, 1 ],
      [ 1, 1, 0, 0, 0 ],
      [ 1, 1, 1, 1, 0 ],
    ]

    @makeWalls()

    @player = new Game.Player(@game, @, 0, 0)
    @game.camera.follow(@player)
    @game.camera.focusOnXY(0, 0)

  update: () =>
    @movePlayer(0,1) if @game.input.keyboard.isDown(Phaser.Keyboard.DOWN)
    @movePlayer(0,-1) if @game.input.keyboard.isDown(Phaser.Keyboard.UP)
    @movePlayer(-1,0) if @game.input.keyboard.isDown(Phaser.Keyboard.LEFT)
    @movePlayer(1,0) if @game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)

    # quit to title
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_3) or @game.input.keyboard.isDown(Phaser.Keyboard.BACKSPACE)
      @game.state.start('TitleScreen', true, false)


  render: () =>
    @textFPS.setText("FPS: " + @game.time.fps)
