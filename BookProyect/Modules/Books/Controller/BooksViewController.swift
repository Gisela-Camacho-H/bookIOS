//
//  BooksViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 21/01/22.
//
import UIKit
import Firebase

class BooksViewController : UIViewController {

    enum DashboardSection:String, CaseIterable {
        case books = "Books"
        case authors = "Authors"
        case categories = "Categories"
    }
    
    let db = Firestore.firestore()
    
    private let viewModel = BooksViewModel()
    
    
    lazy var id : UILabel = UILabel()
    lazy var exitButton: UIButton = UIButton()
    
    private lazy var sectionButton: UISegmentedControl = UISegmentedControl(items:  viewSections.map{ $0.rawValue })
    
    private var viewSections: [DashboardSection] = DashboardSection.allCases
    
    private var currentSection: DashboardSection = .books
    
    var tableView : UITableView?
    
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var categoryStackView: UIStackView = UIStackView()
    
    var defaults = UserDefaults.standard
    
    
    var imageCar: UIImageView = UIImageView()
    
    
    lazy var userName: UILabel = UILabel()
    var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    
    //MARK: - CollectionView
    
    var librosCollectionView: UICollectionView = { //ponemos el nombre de la var y lo igualamos a {}()
    
        let layout = UICollectionViewFlowLayout() //Declaramos un layout el cual nos servirá para definir los atributos del collectionView
        layout.scrollDirection = .horizontal //aqui definimos el tipo de scroll que tendrá el collection
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(BookCollectionView.self, forCellWithReuseIdentifier: "cell")
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = true
        collection.showsHorizontalScrollIndicator = true
        
        return collection //Debemos retornar un valor del tipo del cual estamos declarando
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //se llama a las funciones de datos (getData y getImage) y initUI
        viewModel.getData()
        countCounter()
        viewModel.getImage()
        librosCollectionView.reloadData()
        initUI()
        requesBooks()
    }
    
