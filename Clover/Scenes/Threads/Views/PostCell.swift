//
//  PostCell.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit

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

    private var viewModel: PostCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    func setup(viewModel: PostCellViewModel) {
        self.viewModel = viewModel
        self.contentText.attributedText = viewModel.text?.htmlAttributedString(size: 16, color: .black)
        self.contentText.setNeedsDisplay()
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(contentText)
        
        NSLayoutConstraint.activate([
            contentText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            contentText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
