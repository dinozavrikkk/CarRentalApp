//
//  DriverProfileFrameExampleView.swift
//  CarRentalApp
//
//  Created by admin on 22.05.2022.
//

import UIKit

final class DriverProfileFrameExampleView: UIView {
    
    private lazy var ellipse: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 95
        return view
    }()
    
    private lazy var choosePhotoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Choose photo"
        return label
    }()
    
    private lazy var whiteCar: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "whiteCar")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true // Если бы у меня картинка была размером больше, чем эллипс в котором она лежит, она бы не вылезла за его границы
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(whiteCarDidTap))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//       let view = super.hitTest(point, with: event)
//        print(view ?? "warning")
//        return view
//    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        let extendedFrameEllipse = CGRect(origin: ellipse.frame.origin, size: .init(width: ellipse.frame.width + 30, height: ellipse.frame.height + 30))
        print(extendedFrameEllipse.contains(point))
        return extendedFrameEllipse.contains(point)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        addSubview(ellipse)
        addSubview(choosePhotoLabel)
        addSubview(whiteCar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        ellipse.frame = CGRect(x: 100, y: 100, width: 190, height: 190)
        choosePhotoLabel.frame = CGRect(x: 120, y: 100 + 190 + 20, width: 250, height: 50)
        whiteCar.frame = CGRect(x: ellipse.frame.origin.x + 45, y: ellipse.frame.origin.y + 40, width: 100, height: 100)
        print("frame: \(ellipse.frame)")
        print("bounds: \(ellipse.bounds)")
    }
    
    @objc private func whiteCarDidTap(_ gesture: UITapGestureRecognizer) {
        UIView.animateKeyframes(withDuration: 3.5, delay: 0, options: .calculationModeCubicPaced) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.whiteCar.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
            }
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.5) {
                self.whiteCar.transform = CGAffineTransform(scaleX: 4, y: 4)
            }
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.5) {
                self.whiteCar.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 2, relativeDuration: 1) {
                self.whiteCar.center = CGPoint(x: self.ellipse.frame.origin.x + 90, y: self.ellipse.frame.origin.y + 90)
            }
            UIView.addKeyframe(withRelativeStartTime: 3, relativeDuration: 0.5) {
                self.whiteCar.transform = CGAffineTransform(scaleX: -2, y: 2)
            }
        }
    }

}
