//
//  ViewController.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 25/05/23.
//

import UIKit
import Combine
class ViewController: UIViewController {
    
    var posts : [Posts]?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var tableView: UITableView = {
        let tblView = UITableView(frame: .zero, style: .grouped)
        tblView.backgroundColor = .yellow
        return tblView
    }()
    
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        getPostListCombineWay()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        leading.isActive = true
        let trailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        trailing.isActive = true
        let top = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        top.isActive = true
        let bottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        bottom.isActive = true
    }
    
    // By Normal Way
    func getPostList() {
        NetworkManager.shared.getUserPosts(url: "https://jsonplaceholder.typicode.com/posts") { [ weak self] result in
            switch result{
            case .success( let posts):
                print(posts)
                self?.posts = posts
            case .failure(let error):
                print(error)
            }
        }
    }
    // By Combine Way
    func getPostListCombineWay(){
        NetworkManager.shared.getPostListByCombine(url: "https://jsonplaceholder.typicode.com/posts").sink {  aCompletion in
            switch aCompletion{
            case .finished:
                print("finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { [weak self] posts in
            self?.posts = posts
        }.store(in: &cancellables)
    }
}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = (self.posts?[indexPath.row].title ?? "")
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
