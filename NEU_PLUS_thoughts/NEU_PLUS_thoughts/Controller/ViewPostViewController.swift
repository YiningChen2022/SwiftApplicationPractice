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

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var type: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(email)
        titleField.text=currpost.title
        type.text=currpost.type
        body.text=currpost.text
        
        // Do any additional setup after loading the view.
    }
   /* private let post:BlogPost
    
    
    init(post:BlogPost){
        self.post=post
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
