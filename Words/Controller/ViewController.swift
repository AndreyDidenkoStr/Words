import UIKit

class ViewController: UIViewController {
    
    public let customView = WordsView()
    public var dataProvider: DataProviderProtocol
    public var dataSource: [Words] = []
    
    init(dataProvider: DataProviderProtocol = DataProvider()) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewAndButton()
        updateData()
    }
    
    //MARK: - Private Functions
    private func setupTableViewAndButton() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        setBarButton()
    }
    
    private func updateData() {
        dataSource = dataProvider.getWords()
        customView.tableView.reloadData()
    }
    
    

}

