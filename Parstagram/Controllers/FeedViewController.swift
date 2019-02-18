//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Chase Carnaroli on 2/17/19.
//  Copyright © 2019 Chase Carnaroli. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getPosts()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getPosts()
        self.tableView.reloadData()
    }
    
    func getPosts(){
        let query = PFQuery(className: "Post")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.PostCell.rawValue) as! PostCell
        
        let post = posts[indexPath.row]
        let user = post["author"] as! PFUser
        let imageFile = post["image"] as! PFFileObject
        let url = URL(string: imageFile.url!)!
        
        cell.usernameLabel.text = user.username
        cell.commentLabel.text = (post["caption"] as! String)
        cell.postImage.af_setImage(withURL: url)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
