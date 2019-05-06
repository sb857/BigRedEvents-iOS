//
//  addViewController.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit
//import SnapKit

class addViewController: UIViewController {

    //var scrollView: UIScrollView!
    var row: Int!
    var event: Events!
    
    var stackView: UIStackView!
    
    var nameLabel: UILabel!
    var nameTextfield: UITextField!
    
    var dateLabel: UILabel!
    var dateTextfield: UITextField!
    
    var timeLabel: UILabel!
    var timeTextfield: UITextField!
    
    var tagLabel: UILabel!
    var tagTextfield: UITextField!
    
    var organizerLabel: UILabel!
    var organizerTextfield: UITextField!
    
    var contactLabel: UILabel!
    var contactTextfield: UITextField!
    
    var descriptionLabel: UILabel!
    var descriptionTextView: UITextField!
    
    var stateLabel: UILabel!
    var todayLabel: UILabel!
    var tomorrowLabel: UILabel!
    var comingSoonLabel: UILabel!
    var stateStackView: UIStackView!
    var stateSlider: UISlider!
    
    var saveButton: UIButton!
    var delegate: SaveButtonDelegate?
    
    let smallerPadding: CGFloat = 8
    let padding: CGFloat = 16
    let textfieldHeight: CGFloat = 40
    let labelHeight: CGFloat = 20
    
