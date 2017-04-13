//
//  PostsViewController.swift
//  Claws
//
//  Created by David Peredo on 4/7/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import UIKit

class PostsViewController: UITableViewController {
    var posts: [Post]?

    override func viewDidLoad() {
        super.viewDidLoad()

        LobstersClient.shared.getHottest {[weak self] (posts, error) in
            self?.posts = posts
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier)! as! PostCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let post = posts![indexPath.row]
        
        cell.titleLabel.text = post.title
        cell.authorLabel.text = post.submitter.username
        
        return cell
    }
}

