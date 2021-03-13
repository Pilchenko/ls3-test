import Cocoa

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
        case emptytrunk(cargo: Int)
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineState = true
            print("Запущен")
        case .stopEngine:
            engineState = false
            print("Заглушен")
        case .openWindow:
            windowState = true
            print("открыты")
        case .closeWindow:
            windowState = false
            print("закрыты")
        case .fullTrunk(let cargo):
            if cargo <= (volumeTrunk - fullTrunkVolume) {
                fullTrunkVolume += cargo
                print("заполнен на \(fullTrunkVolume) л.")
            } else {
                print("Недостаточно места для загрузки \(volumeTrunk - fullTrunkVolume)")
            }
        case .emptytrunk(let cargo):
            if cargo <= fullTrunkVolume {
                print("недостаточное кол-во груза")
            } else {
                fullTrunkVolume -= cargo
                print("Багажник заполнен")
            }
        }
    }
    
    func printInfo(){
    print("Автомобиль марки: \(self.marka)")
    print("Год выпуска: \(self.yearMaking)")
    print("Объем багажника: \(self.volumeTrunk) литров")
    print("Двигатель: \(self.engineState ? "запущен." : "заглушен.")")
    print("Окна: \(self.windowState ? "открыты." : "закрыты.") ")
    print("Багажник заполнен на: \(self.volumeTrunk) л.")
    }
}
    
var car1 = SportCar(marka: "Audi", yearMaking: 2020, volumeTrunk: 500, engineState: false, windowState: false, fullTrunkVolume: 199)

car1.printInfo()
car1.makeAction(action: .startEngine)
car1.makeAction(action: .openWindow)
car1.makeAction(action: .fullTrunk(cargo: 100))
print("-------------")
car1.printInfo()
