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
    
    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    
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
        self.thumbnailImageView.kf.setImage(with: viewModel.imageUrl)
        self.thumbnailImageView.layoutIfNeeded()
        
        NSLayoutConstraint.activate([
            thumbnailImageView.heightAnchor.constraint(equalToConstant: viewModel.thumbnailHeight),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: viewModel.thumbnailWidth)
        ])
        
        let exclusionPath = UIBezierPath(rect: CGRect(x: 10, y: 10, width: viewModel.thumbnailWidth + 5, height: viewModel.thumbnailHeight + 5))
        self.contentText.textContainer.exclusionPaths = [exclusionPath]
        self.contentView.layoutIfNeeded()
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(contentText)
        contentView.addSubview(thumbnailImageView)

        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),

            contentText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contentText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
