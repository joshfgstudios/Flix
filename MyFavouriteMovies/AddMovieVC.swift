//
//  AddMovieVC.swift
//  MyFavouriteMovies
//
//  Created by Joshua Ide on 6/02/2016.
//  Copyright © 2016 Fox Gallery Studios. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //Properties
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPlot: UITextField!
    @IBOutlet weak var txtIMDB: UITextField!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var btnAddMovie: UIButton!
    
    //Variables
    var imagePicker: UIImagePickerController!
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        txtTitle.delegate = self
        txtPlot.delegate = self
        txtIMDB.delegate = self
        addDoneButtonToKeyboard()
        
        imgMovie.layer.cornerRadius = imgMovie.frame.size.width / 4
        imgMovie.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imgMovie.image = image
        hideAddImageText()
    }
    
    func addDoneButtonToKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRectMake(0, 0, 400, 35))
        doneToolbar.barStyle = UIBarStyle.Default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.Done, target: self, action: Selector("dismissKeyboard"))
        
        var items = [AnyObject]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        
        self.txtTitle.inputAccessoryView = doneToolbar
        self.txtPlot.inputAccessoryView = doneToolbar
        self.txtIMDB.inputAccessoryView = doneToolbar
    }
    
    func hideAddImageText() {
        btnAddMovie.setTitle("", forState: .Normal)
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }

    //Actions
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func createMovie(sender: AnyObject) {
            if let title = txtTitle.text where title != "" {
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
                let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
                movie.title = title
                movie.plot = txtPlot.text
                movie.imdbLink = txtIMDB.text
                movie.setMovieImage(imgMovie.image!)
                
                context.insertObject(movie)
                do {
                    try context.save()
                } catch {
                    print("Could not save movie.")
                }
                
                dismissViewControllerAnimated(true, completion: nil)
            }
    }
    
    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}