    let textFieldColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.1)
    let borderColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.2)
    let buttonColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "About Event"
        view.backgroundColor = .white
        
        //scrollView = UIScrollView()
        //scrollView.alwaysBounceVertical = true
        //view.addSubview(scrollView)
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameTextfield = UITextField()
        nameTextfield.delegate = self
        nameTextfield.placeholder = " Enter Event Name?"
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        nameTextfield.backgroundColor = textFieldColor
        nameTextfield.layer.cornerRadius = 10
        nameTextfield.layer.borderColor = borderColor.cgColor
        nameTextfield.layer.borderWidth = 1
        nameTextfield.returnKeyType = .done
        view.addSubview(nameTextfield)
        
        dateLabel = UILabel()
        dateLabel.text = "Date"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = .black
        view.addSubview(dateLabel)
        
        dateTextfield = UITextField()
        dateTextfield.delegate = self
        dateTextfield.placeholder = "Date as mm/dd/yy "
        dateTextfield.translatesAutoresizingMaskIntoConstraints = false
        dateTextfield.backgroundColor = textFieldColor
        dateTextfield.layer.cornerRadius = 10
        dateTextfield.layer.borderColor = borderColor.cgColor
        dateTextfield.layer.borderWidth = 1
        dateTextfield.returnKeyType = .done
        view.addSubview(dateTextfield)
        
        timeLabel = UILabel()
        timeLabel.text = "Time"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .black
        view.addSubview(timeLabel)
        
        timeTextfield = UITextField()
        timeTextfield.delegate = self
        timeTextfield.placeholder = "Event time in 00:00 format "
        timeTextfield.translatesAutoresizingMaskIntoConstraints = false
        timeTextfield.backgroundColor = textFieldColor
        timeTextfield.layer.cornerRadius = 10
        timeTextfield.layer.borderColor = borderColor.cgColor
        timeTextfield.layer.borderWidth = 1
        timeTextfield.returnKeyType = .done
        view.addSubview(timeTextfield)
        
        tagLabel = UILabel()
        tagLabel.text = "Category"
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.textColor = .black
        view.addSubview(tagLabel)
        
        tagTextfield = UITextField()
        tagTextfield.delegate = self
        tagTextfield.placeholder = "Food/Music/Games/Outdoor/Movies"
        tagTextfield.translatesAutoresizingMaskIntoConstraints = false
        tagTextfield.backgroundColor = textFieldColor
        tagTextfield.layer.cornerRadius = 10
        tagTextfield.layer.borderColor = borderColor.cgColor
        tagTextfield.layer.borderWidth = 1
        tagTextfield.returnKeyType = .done
        view.addSubview(tagTextfield)
        
        organizerLabel = UILabel()
        organizerLabel.text = "Organizer"
        organizerLabel.translatesAutoresizingMaskIntoConstraints = false
        organizerLabel.textColor = .black
        view.addSubview(organizerLabel)
        
        organizerTextfield = UITextField()
        organizerTextfield.delegate = self
        organizerTextfield.placeholder = "Add Organizer Name "
        organizerTextfield.translatesAutoresizingMaskIntoConstraints = false
        organizerTextfield.backgroundColor = textFieldColor
        organizerTextfield.layer.cornerRadius = 10
        organizerTextfield.layer.borderColor = borderColor.cgColor
        organizerTextfield.layer.borderWidth = 1
        organizerTextfield.returnKeyType = .done
        view.addSubview(organizerTextfield)
        
        contactLabel = UILabel()
        contactLabel.text = "Contact"
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.textColor = .black
        view.addSubview(contactLabel)
        
        contactTextfield = UITextField()
        contactTextfield.delegate = self
        contactTextfield.placeholder = "Enter Organizer Contact "
        contactTextfield.translatesAutoresizingMaskIntoConstraints = false
        contactTextfield.backgroundColor = textFieldColor
        contactTextfield.layer.cornerRadius = 10
        contactTextfield.layer.borderColor = borderColor.cgColor
        contactTextfield.layer.borderWidth = 1
        contactTextfield.returnKeyType = .done
        view.addSubview(contactTextfield)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .black
        view.addSubview(descriptionLabel)
        
        descriptionTextView = UITextField()
        descriptionTextView.delegate = self
        descriptionTextView.placeholder = "Describe the event briefly."
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionTextView.textColor = .black
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = textFieldColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderColor = borderColor.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.returnKeyType = .done
        view.addSubview(descriptionTextView)

        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.layer.backgroundColor = buttonColor.cgColor
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(addSaveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        
        setUpConstraints()
        
    }
    
    private func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            nameTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            //nameTextfield.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            nameTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            dateLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            dateTextfield.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            dateTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            dateTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            dateTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: dateTextfield.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            timeLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            timeTextfield.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            timeTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            timeTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            timeTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])
        
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: timeTextfield.bottomAnchor, constant: 10),
            tagLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            tagLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            tagTextfield.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8),
            tagTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            tagTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            tagTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])

        NSLayoutConstraint.activate([
            organizerLabel.topAnchor.constraint(equalTo: tagTextfield.bottomAnchor, constant: 10),
            organizerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            organizerLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            organizerTextfield.topAnchor.constraint(equalTo: organizerLabel.bottomAnchor, constant: 8),
            organizerTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            organizerTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            organizerTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])
        
        NSLayoutConstraint.activate([
            contactLabel.topAnchor.constraint(equalTo: organizerTextfield.bottomAnchor, constant: 10),
            contactLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            //contactLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contactLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            contactTextfield.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 8),
            contactTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            //contactTextfield.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contactTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            contactTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight),
            ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contactTextfield.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            //descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            //descriptionTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 1.5*textfieldHeight)
            ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant : 50),
            saveButton.widthAnchor.constraint(equalToConstant: 70)
            ])
    }
    
    @objc func addSaveButtonPressed() {
        postEvents(name: nameTextfield.text!, date: dateTextfield.text!, time: timeTextfield.text!, tags: tagTextfield.text!, description: descriptionTextView.text!, organizerName: organizerTextfield.text!, organizerContact: contactTextfield.text!, dorm_id: "1")
        navigationController?.popToRootViewController(animated: true)
        }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postEvents(name: String, date: String, time: String, tags: String, description: String, organizerName: String, organizerContact: String, dorm_id: String){
        NetworkManager.postEvents(name: nameTextfield.text!, date: dateTextfield.text!, time: timeTextfield.text!, tags: tagTextfield.text!, organizerName: organizerTextfield.text!, organizerContanct: contactTextfield.text!, description: descriptionTextView.text!, dorm_id: "1")
    }
}

extension addViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextfield.endEditing(true)
        dateTextfield.endEditing(true)
        timeTextfield.endEditing(true)
        tagTextfield.endEditing(true)
        organizerTextfield.endEditing(true)
        contactTextfield.endEditing(true)
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            descriptionTextView.resignFirstResponder()
            return false
        }
        return true
    }
}

