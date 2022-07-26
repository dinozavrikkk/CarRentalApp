
import UIKit

class DriverProfileViewController: UIViewController {

    private let driverProfile = DriverView()
    private let driverDatabase = DriverDatabaseStorage()
    private let context = AppDataController.shared.context

    
    override func loadView() {
        view = driverProfile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverProfile.delegateSave = self
    }
    
    deinit {
        driverProfile.removeKeyboardNotification()
    }
    
}

extension DriverProfileViewController: ProtocolInfoAboutDriver {
   
    func saveChangesDidTap() {
        guard let imageData = driverProfile.userImage.image?.pngData() else { return }
        
        driverDatabase.driverDatabaseIsEmpty { [weak self] databaseIsEmpty in
            if databaseIsEmpty == true {
                self?.driverDatabase.save(id: UUID(), name: self?.driverProfile.nameTextField.text ?? "", surname: self?.driverProfile.surnameTextField.text ?? "", number: self?.driverProfile.numberTextField.text ?? "", imageData: imageData)
            } else {
                self?.driverDatabase.editDriverModel(name: self?.driverProfile.nameTextField.text ?? "", surname: self?.driverProfile.surnameTextField.text ?? "", number: self?.driverProfile.numberTextField.text ?? "", imageData: imageData)
            }
        }
        Alerts.getSaveChangeAlert()
    }
    
    func editPhotoDidTap() {
        Alerts.getPhotoAlert { [weak self] in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            self?.present(picker, animated: true)
            
        } cameraCompletion: { [weak self] in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = false
            self?.present(picker, animated: true)
            
        }
    }
    
}

extension DriverProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            driverProfile.userImage.image = image
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}


