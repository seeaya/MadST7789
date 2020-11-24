import SwiftIO
import MadDisplay
import MadST7789


let spi = SPI(Id.SPI0, speed: 60_000_000)
let dc = DigitalOut(Id.D1)
let rst = DigitalOut(Id.D0)
let bl = DigitalOut(Id.D4)
let screen = MadST7789(spi: spi, dc: dc, rst: rst, bl: bl, width: 240)
let display = MadDisplay(screen: screen)



/*
func bmpFileTest() {

    let rootGroup = Group()


    let bmp1bit = BMP(path: "/SD:/image/bmp1bit.bmp")
    let tile1bit = TileGrid(bitmap: bmp1bit.bitmap, palette: bmp1bit.palette)
    rootGroup.append(tile1bit)
    display.show(rootGroup)
    sleep(ms: 2000)


    let bmp2bit = BMP(path: "/SD:/image/bmp2bit.bmp")
    let tile2bit = TileGrid(bitmap: bmp2bit.bitmap, palette: bmp2bit.palette)
    rootGroup.append(tile2bit)
    display.show(rootGroup)
    sleep(ms: 2000)




    let bmp4bit = BMP(path: "/SD:/image/bmp4bit.bmp")
    let tile4bit = TileGrid(bitmap: bmp4bit.bitmap, palette: bmp4bit.palette)
    rootGroup.append(tile4bit)
    display.show(rootGroup)
    sleep(ms: 2000)


    let bmp8bit = BMP(path: "/SD:/image/bmp8bit.bmp")
    let tile8bit = TileGrid(bitmap: bmp8bit.bitmap, palette: bmp8bit.palette)
    rootGroup.append(tile8bit)
    display.show(rootGroup)
    sleep(ms: 2000)




    let purple = BMP(path: "/SD:/image/purple.bmp")
    let tile8Purple = TileGrid(bitmap: purple.bitmap, palette: purple.palette)
    rootGroup.append(tile8Purple)
    display.show(rootGroup)

}
*/

/*
func shapeTest() {
    let rootGroup = Group()

    let b0 = Bitmap(width: 240, height: 240, bitCount: 1)
    let p0 = Palette(count: 1)
    p0[0] = 0xFF0000
    let bg0 = TileGrid(bitmap: b0, palette: p0)

    let b1 = Bitmap(width: 200, height: 200, bitCount: 1)
    let p1 = Palette(count: 1)
    p1[0] = 0x0000FF
    let bg1 = TileGrid(bitmap: b1, palette: p1, x: 20, y: 20)


    let bmp = BMP(path: "/SD:/image/bmp128x128_16tiles.bmp")
    let tileGrid = TileGrid(bitmap: bmp.bitmap, palette: bmp.palette, width: 2, height: 2, tileWidth: 32, tileHeight: 32)

    tileGrid.setTile(x: 0, y: 0, index: 15)
    tileGrid.setTile(x: 1, y: 0, index: 14)


    let numbers = TileGrid(bitmap: bmp.bitmap, palette: bmp.palette, width: 7, height: 7, tileWidth: 32, tileHeight: 32, defaultTile: 8)
    rootGroup.append(bg0)
    rootGroup.append(bg1)
    rootGroup.append(numbers)
    rootGroup.append(tileGrid)

    display.show(rootGroup)
    sleep(ms: 2000)

    tileGrid.setTile(x: 0, y: 1, index: 11)


    display.show(rootGroup)
    sleep(ms: 2000)






    let g1 = Group()
    let rect = Rect(x: 45, y: 80, width: 100, height: 50, fill: 0xFF00FF, outline: 0xFF0000)
    g1.append(rect)

    let roundRect = RoundRect(x: 20, y: 20, width: 100, height: 80, radius: 20, fill: 0x0000FF, outline: 0xFF0000, stroke: 5)
    g1.append(roundRect)

    let circle = Circle(x: 120, y: 120, radius: 50, fill: 0x0000FF)
    g1.append(circle)

    rootGroup.append(g1)
    display.show(rootGroup)
    sleep(ms: 2000)


    for i in 0..<200 {
        tileGrid.setXY(x: i, y: i)
        display.show(rootGroup)
    }


    let line = Line(x0: 239, y0: 0, x1: 0, y1: 239, color: 0x00FF00)
    g1.append(line)


    display.show(rootGroup)

}

*/


/*
func fontLabelTest() {
    let rootGroup = Group()

    var text = "Fuck the world!!!"


    let labelDefault = Label(y: 10)
    labelDefault.updateText(text)

    rootGroup.append(labelDefault)
    display.show(rootGroup)
    sleep(ms: 2000)



    text = "他们所有的设备和仪器彷佛都是有生命的"

    let cFont = PCFFont(path: "/SD:/font/NotoSansSC-Regular-16.pcf")
    let label = Label(y: 50, font: cFont)
    label.updateText(text)
    rootGroup.append(label)

    display.show(rootGroup)
}
*/


func basicTest() {
    let splash = Group()
    display.show(splash)

    let colorBitmap = Bitmap(width: 240, height: 240, bitCount: 1)
    let colorPalette = Palette(count: 1)
    colorPalette[0] = Color.red

    let bgSprite = TileGrid(bitmap: colorBitmap, palette: colorPalette)
    splash.append(bgSprite)

    let innerBitmap = Bitmap(width: 200, height: 200, bitCount: 1)
    let innerPalette = Palette(count: 1)
    innerPalette[0] = Color.purple

    let innerSprite = TileGrid(bitmap: innerBitmap, palette: innerPalette, x: 20, y: 20)
    splash.append(innerSprite)


    let label = Label(x: 20, y: 20, text: "Hello World!", color: Color.green, font: RobotRegular8())
    splash.append(label)
    

    display.show(splash)
}


sleep(ms: 1000)


basicTest()
//bmpFileTest()
//fontLabelTest()
//shapeTest()

while true {
    sleep(ms: 2000)
}











//print("bmp open over")



/*



*/