    func initUI(){
        
        
        exitButton = UIButton(frame: CGRect(x: width - 60, y: height/8 - 40, width: 45, height: 45))
        exitButton.setImage(UIImage(named: "exit"), for: .normal)
        exitButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        view.addSubview(exitButton)
        
        id = UILabel(frame: CGRect(x: 20, y: 390, width: 150, height: 30))
        id.text = ""
        id.font = .boldSystemFont(ofSize: 14)
        id.textColor = UIColor.pinkColor
        id.textAlignment = .center
        view.addSubview(id)
        
        let docRef = db.collection("UserInfo").document("User")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        
        //MARK: - Compras
        view?.addSubview(imageCar)
        imageCar.image = UIImage(systemName: "cart.fill")
        imageCar.tintColor = UIColor.brownColor
        imageCar.addAnchorsAndSize(width: 50, height: 50, left: nil, top: 375, right: 25, bottom: nil)
        
        view?.addSubview(counterLabel)
        counterLabel.addAnchorsAndSize(width: 22, height: 22, left: nil, top: 375, right: 15, bottom: nil)
        counterLabel.font = .boldSystemFont(ofSize: 15)
        counterLabel.layer.masksToBounds = true
        counterLabel.layer.cornerRadius = 11
        counterLabel.backgroundColor = UIColor.DarkPinkColor
        counterLabel.textAlignment = .center
        counterLabel.textColor = .white
        
        // MARK: - TableView
        
        librosCollectionView.delegate = self
        librosCollectionView.dataSource = self
        view.addSubview(librosCollectionView)
        librosCollectionView.addAnchorsAndSize(width: nil, height: height/5, left: 0, top: 125, right: 20, bottom: nil)
        
        view.addSubview(sectionButton)
        sectionButton.selectedSegmentIndex = 0
        sectionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionButton.bottomAnchor.constraint(equalTo: librosCollectionView.bottomAnchor, constant: 60),
            sectionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sectionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        sectionButton.addTarget(self, action: #selector(sectionDidChanged(_:)), for: .valueChanged)
        navigationItem.setRightBarButtonItems([UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.dismissView))], animated: true)
    }
    
    @objc func sectionDidChanged(_ sender: UISegmentedControl) {
         let indexSelection: Int = sender.selectedSegmentIndex
         currentSection = viewSections[indexSelection]
         switch indexSelection {
         case 0:
             requesBooks()
         case 1:
             requestAuthors()
         case 2:
             requestCategories()
         default:
             break
         }
     }
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func requesBooks() {
        tableView = UITableView(frame: CGRect(x: 20, y: height/3 + 115, width: width - 40, height: height - 410))
        tableView?.backgroundColor = UIColor.backgroundColor
        tableView?.delegate = self
        tableView?.dataSource = self //en donde se va a definir (en si mismo)
        view.addSubview(tableView!) //se hace visible
    }
    
    func requestAuthors() {
        hideTableView()
        labelStackView.isHidden = false
        categoryStackView.isHidden = true
        lazy var a1Label: UILabel = UILabel()
        lazy var a2Label: UILabel = UILabel()
        lazy var a3Label: UILabel = UILabel()
        lazy var a4Label: UILabel = UILabel()
        lazy var a5Label: UILabel = UILabel()
        lazy var a6Label: UILabel = UILabel()
        self.view.addSubview(a1Label)
        self.view.addSubview(a2Label)
        self.view.addSubview(a3Label)
        self.view.addSubview(a4Label)
        self.view.addSubview(a5Label)
        self.view.addSubview(a6Label)
        let names: [String] = ["Miguel de Cervantes", "Edgar Allan Poe", "William Shakespeare", "J.K. Rolling", "Dante Alighieri", "Franz Kafka"]
        let labelArray: [UILabel] = [a1Label, a2Label, a3Label, a4Label, a5Label, a6Label]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 20
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
        labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: librosCollectionView.bottomAnchor, constant: 120),
        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        labelStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            label.widthAnchor.constraint(equalToConstant: 50).isActive = true
            label.backgroundColor = UIColor.brownColor
            label.font = .boldSystemFont(ofSize: 25)
            label.textColor = UIColor.pinkColor
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            
        }
        a1Label.text = names[0]
        a2Label.text = names[1]
        a3Label.text = names[2]
        a4Label.text = names[3]
        a5Label.text = names[4]
        a6Label.text = names[5]
    }
    
    func requestCategories() {
        hideTableView()
        labelStackView.isHidden = true
        categoryStackView.isHidden = false
        lazy var a1Label: UILabel = UILabel()
        lazy var a2Label: UILabel = UILabel()
        lazy var a3Label: UILabel = UILabel()
        lazy var a4Label: UILabel = UILabel()
        lazy var a5Label: UILabel = UILabel()
        lazy var a6Label: UILabel = UILabel()
        self.view.addSubview(a1Label)
        self.view.addSubview(a2Label)
        self.view.addSubview(a3Label)
        self.view.addSubview(a4Label)
        self.view.addSubview(a5Label)
        self.view.addSubview(a6Label)
        let names: [String] = ["Horror", "Love", "Fiction", "History", "Classic", "Literacy"]
        let labelArray: [UILabel] = [a1Label, a2Label, a3Label, a4Label, a5Label, a6Label]
        
        categoryStackView.axis = .vertical
        categoryStackView.spacing = 20
        categoryStackView.alignment = .fill
        categoryStackView.distribution = .fillEqually
        labelArray.forEach {label in
        categoryStackView.addArrangedSubview(label)
        }
        view.addSubview(categoryStackView)
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([categoryStackView.topAnchor.constraint(equalTo: librosCollectionView.bottomAnchor, constant: 120),
            categoryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            label.widthAnchor.constraint(equalToConstant: 50).isActive = true
            label.backgroundColor = .white
            label.font = .boldSystemFont(ofSize: 25)
            label.textColor = UIColor.brownColor
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            
        }
        a1Label.text = names[0]
        a2Label.text = names[1]
        a3Label.text = names[2]
        a4Label.text = names[3]
        a5Label.text = names[4]
        a6Label.text = names[5]
    }
        
    func hideTableView() {
        tableView?.isHidden = true
    }
    
//MARK: - función regresar
    
    @objc func logout(){
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "superCart")
            UserDefaults.standard.removeObject(forKey: "UserLog")
            let back = ViewController()
            back.modalPresentationStyle = .fullScreen
            present(back, animated: true, completion: nil)
        } catch let signOutError as NSError{
            print("Error signing out %@", signOutError)
        }
    }
    @objc func findBook (){
        print("go to findBook")
         let find = FindBookViewController()
        find.modalPresentationStyle = .fullScreen
        present(find, animated: true, completion: nil)
    }

    @objc func categories (){
        print("go to categories")
         let find = CategoriesViewController()
        find.modalPresentationStyle = .fullScreen
        present(find, animated: true, completion: nil)
    }
    
    @objc func authors (){
        print("go to authors")
         let find = AuthorsViewController()
        find.modalPresentationStyle = .fullScreen
        present(find, animated: true, completion: nil)
    }
}
// MARK: - UITableViewDelegate
extension BooksViewController : UITableViewDelegate{
    
