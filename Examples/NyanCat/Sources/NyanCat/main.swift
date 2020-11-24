import SwiftIO
import MadDisplay
import MadST7789


let spi = SPI(Id.SPI0, speed: 60_000_000)
let dc = DigitalOut(Id.D1)
let rst = DigitalOut(Id.D0)
let bl = DigitalOut(Id.D4)
let screen = MadST7789(spi: spi, dc: dc, rst: rst, bl: bl, width: 240)
let display = MadDisplay(screen: screen)

let catFile = BMP(path: "/SD:/image/nyanCat.bmp")



let catBitmap = catFile.getBitmap()
let palette = catFile.getPalette()

let root = Group()

let bgBitmap = Bitmap(width: 240, height: 240, bitCount: 1)
let bgPalette = Palette(count: 1)
bgPalette[0] = palette[15]

let bgSprite = TileGrid(bitmap: bgBitmap, palette: bgPalette)
root.append(bgSprite)

display.show(root)

let cat1 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)

cat1.setTile(x: 0, y: 0, index: 0)
cat1.setTile(x: 1, y: 0, index: 1)
cat1.setTile(x: 0, y: 1, index: 6)
cat1.setTile(x: 1, y: 1, index: 7)


let cat2 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)

cat2.setTile(x: 0, y: 0, index: 2)
cat2.setTile(x: 1, y: 0, index: 3)
cat2.setTile(x: 0, y: 1, index: 8)
cat2.setTile(x: 1, y: 1, index: 9)


let cat3 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)

cat3.setTile(x: 0, y: 0, index: 12)
cat3.setTile(x: 1, y: 0, index: 13)
cat3.setTile(x: 0, y: 1, index: 18)
cat3.setTile(x: 1, y: 1, index: 19)


let cat4 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)

cat4.setTile(x: 0, y: 0, index: 14)
cat4.setTile(x: 1, y: 0, index: 15)
cat4.setTile(x: 0, y: 1, index: 20)
cat4.setTile(x: 1, y: 1, index: 21)

let rainbow1 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 1,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)
rainbow1.setTile(x: 0, y: 0, index: 4)
rainbow1.setTile(x: 0, y: 1, index: 10)



let rainbow2 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 1,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)
rainbow2.setTile(x: 0, y: 0, index: 4)
rainbow2.setTile(x: 0, y: 1, index: 10)



let rainbow3 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 1,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)
rainbow3.setTile(x: 0, y: 0, index: 4)
rainbow3.setTile(x: 0, y: 1, index: 10)

let rainbow4 = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 1,
                    height: 2,
                    tileWidth: 32,
                    tileHeight: 32)
rainbow4.setTile(x: 0, y: 0, index: 4)
rainbow4.setTile(x: 0, y: 1, index: 10)


let name = TileGrid(bitmap: catBitmap,
                    palette: palette,
                    width: 2,
                    height: 1,
                    tileWidth: 32,
                    tileHeight: 32)
name.setTile(x: 0, y: 0, index: 22)
name.setTile(x: 1, y: 0, index: 23)



root.append(name)
root.append(rainbow1)
root.append(rainbow2)
root.append(rainbow3)
root.append(rainbow4)



name.setXY(x: 175, y: 200)
rainbow1.setXY(x: 0, y: 96)
rainbow2.setXY(x: 32, y: 96)
rainbow3.setXY(x: 64, y: 96)
rainbow4.setXY(x: 96, y: 96)

let cats = [cat1, cat2, cat3, cat4]



while true {
    for cat in cats {
        root.append(cat)
        cat.setXY(x: 128, y: 96)
        display.show(root)
        root.remove(cat)
        sleep(ms: 100)
    }
}







while true {
    sleep(ms: 1000)
}