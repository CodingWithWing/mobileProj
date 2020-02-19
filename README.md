# mobileProj
Learning UITableView Visit API , load Image and Json Format What I have learned:

Call Service API: URLRequest, URLSession.shared, session.dataTask, dataTask.resume() request.addValue for header Field
Transform JSON Data from Response to Json Object: JSONSerialization.jsonObject as [String:Any]
[String: Any] is a dictionary, [[String: Any]] is a Array with type of dictionary.
Define a structure with init and its parameters can be [String: Any] dictionary.
Main feature:

Get response from web API
Get Json object
Load image and replace with correct URL
Display them in UITableView
