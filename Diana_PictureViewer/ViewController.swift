//
//  ViewController.swift
//  Diana_PictureViewer
//
//  Created by Diana Kanajeva in May of 2016.
//  Copyright © 2016 Diana Kanajeva. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var displayImage: NSImageView!
    @IBOutlet weak var pathTextField: NSTextField!
    @IBOutlet weak var displayImageView: NSImageView!
    @IBOutlet weak var displayScrollView: NSScrollView!
    @IBOutlet weak var imageCell: NSImageCell!
    
    private var tempPath: String!
    private var imgOriginalWidth: CGFloat!
    private var imgOriginalHeight: CGFloat!
    private var x: CGFloat!
    private var y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImageView.imageScaling = .ScaleAxesIndependently
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func openImage(sender: AnyObject) {
        let absoluteImagePath = pathTextField.stringValue
        if let img = NSImage(contentsOfFile: absoluteImagePath){
            tempPath = pathTextField.stringValue
            imgOriginalWidth = img.size.width
            imgOriginalHeight = img.size.height
           
            displayImageView.frame = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
            displayImageView.image = img
        }
    }

    @IBAction func magnificationRecognizer(sender: AnyObject) {
        if tempPath != nil {
             // Check that image is not too small (size at least 100 x 100)
            if ((displayImageView.frame.width * (sender.magnification + 1.0 )) > 100 ) &&  ((displayImageView.frame.height * (sender.magnification + 1.0)) > 100){
                // Expand an image
                displayImageView.frame = CGRect(x: 0, y: 0, width: displayImageView.frame.width * (sender.magnification + 1.0 ), height: displayImageView.frame.height * (sender.magnification + 1.0))
                // Change displayScrollView size
                displayScrollView.documentView?.setFrameSize(CGSize(width: displayImageView.frame.width, height: displayImageView.frame.height))
            }
        }
    }
}

