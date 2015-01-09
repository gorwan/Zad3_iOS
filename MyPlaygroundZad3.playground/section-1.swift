// Playground - noun: a place where people can play

import UIKit

struct Coordinate {
    var latitude: Float
    var longitude: Float
    
    static func distanceBetweenCoordinates(#aCoordinate: Coordinate, bCoordinate: Coordinate) -> Float
    {
        let degrees: Float = 0.017453292519943295769236907684886
        let earth: Float = 6372797.560856
        
        var dlon = (aCoordinate.latitude - bCoordinate.latitude) * degrees
        var dlat = (aCoordinate.longitude - bCoordinate.longitude) * degrees
        
        var latitudeH = sin(dlon/2)
        latitudeH *= latitudeH
        var lontitudeH = sin(dlat/2)
        lontitudeH *= lontitudeH
        
        var c = 2.0 * asin(sqrt(latitudeH + cos(aCoordinate.latitude*degrees) * cos(bCoordinate.latitude*degrees) * lontitudeH))
        return earth * c
  
    }
}

class PointOfOne {
    let name: String
    let coordinate: Coordinate
    
    init(name: String, coordinate: Coordinate){
        self.name = name
        self.coordinate = coordinate
        
    }
    class func poid(#name:String, coordinate:Coordinate)-> String {
        return("\(name) - (\(coordinate.latitude), \(coordinate.longitude))")
    }
}

var items = [PointOfOne.poid(name: "BLStream Office", coordinate: Coordinate(latitude: 53.429204, longitude: 14.556324)),
    PointOfOne.poid(name: "Technopark Pomerania", coordinate: Coordinate(latitude: 53.449227, longitude: 14.537591)),
    PointOfOne.poid(name: "CH Kaskada", coordinate: Coordinate(latitude: 53.429204, longitude: 14.551453)),
    PointOfOne.poid(name: "MakKwak", coordinate: Coordinate(latitude: 53.428878, longitude: 14.554291))]

sort(&items) {$0 < $1}
println(items)

let reversed = sorted(items, <)
println(reversed)

var BLS = Coordinate.distanceBetweenCoordinates(aCoordinate: Coordinate(latitude: 53.429204, longitude: 14.556324), bCoordinate: Coordinate(latitude: 53.429204, longitude: 14.556324))
var Techno = Coordinate.distanceBetweenCoordinates(aCoordinate: Coordinate(latitude: 53.429204, longitude: 14.556324), bCoordinate: Coordinate(latitude: 53.449227, longitude: 14.537591))
var Kaskada = Coordinate.distanceBetweenCoordinates(aCoordinate: Coordinate(latitude: 53.429204, longitude: 14.556324), bCoordinate: Coordinate(latitude: 53.429204, longitude: 14.551453))
var Mak = Coordinate.distanceBetweenCoordinates(aCoordinate: Coordinate(latitude: 53.429204, longitude: 14.556324), bCoordinate: Coordinate(latitude: 53.428878, longitude: 14.554291))

let numberObject = [BLS,Techno,Kaskada,Mak]
let filtred = numberObject.filter{
    $0 < 500
}
println(filtred)

items[0...2]


