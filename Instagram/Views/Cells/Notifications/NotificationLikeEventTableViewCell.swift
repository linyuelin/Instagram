//
//  NotificationLikeEventTableViewCell.swift
//  Instagram
//
//  Created by dreaMTank on 2024/01/18.
//
import SDWebImage
import UIKit

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func didTapRelatedPostButton(model: UserNotification)
}

class NotificationLikeEventTableViewCell: UITableViewCell {

   static let identifier = "NotificationLikeEventTableViewCell"
    
    weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
    private var model: UserNotification?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.textColor = .label
        lable.numberOfLines = 0
        return lable
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(lable)
        contentView.addSubview(postButton)
    }
    
    public func configure(with model: UserNotification) {
        self.model = model 
        switch model.type {
        case .like(post: let post):
            break
            let thumbnail = post.thumbnailImage
            postButton.sd_setBackgroundImage(with: thumbnail, for: .normal , completed: nil)
        case .follow:
            break
        }
        lable.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postButton.setBackgroundImage(nil, for: .normal)
        lable.text = nil
        profileImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
