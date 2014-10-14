class Game.StateGame extends Phaser.State
  constructor: -> super

  textFPS: null
  player: null

  mapObjects: null
  mapCurrent: null

  BUTTON_HEIGHT = 100

  maps: [
    {
      name: 'green'
      data: [
        [ 0, 1, 1, 0, 0 ],
        [ 0, 1, 0, 0, 1 ],
        [ 0, 0, 0, 1, 1 ],
        [ 1, 1, 0, 0, 0 ],
        [ 1, 1, 1, 1, 0 ],
      ]
    }
    {
      name: 'red'
      data: [
        [ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1 ],
        [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
      ]
    }
  ]

  flipToMap: (mapIndex) =>
    @mapCurrent = mapIndex

    # remove and destroy all walls
    @mapObjects.removeAll(true)

    for xBundle,yIndex in @maps[@mapCurrent].data
      for type,xIndex in xBundle
        if type == 1
#          console.log xIndex + ' ' + yIndex
          wall = new Game.Wall(@game, @, xIndex, yIndex, @maps[@mapCurrent].name)
          @mapObjects.add(wall)

  movePlayer: (mapX, mapY) =>
    if @isSpace(@player.mapX, @player.mapY)
      destX = @player.mapX + mapX
      destY = @player.mapY + mapY
      if @isSpace(destX, destY)
        @player.mapMove(destX, destY)

  isSpace: (mapX, mapY) =>
    @maps[@mapCurrent].data[mapY]?[mapX] == 0

  create: () =>
    @game.world.setBounds(0, 0, 20000, 20000)

    dimPicker = new Game.DimensionPicker(@game, @flipToMap)
    dimPicker.load(@maps)

    #FPS
    @game.time.advancedTiming = true
    @textFPS = @add.text(520, 30, "FPS", { font: "30px Arial", fill: "rgb(1, 51, 209)", align: "center" })
    @textFPS.anchor.setTo(0.5, 0)

    @mapObjects = @game.add.group()
    @flipToMap(1)

    @player = new Game.Player(@game, @, 0, 0)
    @game.camera.follow(@player)
    @game.camera.focusOnXY(0, 0)

    @game.input.keyboard.addKey(Phaser.Keyboard.ONE).onDown.add(() => @flipToMap(0))
    @game.input.keyboard.addKey(Phaser.Keyboard.TWO).onDown.add(() => @flipToMap(1))

  update: () =>
    drawDebug = true
    @movePlayer(0,1) if @game.input.keyboard.isDown(Phaser.Keyboard.DOWN)
    @movePlayer(0,-1) if @game.input.keyboard.isDown(Phaser.Keyboard.UP)
    @movePlayer(-1,0) if @game.input.keyboard.isDown(Phaser.Keyboard.LEFT)
    @movePlayer(1,0) if @game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)

    screenBottom = @game.height - BUTTON_HEIGHT
    if @game.input.activePointer.isDown && @game.input.activePointer.y < screenBottom
      screenLine1 = new Phaser.Line(0, 0, @game.width, screenBottom)
      screenLine2 = new Phaser.Line(@game.width, 0, 0, screenBottom)

      @game.debug.geom(screenLine1, 'rgb(0,255,0)') if drawDebug
      @game.debug.geom(screenLine2, 'rgb(255,0,0)') if drawDebug

      pointerLine = new Phaser.Line(
        @game.input.activePointer.x, 0,
        @game.input.activePointer.x, @game.input.activePointer.y)
      @game.debug.geom(pointerLine, 'rgb(0,0,255)') if drawDebug

      intersectTest1 = screenLine1.intersects(pointerLine) == null
      intersectTest2 = screenLine2.intersects(pointerLine) == null
      if intersectTest1 && intersectTest2
        @movePlayer(0,-1) #up
      else if intersectTest2
        @movePlayer(-1,0) #left
      else if intersectTest1
        @movePlayer(1,0) #right
      else
        @movePlayer(0,1) #down

    # quit to title
    if @game.input.gamepad.pad1.isDown(Phaser.Gamepad.BUTTON_3) or @game.input.keyboard.isDown(Phaser.Keyboard.BACKSPACE)
      @game.state.start('TitleScreen', true, false)


  render: () =>
    @textFPS.setText("FPS: " + @game.time.fps)
