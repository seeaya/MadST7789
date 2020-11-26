import SwiftIO
import MadDisplay
import MadST7789


let spi = SPI(Id.SPI0, speed: 60_000_000)
let dc = DigitalOut(Id.D1)
let rst = DigitalOut(Id.D0)
let bl = DigitalOut(Id.D4)
let screen = MadST7789(spi: spi, dc: dc, rst: rst, bl: bl, width: 320)
let display = MadDisplay(screen: screen)

let catFile = BMP(path: "/SD:/image/nyanCat.bmp")



let catBitmap = catFile.getBitmap()
let palette = catFile.getPalette()

let root = Group()

let bgBitmap = Bitmap(width: 320, height: 240, bitCount: 1)
let bgPalette = Palette(count: 1)
bgPalette[0] = palette[15]

let bgSprite = TileGrid(bitmap: bgBitmap, palette: bgPalette)
root.append(bgSprite)

display.show(root)

let cat1 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)

cat1.setTile(x: 0, y: 0, index: 0)


let cat2 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)

cat2.setTile(x: 0, y: 0, index: 1)


let cat3 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)

cat3.setTile(x: 0, y: 0, index: 2)


let cat4 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)

cat4.setTile(x: 0, y: 0, index: 3)

let rainbow1 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)
rainbow1.setTile(x: 0, y: 0, index: 4)


let rainbow2 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    tileWidth: 128,
                    tileHeight: 128)
rainbow2.setTile(x: 0, y: 0, index: 5)

root.append(rainbow1)

let name = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 1,
                    tileWidth: 128,
                    tileHeight: 128)
name.setTile(x: 0, y: 0, index: 6)
name.setTile(x: 1, y: 0, index: 7)



root.append(name)
name.setXY(x: 100, y: 100)


let rainbows = [rainbow1, rainbow2]
let cats = [cat1, cat2, cat3, cat4]



while true {
    var changeRainbow1 = true
    for cat in cats {
        root.append(cat)
        cat.setXY(x: 128, y: 0)
        if changeRainbow1 {
            root.remove(rainbow1)
            root.append(rainbow2)
            changeRainbow1.toggle()
        } else {
            root.remove(rainbow2)
            root.append(rainbow1)
            changeRainbow1.toggle()
        }
        display.show(root)
        root.remove(cat)
    }
}







while true {
    sleep(ms: 1000)
}