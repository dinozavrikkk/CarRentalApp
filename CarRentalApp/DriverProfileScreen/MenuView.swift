
import UIKit

final class MenuView: UIView {
    
    private lazy var titleGoOut: UIButton = {
       let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Go Out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goOutButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegateGoOutButton: ExitingTheAppDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [titleGoOut].forEach{ subview in addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleGoOut.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            titleGoOut.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
    }
    
    @objc private func goOutButtonDidTap() {
        delegateGoOutButton?.goOutButtonTapped()
    }
    
}
