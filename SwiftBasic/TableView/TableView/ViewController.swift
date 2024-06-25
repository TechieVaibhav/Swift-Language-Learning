//
//  ViewController.swift
//  TableView
//
//  Created by Vaibhav Sharma on 27/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!

    var viewModel = ViewModel()
    let CellID = "NameTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
    }

    func registerCell() {
        tblView.dataSource = self
        tblView.delegate = self
        let nib = UINib(nibName: CellID, bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: CellID)
    }
}
extension ViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadData().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as? NameTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.loadData()[indexPath.row]
        cell.updateCell(name: data.name)
        return cell
    }

}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


