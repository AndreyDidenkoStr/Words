import UIKit

class ViewController: UIViewController {
    
    public let customView = WordsView()
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewAndButton()
    }
    
    //MARK: - Private Functions
    private func setupTableViewAndButton() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        setBarButton()
    }
    
    

}

