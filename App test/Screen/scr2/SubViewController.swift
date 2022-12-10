//
//  SubViewController.swift
//  App test
//
//  Created by FABBI on 25/05/2022.
//

import UIKit
import RxCocoa
import RxSwift
import CoreData

class SubViewController: BaseViewController {

    @IBOutlet weak var resultTable: UITableView!
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultTable.register(UINib(nibName: "DogTableViewCell", bundle: nil), forCellReuseIdentifier: "DogTableViewCell")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let noteFetch: NSFetchRequest<CDDogEntity> = CDDogEntity.fetchRequest()
        let managedContext = AppDelegate.sharedAppDelegate.persistentContainer.viewContext
        do {
            let results = try managedContext.fetch(noteFetch)
            let observable = Observable.just(results)
            observable.bind(to: resultTable.rx.items) { [weak self] (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "DogTableViewCell") as? DogTableViewCell
                cell?.bindView(with: element)
                return cell ?? UITableViewCell()
            }.disposed(by: disposeBag)
        } catch _ as NSError {
            
        }

        
    }

}