    // definir el texto o view en los headers de las secciones
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?{
        return viewModel.dataSource?.categorias?[section].nombre ?? ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView() //aqui definimos el UIView el cual se va a retornar en la funcion
        view.backgroundColor = UIColor.backgroundColor //lo agregamos a la vista
        
        //se declara el label
        let label = UILabel(frame: CGRect(x: 25, y: 2, width: 200, height: 20))
        label.text = viewModel.dataSource?.categorias?[section].nombre ?? ""
        label.font = .boldSystemFont(ofSize: 20)
        view.addSubview(label)
        
        return view
    }
    
    
    // muestra la sección y la celda por sección donde se da click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I`m on the sección \(indexPath.section) on the cell \(indexPath.row)")
        
        let libro = viewModel.dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        
        let vc = DetailBookViewController(libro: libro!)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource?.categorias?.count ?? 0
    }
    
}

// MARK: - UITableDataSource

    extension BooksViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource?.categorias?[section].libros?.count ?? 0
  }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libr = viewModel.dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        let currentCounter = viewModel.cart[libr?.nombre ?? ""] ?? 0
        let cell = BookTableViewCell(libro: libr!, numberOf: currentCounter as! Int)
        cell.delegate = self
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return height/7
        }
    }

extension BooksViewController: MenuTableViewCellDelegate {
    func addtoCar(product: Libro, count: Int) {
        
        viewModel.cart[product.nombre ?? ""] = count
        UserDefaults.standard.set(viewModel.cart, forKey: "superCart")
        countCounter()
    }
        
    func countCounter(){
        viewModel.counter = 0
        for product in viewModel.cart{
            viewModel.counter += product.value as! Int
            }
        counterLabel.text = "\(viewModel.counter)"
        }
    
    func removetoCar(product: Libro, count: Int) {
        
        viewModel.cart[product.nombre ?? ""] = count
        countCounter()
    }
}


//MARK: - UICollectionDelegate && UICollectionDataSourse

extension BooksViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageSource?.catego?[section].books?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    let cell = librosCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionView
        let producto = viewModel.imageSource?.catego?[indexPath.section].books?[indexPath.item]
        cell.setData( book : producto!)
        
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: width/3 - 20, height: height / 4 - 50)
    }
}



//https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=6GmMry36iGR60wACRPVu5PNVrJSCliyv
//api-key=6GmMry36iGR60wACRPVu5PNVrJSCliyv

//https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=6GmMry36iGR60wACRPVu5PNVrJSCliyv

//https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=6GmMry36iGR60wACRPVu5PNVrJSCliyv
