//
//  AccountFooterView.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 12/18/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

let kAccountFooterViewHeight: CGFloat = 65

protocol AccountFooterDelegate: class {
    func footerViewDidTapLogout(_ footerView: AccountFooterView)
}

class AccountFooterView: UIView {
    @IBOutlet private weak var logoutButton: UnderlinedButton!
    
    @IBOutlet fileprivate weak var logoutUnderlineView: UIView!
    
    weak var delegate: AccountFooterDelegate?
    
    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    // MARK: - Setup
    
    private func commonInit() {
        loadFromNib()
        setupViews()
    }
    
    private func setupViews() {
        logoutButton.setTitle("Button.Logout".localizable.uppercased(), for: .normal)
        logoutButton.delegate = self
    }
    
    // MARK: - Action
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        delegate?.footerViewDidTapLogout(self)
    }
}

// MARK: - UnderlinedButtonDelegate

extension AccountFooterView: UnderlinedButtonDelegate {
    func underlinedButton(_ button: UnderlinedButton, didChangeState isHighlighted: Bool) {
        logoutUnderlineView.isHidden = isHighlighted
    }
}