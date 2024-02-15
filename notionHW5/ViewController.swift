//
//  ViewController.swift
//  notionHW5
//
//  Created by Захар Литвинчук on 11.01.2024.
//

import UIKit
import SnapKit

struct SectionName {
    
    static let media: String? = "Media"
    static let preferences: String? = "Preferences"
    static let account: String? = "Account"
    
}


final class ViewController: UIViewController {
    
    //MARK: - UI Elements
    private let backgroundImageView = UIImageView()
    private let profileImageView = UIImageView()
    private let fullnameLabel = UILabel()
    private let emailLabel = UILabel()
    private var tableView = UITableView(frame: .zero, style: .grouped)
    private let mySwitch = UISwitch()
    
    var items = Source.makeItemsWithGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedViews()
        setupLayout()
        setupAppearance()
        setupText()
        setupBehavior()
    }
}


//MARK: - Embed Views
private extension ViewController {
    
    func embedViews() {
        [
            backgroundImageView,
            profileImageView,
            fullnameLabel,
            emailLabel,
            tableView
        ].forEach { view.addSubview($0) }
        
        view.sendSubviewToBack(backgroundImageView)
    }
    
}

//MARK: - Setup Layout
private extension ViewController {
    
    func setupLayout() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(34)
            make.centerX.equalToSuperview()
        }
        
        
        fullnameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(fullnameLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(40)
        }
        
    }
    
}

//MARK: - Setup Appearance
private extension ViewController {
    
    func setupAppearance() {
        backgroundImageView.image = UIImage(named: "bg")
        backgroundImageView.contentMode = .scaleAspectFill
        
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 24
        
        profileImageView.image = .profile
        
        fullnameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        fullnameLabel.textColor = .label
        
        emailLabel.font = .systemFont(ofSize: 14, weight: .regular)
        emailLabel.textColor = .secondaryLabel
        
        [fullnameLabel, emailLabel].forEach { label in
            label.numberOfLines = 0
            label.textAlignment = .center
        }
        
    }
    
}

//MARK: - Setup Text
private extension ViewController {
    
    func setupText() {
        fullnameLabel.text = "Jose Phonie"
        emailLabel.text = "JosePhonie123@gmail.com"
    }
    
}

//MARK: - Setup Behavior
private extension ViewController {
    
    func setupBehavior() {
        tableView.register(ItemsCell.self, forCellReuseIdentifier: "ItemsCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        mySwitch.addTarget(self, action: #selector(switchAction(sender:)), for: .valueChanged)
    }
    
    @objc
    func switchAction(sender: UISwitch) {
        print("ok")
        
        if mySwitch.isOn {
            let ac = UIAlertController(title: "It Work's", message: "some context message", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default) { _ in
                self.dismiss(animated: true)
            }
            ac.addAction(action)
            present(ac, animated: true)
        } else {
            mySwitch.isOn = false
        }
        
    }
}


//MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = .systemGray6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: items[indexPath.section][indexPath.row].title, message: items[indexPath.section][indexPath.row].title, preferredStyle: .alert)
        
        ac.addAction(.init(title: "ok", style: .default))
        present(ac, animated: true)
    }
}

//MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return SectionName.media
        case 1: return SectionName.preferences
        case 2: return SectionName.account
        default: return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as? ItemsCell
        else { fatalError() }
        
        cell.configure(item: items[indexPath.section][indexPath.row])
        
        if items[indexPath.section][indexPath.row].hasSwitch {
            cell.accessoryView = mySwitch
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    
}
