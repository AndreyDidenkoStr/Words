import Foundation
import UIKit

public var data = ["1", "2", "3", "4", "5"]

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.label.text = data[indexPath.row]
        return cell
    }
    
    
    func setBarButton() {
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil), animated: true)
    }
}
