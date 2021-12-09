//
//  ViewPostViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ViewPostViewController: UIViewController {
   
    @IBOutlet weak var titleField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleField.text=post.title
        // Do any additional setup after loading the view.
    }
    private let post:BlogPost
    
    
    init(post:BlogPost){
        self.post=post
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
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
