//
//  ViewInCampusLifeTableViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/14/21.
//

import UIKit

class ViewInCampusLifeTableViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate {
 
    
    
    var searchController = UISearchController()
    var filteredposts=[BlogPost]()
    var currentEmail:String?
    private var user:User?
    private var posts:[BlogPost]=[]
    private func fetchAllPosts(){
        
        print("Fetching home feed")
        
        DatabaseManager.shared.getAllPosts{[weak self] posts in self?.posts = posts
            
            self?.posts=posts.filter{
                posttype in
                let scopeMatch=( posttype.type.lowercased().contains("Campus Life".lowercased()))

                    return scopeMatch
                }
            self?.posts = posts.sorted{ $0.timestamp > $1.timestamp }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
    //fetch User
    private func fetchUser(email:String){
        DatabaseManager.shared.getUser(email: email){
            
            [weak self] user in
            guard let user = user else{
                return
            }
            self?.user = user
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        currentEmail=currentUserEmail
        fetchUser(email:currentEmail!)
        fetchAllPosts()
        initSearchController()
       
    }
    func  initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.enablesReturnKeyAutomatically=false
        searchController.searchBar.returnKeyType=UIReturnKeyType.done
        definesPresentationContext=true
        navigationItem.searchController=searchController
        navigationItem.hidesSearchBarWhenScrolling=false
        searchController.searchBar.scopeButtonTitles = ["All","roommate", "Airport" ,"apt","house"]
        searchController.searchBar.delegate=self
        
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (searchController.isActive){
            return filteredposts.count
        }
        return posts.count
    }
    func getDateFromTimeStamp(timeStamp : Double) -> String {

        let date = Date(timeIntervalSince1970:timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST") //
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
            return strDate
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let post=posts[indexPath.row]
        /*let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
         
        */
     
        let post:BlogPost!
        if (searchController.isActive){
            post = filteredposts[indexPath.row]
        }
        else{
            post = posts[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CampusLife") as! CampuslifeTableViewCell
        let time=getDateFromTimeStamp(timeStamp: post.timestamp)
        //cell.timefirld.text=time
        cell.timefield.text = time
        cell.typefield.text=post.type
        cell.titlefield.text=post.title
        cell.userNameField.text=post.postUser
        cell.imageView?.layer.cornerRadius = 4;
        //cell.imageView?.layer.masksToBounds = YES;
        
            // cell.detailTextLabel?.text=post.type
        //cell.imageView?.image=data.icons[0]
        if let url=post.headerImageUrl{
            let task = URLSession.shared.dataTask(with: url){
                [weak self] data, _, _ in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    print("fetching image")
                    
                    cell.imageView?.image=UIImage(data: data)
                }
            
        }
            task.resume()
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
     
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar=searchController.searchBar
        let scopeButton=searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText=searchBar.text!
        
        filterForSearchTextandScopeButton(searchText: searchText, scopeButton:scopeButton)
    }

    func filterForSearchTextandScopeButton(searchText:String,scopeButton:String="All"){
        filteredposts=posts.filter{
            posttype in
            let scopeMatch=(scopeButton == "All" || posttype.text.lowercased().contains(scopeButton.lowercased())||posttype.title.lowercased().contains(scopeButton.lowercased()))
            if (searchController.searchBar.text != ""){
                let searchTextMatch = posttype.title.lowercased().contains(searchText.lowercased())
                return scopeMatch && searchTextMatch
            }
            else{
                return scopeMatch
            }
            
            
        }
        tableView.reloadData()
    }
    //segue to detail post view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "campuslife"){
        
                let indexPath = tableView.indexPathForSelectedRow
                print(posts[indexPath!.row].title)
                let detailViewController = segue.destination as! ViewPostViewController
                detailViewController.email = currentEmail

                let post:BlogPost!
                if (searchController.isActive){
                    post = filteredposts[indexPath!.row]
                }
                else{
                    post = posts[indexPath!.row]
                }
                detailViewController.currpost=post
            }
        }
    

}
