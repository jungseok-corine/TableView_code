//
//  ViewController.swift
//  TableViewCode
//
//  Created by 오정석 on 7/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var movieArray: [Movie] = []
    
    var movieDataManger = DataManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstraints()
        
        
        
    }

    func setupNaviBar() {
        title = "영화 목록"
        
        //(네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() //불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    func setupTableView(){
        //델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        //셀의 높이 설정
        tableView.rowHeight = 120
        
        //셀의 등록과정⭐️⭐️⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupDatas() {
        movieDataManger.makeMovieData()  //일반적으로는 서버에 요청
        movieArray = movieDataManger.getMovieData()  //데이터 받아서 뷰컨의 배열에 저장
    }
    
    //테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        
        cell.mainImageView.image = movieArray[indexPath.row].movieImage
        cell.movieNameLabel.text = movieArray[indexPath.row].movieName
        cell.descriptionLabel.text = movieArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //다음화면으로 이동
        let detailVC = DetailViewController()
        detailVC.movieData = movieArray[indexPath.row]
        show(detailVC, sender: nil)
    }
}

