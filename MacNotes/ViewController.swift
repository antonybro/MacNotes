//
//  ViewController.swift
//  MacNotes
//
//  Created by Antony Yurchenko on 11/4/17.
//  Copyright © 2017 Antony Yurchenko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {

	@IBOutlet var textView: NSTextView!
	
	let key = "com.antonybrro.macnoteswidget.attrString"
	let suiteName = "group.com.antonybrro.macnotes"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		textView.delegate = self
	}
	
	override func viewWillAppear() {
		super.viewWillAppear()
		
		textView.textStorage?.mutableString.setString("")
		
		if let text = UserDefaults(suiteName: suiteName)?.string(forKey: key) {
			textView.textStorage?.append(NSAttributedString(string: text))
		}
	}
	
	func textDidChange(_ notification: Notification) {
		let text = textView.attributedString().string
		UserDefaults(suiteName: suiteName)?.set(text, forKey: key)
	}
}

