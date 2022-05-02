import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemGroupedBackground
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemGroupedBackground
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(labelTwo)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5)
        ])
        
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTwo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            labelTwo.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -5),
            labelTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
