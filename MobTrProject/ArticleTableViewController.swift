//
//  ArticleTableViewController.swift
//  MobTrProject
//
//  Created by apple on 2020/2/17.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {

    var articleDetials = [ArticleDetial]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callService()
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
        return articleDetials.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acticleCell", for: indexPath) as! ArticleTableViewCell
        
        let newItem = articleDetials[indexPath.row]
        cell.title.text = newItem.title
        cell.articleImage.image = newItem.imageUrl
        cell.category.text = newItem.category
        
        return cell
    }

    
    func callService()
    {
        let url:URL = URL(string:"https://contentapiqa.fidelity.com/ncs/content?path=/060%20EntApp%20Pages/Building%20Blocks/Content/Library/Foundational%20Content%20Store/000%20Application%20Content/AP125288-83%20YI-education/home_CNT")!
        var request: URLRequest = URLRequest(url:url)
        request.addValue("AP125288", forHTTPHeaderField: "AppId")
        request.addValue("IPhoneDemo", forHTTPHeaderField: "AppName")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,completionHandler: {
            (data,response,error)-> Void in
            if let error = error
            {
                //  var dataValue:JSONDecoder
                print(error.localizedDescription)
            }
            else{
                DispatchQueue.main.async {
                    if  let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                        
                        if let nestedDictionary = json["content"] as? [[String: Any]] {
                            // access nested dictionary values by key
                            // get every dictionary from array
                            //  for result in nestedDictionary
                            //{
                            if let components = nestedDictionary[0]["components"] as? [[String: Any]]
                            {
                                for result in components
                                {
                                    //convert array[String:Any] to Object list
                                    // Struct ArticleService need to init with [String: Any] as parameters
                                    let  articleOrg = ArticleOriginal(result: result)
                                    
                                    self.downloadedFrom(url: URL(string:articleOrg.imageUrl)!,title: articleOrg.title)
                                 
                                }
                            }
                        }
                    }
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
    func downloadedFrom(url: URL, title:String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                
                else { return }
            DispatchQueue.main.async() {
                let item = ArticleDetial(title: title, imageUrl: image)!
                self.articleDetials.append(item)
                self.tableView.reloadData()
                
            }
        }.resume()
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
