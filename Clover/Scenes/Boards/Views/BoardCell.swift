//
//  BoardCell.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit

class BoardCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitleText: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.isScrollEnabled = false
        label.isEditable = false
        label.isSelectable = false
        return label
    }()

    private var viewModel: BoardCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    func setup(viewModel: BoardCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.subtitleText.attributedText = viewModel.subtitle.htmlAttributedString(size: 16)
        self.subtitleText.setNeedsDisplay()
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleText)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleText.topAnchor, constant: -10),
            
            subtitleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            subtitleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            subtitleText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
