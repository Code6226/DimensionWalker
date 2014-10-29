class Game.StateGame extends Phaser.State
  constructor: -> super

  textFPS: null
  player: null

  mapObjects: null
  mapCurrentDim: null
  mapCurrentLev: null

  BUTTON_HEIGHT = 100

  levels: [
    {
      level: 1
      dimensions: [
        {
          name: 'red'
          data: [
            [ 0, 1, 1, 0, 0 ],
            [ 0, 1, 0, 0, 1 ],
            [ 0, 0, 0, 1, 1 ],
            [ 1, 1, 0, 0, 0 ],
            [ 1, 1, 1, 1, 2 ],
          ]
        }
      ]
    }
    {
      level: 2
      dimensions: [
        {
          name: 'green'
          data: [
            [ 0, 1, 1, 0, 0 ],
            [ 0, 1, 0, 0, 1 ],
            [ 0, 0, 0, 1, 1 ],
            [ 1, 1, 0, 0, 0 ],
            [ 1, 1, 1, 1, 2 ],
          ]
        },
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
    }
    {
      level: 3
      dimensions: [
        {
          name: 'red'
          data: [
            [ 0, 1, 1, 1, 1 ],
            [ 0, 1, 1, 1, 1 ],
            [ 0, 2, 1, 1, 1 ],
            [ 1, 1, 1, 1, 1 ],
            [ 1, 1, 1, 1, 1 ],
          ]
        },
        {
          name: 'green'
          data: [
            [ 0, 1, 1, 0, 0 ],
            [ 0, 1, 0, 0, 1 ],
            [ 0, 0, 0, 1, 1 ],
            [ 1, 1, 0, 0, 0 ],
            [ 1, 1, 1, 1, 1 ],
          ]
        }
        {
          name: 'blue'
          data: [
            [ 0, 1, 1, 0, 0 ],
            [ 0, 1, 0, 0, 1 ],
            [ 0, 0, 0, 1, 1 ],
            [ 1, 1, 0, 0, 0 ],
            [ 1, 1, 1, 1, 2 ],
          ]
        }
      ]
    }
  ]

  loadDimensionPicker: =>
    dimPicker = new Game.DimensionPicker(@game, @flipToDim)
    dimPicker.load(@levels[@mapCurrentLev].dimensions)

  flipToNextLev: =>
    if @mapCurrentLev == null
      @mapCurrentLev = 0
    else
      @mapCurrentLev += 1

    if @levels[@mapCurrentLev]?
      @flipToDim(0)
      @loadDimensionPicker()
    else
      @mapCurrentLev = null
      @mapCurrentDim = 0
      @game.state.start('Win', true, false)


  flipToDim: (mapIndex) =>
    @mapCurrentDim = mapIndex
    # remove and destroy all walls
    @mapObjects.removeAll(true)

    for xBundle,yIndex in @levels[@mapCurrentLev].dimensions[@mapCurrentDim].data
      for type,xIndex in xBundle
        if type == 1
          wall = new Game.Wall(@game, @, xIndex, yIndex, @levels[@mapCurrentLev].dimensions[@mapCurrentDim].name)
          @mapObjects.add(wall)
        else if type == 2
          wall = new Game.Wall(@game, @, xIndex, yIndex, 'goal')
          @mapObjects.add(wall)

  movePlayer: (mapX, mapY) =>
    if @isSpace(@player.mapX, @player.mapY)
      destX = @player.mapX + mapX
      destY = @player.mapY + mapY

      if @isSpace(destX, destY) || @isGoal(destX, destY)
        @player.mapMove(destX, destY)

  isGoal: (mapX, mapY) =>
    @levels[@mapCurrentLev].dimensions[@mapCurrentDim].data[mapY]?[mapX] == 2

  isSpace: (mapX, mapY) =>
    @levels[@mapCurrentLev].dimensions[@mapCurrentDim].data[mapY]?[mapX] == 0

  create: () =>
    @game.world.setBounds(0, 0, 20000, 20000)

    @mapObjects = @game.add.group()
    @flipToNextLev()
    @flipToDim(0)

    @player = new Game.Player(@game, @, 2, 2)
    @game.camera.follow(@player)
#    @game.camera.focusOnXY(0, 0)

    #FPS
    @game.time.advancedTiming = true
    @textFPS = @add.text(520, 30, "FPS", { font: "30px Arial", fill: "rgb(1, 51, 209)", align: "center" })
    @textFPS.fixedToCamera = true
    @textFPS.anchor.setTo(0.5, 0)

    @loadDimensionPicker()

    @game.input.keyboard.addKey(Phaser.Keyboard.ONE).onDown.add(() => @flipToDim(0))
    @game.input.keyboard.addKey(Phaser.Keyboard.TWO).onDown.add(() => @flipToDim(1))


    @screenBottom = @game.height - BUTTON_HEIGHT
    @screenLine1 = new Phaser.Line(0, 0, @game.width, @screenBottom)
    @screenLine2 = new Phaser.Line(@game.width, 0, 0, @screenBottom)
    @pointerLine = new Phaser.Line(0,0,0,0)


  update: () =>
    @movePlayer( 0, 1 ) if @game.input.keyboard.isDown(Phaser.Keyboard.DOWN)
    @movePlayer( 0,-1 ) if @game.input.keyboard.isDown(Phaser.Keyboard.UP)
    @movePlayer(-1, 0 ) if @game.input.keyboard.isDown(Phaser.Keyboard.LEFT)
    @movePlayer( 1, 0 ) if @game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)

    if @game.input.activePointer.isDown && @game.input.activePointer.y < @screenBottom
      @pointerLine.setTo(
        @game.input.activePointer.x, 0,
        @game.input.activePointer.x, @game.input.activePointer.y)

      intersectTest1 = @screenLine1.intersects(@pointerLine) == null
      intersectTest2 = @screenLine2.intersects(@pointerLine) == null
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

    if @isGoal(@player.mapX, @player.mapY) && !@player.isMoving()
      @player.mapWarp(0,0)
      @flipToNextLev()


  render: () =>
    @textFPS.setText("FPS: " + @game.time.fps)
