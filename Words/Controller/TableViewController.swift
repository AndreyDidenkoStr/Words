import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var dataSource: [RealmDataModel] = []
    var dataProvider: RealmDataProviderProtocol
    
    init(dataProvider: RealmDataProviderProtocol = RealmDataProvider()) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 40
        loadData()
    }
    
    func loadData() {
        dataSource = dataProvider.obtainResults()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label.text = dataSource[indexPath.row].leftWord
        cell.labelTwo.text = dataSource[indexPath.row].rightWord
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataProvider.deleteObject(id: dataSource[indexPath.row]._id)
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        longPressToCell()
    }
