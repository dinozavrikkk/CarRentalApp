
import Foundation
import UIKit

final class BrandsCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let rentalModel: DataModelExample
    weak var delegateChoosingListCar: ChooseCollectionViewProtocol?
    
    init(rentalModel: DataModelExample) {
        self.rentalModel = rentalModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rentalModel.modelsInRental.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as! BrandsCollectionViewCell
        cell.update(dataModel: rentalModel.modelsInRental[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataBMW)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 1:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataLamborghini)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 2:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataAudi)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 3:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataFerrari)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 4:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataJaguar)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 5:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataLexus)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 6:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataMercedes)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        case 7:
            let dataCars = BackendDataModels()
            let carsStorage = CarsStorage(cars: dataCars.dataPorsche)
            let obtainer = ObteinerForDataModel(dataStorage: carsStorage)
            let dataProvider = CarsDataProvider(obtainer: obtainer)
            delegateChoosingListCar?.updateCellsInTable(dataProvider: dataProvider)
        default: break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 79, height: 79)
    }
    
}


