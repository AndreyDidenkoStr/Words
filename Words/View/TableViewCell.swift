import UIKit

final class TableViewCell: UITableViewCell {
    
    var label = UILabel()
    var rightLabel = UILabel()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(label)
        self.addSubview(rightLabel)
        
        setupLabel()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .systemGroupedBackground
        
        rightLabel.numberOfLines = 0
        rightLabel.adjustsFontSizeToFitWidth = true
        rightLabel.backgroundColor = .systemGroupedBackground
    }
    
    
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 35),
            label.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10)
        ])
        
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightLabel.heightAnchor.constraint(equalToConstant: 35),
            rightLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10)
        ])
        
        
    }
}
