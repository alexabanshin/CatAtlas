import UIKit
import Kingfisher

final class MainCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let originLabel = UILabel()
    private let breedLabel = UILabel()
    private let labelsStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: BreedUI) {
        self.breedLabel.text = model.breed
        self.originLabel.text = model.origin
        
        imageView.kf.setImage(with: model.url, placeholder: UIImage(named: "default"))
    }
}

private extension MainCell {
    func setupViews() {
        setupContentView()
        setupImageView()
        setupLabelsStack()
    }
    
    private func setupContentView() {
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
    }
    
    private func setupLabelsStack() {
        originLabel.text = "origun"
        breedLabel.text = "breed"
        
        originLabel.font = UIFont.systemFont(ofSize: 14)
        originLabel.textColor = .gray
        breedLabel.font = UIFont.boldSystemFont(ofSize: 16)
        breedLabel.textColor = .black
        
        labelsStack.axis = .vertical
        labelsStack.spacing = 2              // расстояние между лейблами
        labelsStack.alignment = .leading
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.addArrangedSubview(originLabel)
        labelsStack.addArrangedSubview(breedLabel)
        contentView.addSubview(labelsStack)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            // Картинка сверху, пропорция 0.7 по высоте
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            // Стек с лейблами снизу
            labelsStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            labelsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            labelsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            labelsStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
}
