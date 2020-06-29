//
//  SearchDetailViewController.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright (c) 2020 Yong Seok Kim. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift
import RxCocoa

protocol SearchDetailDisplayLogic: class {
    func display(viewModel: SearchDetail.Model.ViewModel)
}

class SearchDetailViewController: BaseViewController, SearchDetailDisplayLogic {
    var interactor: SearchDetailBusinessLogic?
    var router: (NSObjectProtocol & SearchDetailRoutingLogic & SearchDetailDataPassing)?
    
    
    let disposeBag = DisposeBag()
    var detailItem: SearchResultModel?
    var tableViewCellItems = BehaviorRelay(value: [String]())
    var isReleaseNote: Bool = false
    var isDescriptionNote: Bool = false
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.keyboardDismissMode = .onDrag
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = true
        tableView.register(cellType: BasicInfoTableViewCell.self)
        tableView.register(cellType: RatingInfoTableViewCell.self)
        tableView.register(cellType: NewInfoTableViewCell.self)
        tableView.register(cellType: ScreenImagesTableViewCell.self)
        tableView.register(cellType: DescriptionTableViewCell.self)
        tableView.register(cellType: CompanyInfoTableViewCell.self)
        
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = SearchDetailInteractor()
        let presenter = SearchDetailPresenter()
        let router = SearchDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setComponents()
        self.setTableViewCell()
    }
    
    // MARK: 현재 버젼에서는 사용하지 않는 기능
    func requestData() {
        let request = SearchDetail.Model.Request()
        interactor?.request(request: request)
    }
    
    func display(viewModel: SearchDetail.Model.ViewModel) {
    }
}

extension SearchDetailViewController {
    private func setComponents() {
        self.view.backgroundColor = .white
        
        if let dic = self.detailItem {
            let imageView: UIImageView = UIImageView()
            imageView.downloadImageFrom(urlString: dic.artworkUrl60, imageMode: .scaleAspectFit)
            navigationItem.titleView = imageView            
            navigationItem.titleView?.isHidden = true
        }
            self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
            self.view.addSubview(self.tableView)
            self.setAutolayOut()
        }
        
        private func setAutolayOut() {
            self.tableView.snp.makeConstraints { view -> Void in
                view.left.right.equalTo(self.view)
                view.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10.0)
                view.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }


}


// RxTableView
extension SearchDetailViewController {
    private func setTableViewCell() {
        let items = [BasicInfoTableViewCell.identifier,
                     RatingInfoTableViewCell.identifier,
                     NewInfoTableViewCell.identifier,
                     ScreenImagesTableViewCell.identifier,
                     DescriptionTableViewCell.identifier,
                     CompanyInfoTableViewCell.identifier]
//                     SearchDetailDescriptionCell.identifier,
//                     SearchDetailGenreCell.identifier]
        self.tableViewCellItems.accept(items)
        
        self.setTableViewDataSource()
        self.setTableViewSelection()
    }
    
    private func setTableViewDataSource() {
        self.tableViewCellItems
            .asObservable()
            .bind(to: tableView.rx.items) { (tableView: UITableView, index: Int, element: String) -> UITableViewCell in
                guard let item = self.detailItem else {
                    return UITableViewCell()
                }
                
                let indexPath = IndexPath(item: index, section: 0)
                switch element {
                case BasicInfoTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: BasicInfoTableViewCell.self)

                    cell.shareButton
                        .rx.tap
                        .subscribe(onNext: { [weak self] in
                            guard let self = self else { return }
                            self.selectedSharebutton()
                        }).disposed(by: self.disposeBag)
                    
                    cell.setup(dic: item)
                    return cell
                case RatingInfoTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: RatingInfoTableViewCell.self)
                    cell.setup(dic: item)
                    return cell
                case NewInfoTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: NewInfoTableViewCell.self)
                    cell.setup(dic: item, show: self.isReleaseNote)
                    return cell
                case ScreenImagesTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: ScreenImagesTableViewCell.self)
                    
                    cell.setup(urls: item.screenshotUrls)

                    return cell
                case DescriptionTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: DescriptionTableViewCell.self)
                    cell.setup(dic: item, show: self.isDescriptionNote)

                    return cell
                case CompanyInfoTableViewCell.identifier:
                    let cell = tableView.dequeueReusableCell(for: indexPath,
                                                             cellType: CompanyInfoTableViewCell.self)
                    cell.setup(dic: item)

                    return cell
                default:
                    return UITableViewCell()
                }
        }.disposed(by: disposeBag)
    }
    
    private func setTableViewSelection() {
        self.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                switch indexPath.row {
                case 2:
                    if self.isReleaseNote == true { return }
                    self.isReleaseNote = !self.isReleaseNote
                    if let cell: NewInfoTableViewCell = self.tableView.cellForRow(at: indexPath) as? NewInfoTableViewCell {
                        cell.updateAutoLayout()
                    }
                    
                    self.tableView.beginUpdates()
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    self.tableView.endUpdates()

                    break
                case 4:
                    if self.isDescriptionNote == true { return }
                    self.isDescriptionNote = !self.isDescriptionNote
                    if let cell: DescriptionTableViewCell = self.tableView.cellForRow(at: indexPath) as? DescriptionTableViewCell {
                        cell.updateAutoLayout()
                    }

                    self.tableView.beginUpdates()
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    self.tableView.endUpdates()

                    break
                default:
                    break
                }


            }).disposed(by: self.disposeBag)
    }
}

extension SearchDetailViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
}

extension SearchDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= 120) {
            navigationItem.titleView?.isHidden = false
        } else {
            navigationItem.titleView?.isHidden = true
        }
    }
}

extension SearchDetailViewController {
    private func selectedSharebutton() {
        guard let item = self.detailItem else { return }
        let urlShare = [ item.trackViewUrl ]
        let activityViewController = UIActivityViewController(activityItems: urlShare,
                                                              applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
