import Foundation
import UIKit



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.leftLabel.text = dataSource[indexPath.row].leftWord
        cell.rightLabel.text = dataSource[indexPath.row].rightWord
        return cell
    }
    
    func setBarButton() {
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(actionSelector)), animated: true)
        
    }
    
    @objc func actionSelector() {
        let alertController = UIAlertController(title: "Enter new words", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Save", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        print("selector")
    }
}
