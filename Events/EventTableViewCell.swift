//
//  EventTableViewCell.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var eventNameLabel: UILabel!
    var dateLabel: UILabel!
    var timeLabel: UILabel!
    var tagsLabel: UILabel!
    var organizerNameLabel: UILabel!
    var contactLabel: UILabel!
    var descriptionLabel: UILabel!
    //var infoLabel7: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        eventNameLabel = UILabel()
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        eventNameLabel.textColor = .black
        addSubview(eventNameLabel)
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .black
        addSubview(dateLabel)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = .black
        addSubview(timeLabel)
        
        tagsLabel = UILabel()
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsLabel.font = UIFont.systemFont(ofSize: 12)
        tagsLabel.textColor = .black
        addSubview(tagsLabel)
        
        organizerNameLabel = UILabel()
        organizerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        organizerNameLabel.font = UIFont.systemFont(ofSize: 12)
        organizerNameLabel.textColor = .black
        addSubview(organizerNameLabel)
        
        contactLabel = UILabel()
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.font = UIFont.systemFont(ofSize: 12)
        contactLabel.textColor = .black
        addSubview(contactLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .black
        addSubview(descriptionLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        
        eventNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        eventNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30).isActive = true
        eventNameLabel.widthAnchor.constraint(equalToConstant: frame.width * 0.75).isActive = true
        eventNameLabel.heightAnchor.constraint(equalToConstant: 15)
        
        dateLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
        timeLabel.leftAnchor.constraint(equalTo: dateLabel.rightAnchor, constant: 5).isActive = true
        timeLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 3).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
        tagsLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 5).isActive = true
        tagsLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 3).isActive = true
        tagsLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        tagsLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
        organizerNameLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor).isActive = true
        organizerNameLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        organizerNameLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        organizerNameLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
        contactLabel.leftAnchor.constraint(equalTo: organizerNameLabel.rightAnchor, constant: 5).isActive = true
        contactLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 3).isActive = true
        contactLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        contactLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
        descriptionLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: organizerNameLabel.bottomAnchor, constant: 3).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: eventNameLabel.widthAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalTo: eventNameLabel.heightAnchor).isActive = true
        
    }
    
    func configure(for events: Events){
        eventNameLabel.text = events.name
        dateLabel.text = events.date
        timeLabel.text = events.time
        tagsLabel.text = events.tags
        organizerNameLabel.text = events.organizerName
        contactLabel.text = events.organizerContact
        descriptionLabel.text = events.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
