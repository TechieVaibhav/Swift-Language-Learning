//
//  ViewController.swift
//  LoadDataInTableViewMVVM
//
//  Created by Vaibhav Sharma on 15/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellID = "DataTableViewCell"
    
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //register()
       // setupDelegateAndDataSource()
        viewModel.fetchData { user in
            print("**** user : \(user)***")
        } onFailure: { err in
            print("**** err : \(err)***")
        }

    }
    func setupDelegateAndDataSource() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func register() {
        let nib = UINib(nibName: cellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }
}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadData().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? DataTableViewCell else {
            return UITableViewCell()
        }
        let arr = viewModel.loadData()
        cell.updateCellData(user: arr[indexPath.row])
        return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
