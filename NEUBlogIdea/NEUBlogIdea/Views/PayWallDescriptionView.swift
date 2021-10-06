//
//  PayWallDescriptionView.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/6/21.
//

import UIKit

class PayWallDescriptionView: UIView {
    private let descriptorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .medium)
        label.numberOfLines = 0
        label.text="Join premium to unlock advanced feature!"
        return label
        }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines=1
        label.text="$4.99/Month"
        return label
    }()
    override init(frame:CGRect){
        super.init (frame: frame)
        clipsToBounds=true
        addSubview(priceLabel)
        addSubview(descriptorLabel)
    }
    required init? (coder: NSCoder){
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptorLabel.frame=CGRect(x:20,y:0,width:width-40,height:height/2)
        priceLabel.frame=CGRect(x:20,y:height/2,width:width-40,height:height/2)
    }

}
