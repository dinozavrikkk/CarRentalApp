
import UIKit

final class DriverProfileViewController: UIViewController {

    private let driverProfile = DriverView()
    private let context = AppDataController.shared.context
    private let driverDataProvider: DriverDataProvider
    
    init(driverDataProvider: DriverDataProvider) {
        self.driverDataProvider = driverDataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = driverProfile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverProfile.delegateSave = self
        driverProfile.addTapGestureToHideKeyboard()
    }
    
    deinit {
        driverProfile.removeKeyboardNotification()
    }
    
}

//MARK: InfoAboutDriverDelegate
extension DriverProfileViewController: InfoAboutDriverDelegate {
   
    func saveChangesDidTap() {
        guard let imageData = driverProfile.userImage.image?.pngData() else { return }
        
        driverDataProvider.changingTheData(name: driverProfile.nameTextField.text ?? "", surname: driverProfile.surnameTextField.text ?? "", number: driverProfile.numberTextField.text ?? "", imageData: imageData)
        Alerts.getSaveChangeAlert()
    }
    
    func editPhotoDidTap() {
        Alerts.getPhotoAlert { [weak self] in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self?.present(picker, animated: true)
            
        } cameraCompletion: { [weak self] in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            self?.present(picker, animated: true)
            
        }
    }
    
}

//MARK: UINavigationControllerDelegate, UIImagePickerControllerDelegate
extension DriverProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            driverProfile.userImage.image = image
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}


