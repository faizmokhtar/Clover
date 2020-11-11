//
//  PostCell.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit
import Kingfisher

class PostCell: UITableViewCell {

    private lazy var contentText: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.isScrollEnabled = false
        label.isEditable = false
        label.isSelectable = false
        return label
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var thumbnailHeightConstraint: NSLayoutConstraint!
    private var thumbnailWidthConstraint: NSLayoutConstraint!

    private var viewModel: PostCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        setupUI()
    }
    
    func setup(viewModel: PostCellViewModel) {
        self.viewModel = viewModel
        self.contentText.attributedText = viewModel.text?.htmlAttributedString(size: 16)
        self.contentText.setNeedsDisplay()
        self.thumbnailImageView.kf.setImage(with: viewModel.image())
        self.thumbnailImageView.setNeedsDisplay()
        
        self.thumbnailHeightConstraint.constant = viewModel.thumbnailHeight
        self.thumbnailWidthConstraint.constant = viewModel.thumbnailWidth
        self.contentView.layoutIfNeeded()
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(contentText)
        
        thumbnailWidthConstraint = thumbnailImageView.widthAnchor.constraint(equalToConstant:120)
        thumbnailHeightConstraint = thumbnailImageView.heightAnchor.constraint(equalToConstant: 120)

        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            thumbnailImageView.trailingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: -5),
            thumbnailHeightConstraint,
            thumbnailWidthConstraint,
            thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),

            contentText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            contentText.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
