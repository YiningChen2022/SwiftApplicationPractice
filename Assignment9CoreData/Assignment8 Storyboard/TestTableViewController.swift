//
//  TestTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/19/21.
//

import UIKit
import CoreData
class TestTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    var testModel = [Test]()
    var _fetchedResultsController: NSFetchedResultsController<Test>?=nil
    var managedcontext: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSavedData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectioninfo=fetchedResultsController.sections![section]
        return sectioninfo.numberOfObjects
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
       // let object = testModel[indexPath.row]
        let object = fetchedResultsController.object(at: indexPath)
        cell.textLabel!.text=object.name
        // Configure the cell...
        return cell
    }

    func loadSavedData(){
        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
        let sortDescriotor = NSSortDescriptor(key:"name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriotor]
        do {
            self.testModel = try (self.managedcontext.fetch(fetchRequest)) as! [Test]
            tableView.reloadData()
            
        }catch{
            fatalError("Failed to Fetch Test : \(error)")
        }
         
        
    }
    var fetchedResultsController: NSFetchedResultsController<Test>{
        if _fetchedResultsController != nil{
            return _fetchedResultsController!
        }
        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
        let sortDescriotor = NSSortDescriptor(key:"name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriotor]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedcontext, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        do{
            try _fetchedResultsController!.performFetch()
        }catch{
            let nserror=error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return _fetchedResultsController!
        
    }
    
    
    @IBAction func AddItem(_ sender: UIBarButtonItem) {
        let context=self.fetchedResultsController.managedObjectContext
        
        let newTest = Test(context:context)
        newTest.name="Test1"
        self.testModel.append(newTest)
        do {
            try context.save()
            //loadSavedData()
            //tableView.reloadData()
        }catch{
            
        }
    }
    
    
    @IBAction func DeleteItem(_ sender: UIBarButtonItem) {
        let context=self.fetchedResultsController.managedObjectContext
        guard self.testModel.count != 0 else {
            return
        }
 
        context.delete(self.fetchedResultsController.object(at: IndexPath(row:0,section: 0)))
        
        do
        {
            try context.save()
           // loadSavedData()
        }catch{
            
        }
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controller(_controller: NSFetchedResultsController<NSFetchRequestResult>,didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type:NSFetchedResultsChangeType){
        switch type{
        case .insert:
            tableView.insertSections(IndexSet(integer:sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer:sectionIndex), with: .fade)
        default:return
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type{
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            configureCell(tableView.cellForRow(at: indexPath!)!, withUser: anObject as! Test)
        case .move:
            configureCell(tableView.cellForRow(at: indexPath!)!, withUser: anObject as! Test)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
            
            
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    func configureCell(_ cell: UITableViewCell, withUser item: Test){
        cell.textLabel!.text=item.name
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
