import UIKit

class CustomPageControl: UIView {
    
    var numberOfPages: Int = 0 {
        didSet {
            setupViews()
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            updateCurrentPage()
        }
    }
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupViews() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for index in 0..<numberOfPages {
            let dot = UIView()
            dot.backgroundColor = index == currentPage ? .black : .lightGray
            dot.layer.cornerRadius = index == 0 ? 4 : 2
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.heightAnchor.constraint(equalToConstant: index == 0 ? 8 : 4).isActive = true
            dot.widthAnchor.constraint(equalToConstant: index == 0 ? 16 : 4).isActive = true
            stackView.addArrangedSubview(dot)
        }
    }
    
    private func updateCurrentPage() {
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            view.backgroundColor = index == currentPage ? .black : .lightGray
            view.layer.cornerRadius = index == currentPage ? 4 : 2
            view.heightAnchor.constraint(equalToConstant: index == currentPage ? 8 : 4).isActive = true
            view.widthAnchor.constraint(equalToConstant: index == currentPage ? 16 : 4).isActive = true
        }
    }
}
