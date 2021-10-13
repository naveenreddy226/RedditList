//
//  FeedTableviewCell.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import UIKit

class FeedTableviewCell: UITableViewCell {

    var titleLabel: UILabel!
    var feedImageView: UIImageView!
    var commentLabel: UILabel!
    var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func seData(data: ChildrenData) {
        titleLabel.text = data.title
        feedImageView.loadImageFromUrl(urlString: data.thumbnail)
        feedImageView.heightAnchor.constraint(equalToConstant: CGFloat(data.thumbnail_height ?? 140)).isActive = true
        feedImageView.widthAnchor.constraint(equalToConstant: CGFloat(data.thumbnail_width ?? 140)).isActive = true

        commentLabel.text = "Comments: \(data.num_comments)"
        scoreLabel.text = "Score: \(data.score)"
    }
    
    func commonInit() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        feedImageView = UIImageView()
        contentView.addSubview(feedImageView)
        
        commentLabel = UILabel()
        contentView.addSubview(commentLabel)
        scoreLabel = UILabel()
        contentView.addSubview(scoreLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: feedImageView.topAnchor).isActive = true
        titleLabel.contentMode = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        feedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        feedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        feedImageView.contentMode = .scaleAspectFit
        feedImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        feedImageView.bottomAnchor.constraint(equalTo: commentLabel.topAnchor).isActive = true

        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        commentLabel.topAnchor.constraint(equalTo: self.feedImageView.bottomAnchor).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        commentLabel.textColor = .lightGray
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: self.feedImageView.bottomAnchor).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scoreLabel.textColor = .lightGray

    }

}

