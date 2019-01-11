//
//  ViewController.swift
//  Movie List
//
//  Created by Diante Lewis-Jolley on 1/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addMovieButton(_ sender: Any) {
        guard let movie = textField.text else { return }
        MovieController.shared.addMovie(movie)
        tableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.shared.movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        // Configure the cell...
        let movies = MovieController.shared.movies
        let movie = movies[indexPath.row]
        cell.textLabel!.text = movie.title

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }

        let movie = MovieController.shared.movies[indexPath.row]
        MovieController.shared.removeMovies(movie)
    }


}
