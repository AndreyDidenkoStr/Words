import UIKit

final class TableViewCell: UITableViewCell {
    
    var leftLabel = UILabel()
    var rightLabel = UILabel()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(leftLabel)
        self.addSubview(rightLabel)
        
        setupLabel()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        leftLabel.numberOfLines = 0
        leftLabel.adjustsFontSizeToFitWidth = true
        leftLabel.backgroundColor = .systemGroupedBackground
        leftLabel.layer.masksToBounds = true
        leftLabel.layer.cornerRadius = 6
        leftLabel.textAlignment = .center
        
        rightLabel.numberOfLines = 0
        rightLabel.adjustsFontSizeToFitWidth = true
        rightLabel.backgroundColor = .systemGroupedBackground
        rightLabel.layer.masksToBounds = true
        rightLabel.layer.cornerRadius = 6
        rightLabel.textAlignment = .center
    }
    
    
    
    func setupConstraints() {
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            leftLabel.heightAnchor.constraint(equalToConstant: 35),
            leftLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -5)
        ])
        
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightLabel.heightAnchor.constraint(equalToConstant: 35),
            rightLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 5)
        ])
        
        
    }
}
