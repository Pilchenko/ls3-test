import Foundation

// Sport car
struct SportCar {
    let marka: String
    let yearMaking: Int
    let volumeTrunk: Int
    var engineState: Bool
    var windowState: Bool
    var fullTrunkVolume: Int
    
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fullTrunk(cargo: Int)
        
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineState = true
            print("Двигатель: запущен")
        case .stopEngine:
            engineState = false
            print("Двигатель: заглушен")
        case .openWindow:
            windowState = true
            print("Окна: открыты")
        case .closeWindow:
            windowState = false
            print("Окна: закрыты")
        case .fullTrunk(let cargo):
            if cargo <= (volumeTrunk - fullTrunkVolume) {
                fullTrunkVolume += cargo
                print("заполнен на \(fullTrunkVolume) л.")
            } else {
                print("Недостаточно места для загрузки \(volumeTrunk - fullTrunkVolume)")
            }
        }
    }
    
    func printInfo(){
        print("Автомобиль марки: \(self.marka)")
        print("Год выпуска: \(self.yearMaking)")
        print("Объем багажника: \(self.volumeTrunk) литров")
        print("Двигатель: \(self.engineState ? "запущен" : "заглушен")")
        print("Окна: \(self.windowState ? "открыты" : "закрыты") ")
        print("Багажник заполнен на: \(self.fullTrunkVolume) л.")
    }
}
    
var tesla3 = SportCar(marka: "Tesla", yearMaking: 2019, volumeTrunk: 425, engineState: false, windowState: false, fullTrunkVolume: 200)

tesla3.printInfo()
tesla3.makeAction(action: .startEngine)
tesla3.makeAction(action: .openWindow)
tesla3.makeAction(action: .fullTrunk(cargo: 600))
print("-------------")

var hondaCRX = SportCar(marka: "Honda", yearMaking: 1996, volumeTrunk: 300, engineState: true, windowState: false, fullTrunkVolume: 0)

hondaCRX.printInfo()
hondaCRX.makeAction(action: .stopEngine)
hondaCRX.makeAction(action: .fullTrunk(cargo: 140))

// Trunk car

struct Trunkcar {
    let brand: String
    let model: String
    let makingYear: Int
    let trunkVolume: Int
    var stateEngine: Bool
    var stateWindow: Bool
    var volumeTrunkFull: Int
    
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fullTrunk(cargo: Int)
        
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            stateEngine = true
            print("Двигатель: запущен")
        case .stopEngine:
            stateEngine = false
            print("Двигатель: заглушен")
        case .openWindow:
            stateWindow = true
            print("Окна: открыты")
        case .closeWindow:
            stateWindow = false
            print("Окна: закрыты")
        case .fullTrunk(let cargo):
            if cargo <= (trunkVolume - volumeTrunkFull) {
                volumeTrunkFull += cargo
                print("заполнен на \(volumeTrunkFull) м. куб.")
            } else {
                print("Недостаточно места для загрузки \(trunkVolume - volumeTrunkFull)")
            }
        }
    }
    
    func printInfo(){
        print("Автомобиль марки: \(self.brand), модель \(self.model)")
        print("Год выпуска: \(self.makingYear)")
        print("Объем багажника: \(self.trunkVolume) м. куб.")
        print("Двигатель: \(self.stateEngine ? "запущен" : "заглушен")")
        print("Окна: \(self.stateWindow ? "открыты" : "закрыты") ")
        print("Багажник заполнен на: \(self.volumeTrunkFull) л.")
    }
}

var trunkScania = Trunkcar(brand: "Scania", model: "r730", makingYear: 2018, trunkVolume: 82, stateEngine: false, stateWindow: false, volumeTrunkFull: 0)

print("-----------")
trunkScania.printInfo()
trunkScania.makeAction(action: .startEngine)
trunkScania.makeAction(action: .fullTrunk(cargo: 70))

var trunkMersedes = Trunkcar(brand: "Mersedes-Benz", model: "Actros", makingYear: 2020, trunkVolume: 82, stateEngine: false, stateWindow: true, volumeTrunkFull: 0)

print("-----------")
trunkMersedes.printInfo()

