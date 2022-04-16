import UIKit

final class WordsView: UIView {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 50 
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Function
    private func makeConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func configure() {
        self.backgroundColor = .systemBackground
        addSubviews()
        makeConstraints()
    }
    
    
}
