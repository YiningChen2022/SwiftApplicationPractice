//
//  ViewPostViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ViewPostViewController: UIViewController {
   
    @IBOutlet weak var titleField: UILabel!
    var email: String!
    var currpost: BlogPost!

  
    
    @IBOutlet weak var postusername: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var type: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        titleField.text=currpost.title
        type.text=currpost.type
        postusername.text=currpost.postUser
        
        postImage.layer.cornerRadius = 30
        postImage.clipsToBounds = true
        body.text=currpost.text
        body.numberOfLines=10
        //body.sizeToFit()
        
        if let url=currpost.headerImageUrl{
            let task = URLSession.shared.dataTask(with: url){
                [weak self] data, _, _ in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    print("fetching image")
                    self?.postImage.image=UIImage(data: data)
                }
            
        }
            task.resume()
        }
        // Do any additional setup after loading the view.
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
