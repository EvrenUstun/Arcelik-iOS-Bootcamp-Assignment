import UIKit

// enum I created for engine manufacturers.
enum EngineManufacturers{
    case Honda
    case Mercedes
    case Ferrari
}

// enum I created for tyre type.
enum TyreType{
    case Soft
    case Medium
    case Hard
    case Intermediate
    case Wet
}

// enum I created for calendar events.
enum CalendarEvent{
    case Practice
    case Qualify
    case Race
}

// struct for calendar.
struct Calendar{
    let everyFriday:CalendarEvent = .Practice
    let everySaturday:CalendarEvent = .Qualify
    let everySunday:CalendarEvent = .Race
}

// See F1 calendar
let calendar = Calendar()

print("Formula 1 Program")
print("Friday: \(calendar.everyFriday) \nSaturday: \(calendar.everySaturday) \nSunday: \(calendar.everySunday)\n")

// Class for formula 1 car and properties.
class FormulaOneCar{
    
    var driverName: String
    var teamName: String
    var sponsorName: [String]
    private var tyre: TyreType
    var engineManufacturers: EngineManufacturers
    
    init(_ driverName: String, _ teamName: String ,_ sponsorName: [String],_ tyre: TyreType,_ engineManufacturers: EngineManufacturers){
        self.driverName = driverName
        self.teamName = teamName
        self.sponsorName = sponsorName
        self.tyre = tyre
        self.engineManufacturers = engineManufacturers
    }

    func setTyre(tyre:TyreType){
        self.tyre = tyre
    }
    
    func getTyre() -> TyreType { tyre }

    func openDrs(){
        print("\(driverName) opened drs.\n")
    }
    
    /// This function change the tyre.
    /// - Parameter tyre: The tyre to be changed.
    func pitStop(tyre: TyreType?){
        setTyre(tyre: tyre ?? .Hard)
        print("Pit stop done. Changed tyre -> \(getTyre())\n")
    }
}

// Class for tracks.
class FormulaOneTracks{
    var trackName: [String]?
    var kmOfTrack: [String: Double]?
    
    init(_ trackName: [String]?, _ kmOfTrack: [String: Double]){
        self.trackName = trackName
        self.kmOfTrack = kmOfTrack
    }
}

// Create F1 car.
var car1 = FormulaOneCar("Max Verstappen", "Red Bull Racing",["Red Bull"], .Soft, .Honda)
var car2 = FormulaOneCar("Charles Leclerc", "Ferrari Racing", ["Shell"], .Medium, .Ferrari)

// car1 called openDrs func.
car1.openDrs()

// Changed tire from soft tire to medium tire
car1.setTyre(tyre: .Medium)

// car1 called pitStop func.
car1.pitStop(tyre: nil) // if we send nil, pitStop func set default value (hard).

// Create F1 tracks.
var tracks = FormulaOneTracks(["Circuit de Spa-Francorchamps", "Istanbul Park", "Monza"],
                              ["Circuit de Spa-Francorchamps": 6.979,"Istanbul Park": 5.338, "Monza": 5.793])

// if let sample.
if let trackName = tracks.trackName{
    print("Tracks and Length:")
    // Loop example.
    for track in trackName{
        print("\(track) -> \(tracks.kmOfTrack?[track] ?? 0) km")
    }
}else{
    print("Not found a track")
}

// guard let example.
/// This function print the km of the track we want
///
///
/// - Parameter trackName: The track name we want km.
func giveTrackKm(_ trackName: String){
    guard let trackIsPresent = tracks.kmOfTrack?[trackName] else{
        return
    }
    print("\n\(trackName) length: \(trackIsPresent)")
}

giveTrackKm("Istanbul Park")
giveTrackKm("Monaco")

// Control Flow example
// Created addSponsor func for team.
/// This function adding sponsor for car.
///
///
/// - Parameter car: The car to be sponsored.
func addSponsor(car: FormulaOneCar){
    if car.teamName == "Red Bull Racing" {
        car.sponsorName.append("Bybit")
        car.sponsorName.append("Oracle")
    }else if car.teamName == "Ferrari Racing"{
        car.sponsorName.append("Mission Winnow")
        car.sponsorName.append("Ray-Ban")
    }else {
        print("No team found for sponsor.")
    }
}

// Added sponsor for car2.
addSponsor(car: car2)
print("\ncar 2 sponsors:\n\(car2.sponsorName)\n")

// switch case example
/// This function finds the engine manufacturer of the desired car.
///
///
/// - Parameter car: The car whose engine manufacturer we want to find
func whichEngineManufacturer(_ car: FormulaOneCar){
    switch car.teamName {
    case "Red Bull Racing":
        print(EngineManufacturers.Honda)
    case "Ferrari Racing":
        print(EngineManufacturers.Ferrari)
    case "Mercedes Racing":
        print(EngineManufacturers.Mercedes)
    default:
        print("No suitable engine found.")
    }
}

whichEngineManufacturer(car1)
