import Foundation
import UIKit

extension TableViewController {
    
    func addBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(senderAddNewObject))
    }
    
    @objc func senderAddNewObject() {
        
        let alert = UIAlertController(title: "Add new words", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "English word"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Russian word"
        }
        let arr = alert.textFields
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self] (alertAction) in
            guard arr![0].text == "" && arr![1].text == ""  else {
                print("GUARD IS DONE")
                self.dataProvider.addDataObject(leftWord: arr![1].text!.capitalized, rightWord: arr![0].text!.capitalized)
                loadData()
                return
            }
        } ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func senderUpdateObject(indexPath: Int) {
        
        let alert = UIAlertController(title: "Edit words", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "English word"
            textField.text = self.dataSource[indexPath].rightWord
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Russian word"
            textField.text = self.dataSource[indexPath].leftWord
        }
        let arr = alert.textFields
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self] (alertAction) in
            guard arr![0].text == "" && arr![1].text == ""  else {
                self.dataProvider.updateObject(id: dataSource[indexPath]._id, leftWord: arr![1].text!.capitalized, rightWord: arr![0].text!.capitalized)
                loadData()
                return
            }
        } ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func longPressToCell() {
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        longPress.minimumPressDuration = 1
        tableView.addGestureRecognizer(longPress)
    }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        
        let touch = sender.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: touch) {
            senderUpdateObject(indexPath: indexPath.row)
        }
    }
}
