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
    
    lazy var id : UILabel = UILabel()
    lazy var exitButton: UIButton = UIButton()
    
    var userName: UILabel = UILabel()
    
    var dataSource : BookObject?
    var imageSource : BooksObjectCollection?
    
    private lazy var sectionButton: UISegmentedControl = UISegmentedControl(items:  viewSections.map{ $0.rawValue })
    
    private var viewSections: [DashboardSection] = DashboardSection.allCases
    
    private var currentSection: DashboardSection = .books
    
    var tableView : UITableView?
    
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var categoryStackView: UIStackView = UIStackView()
    
    
    var imageCar: UIImageView = UIImageView()
    var counter = 0
    var cart = [String: Any]()
    
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
        getData()
        getImage()
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
//MARK: - buttonsView
 
    
    func getData(){
        
        cart = UserDefaults.standard.dictionary(forKey: "superCart") ?? [String:Any]()
        countCounter()
        
        // MARK: - Tales
 
        let cuentos = Libro(nombre: "Tales and Poems", descripcion: "La edición de Cuentos en dos volúmenes ofrece la recopilación de los 67 Cuentos publicados a lo largo de su vida por Edgar Alan Poe. Se reúnen las narraciones dominadas por el terror, la presencia de lo sobrenatural.", autor: "Edgar Allan Poe", imagen: "cuentos", detalles: "Austral Básicos", sobreAutor: "Escritor, poeta, narrador, periodista y crítico literario americano, quien se conoció por su narrativa de terror, horror romántico y su maestría del relato de influencia gótica, siendo considerado uno de los grandes de la literatura universal y padre del género detectivesco.", categoria: "Tales", autorImage: "edgar")
        
        let cuentosInfantiles = Libro(nombre: "Fairy Tales", descripcion: "Algunos inspirados en cuentos y leyendas nórdicas, pero la mayoría de ellos inventados por él y caracterizada por una gran imaginación, humor y sensibilidad.", autor: "Hans C. Andersen", imagen: "cuentosInf", detalles: "Leyendas Nórdicas", sobreAutor: "Nació en el año 1805, en Odense, Dinamarca, fue escritor del género infantil por los cuáles recibió las distinciones Orden de Dannebrog, Order of the Red Eagle 3rd Class, Premio Prometheus en la categoría Hall of Fame, Orden bávara de Maximiliano para la Ciencia y las Artes (1859) y Golden Paintbrush (1976).", categoria: "Tales", autorImage: "hans")
        
        let Cuentos = Categoria(nombre: "Tales", libros: [cuentos, cuentosInfantiles])
        // MARK: - literatura
        let cumbres = Libro(nombre: "Wuthering Heights", descripcion: "Catherine and Heathcliff's, a foundling adopted by Catherine's father, passionate but doomed love forms the core of this extraordinary tale. Catherine's brother Hindley's hatred and humiliation of Heathcliff leads to tragedy when Catherine marries another and Heathcliff returns newly wealthy to enact his revenge on all who wronged him.", autor: "Emily Brontë", imagen: "cumbres", detalles: "Literatura Inglesa", sobreAutor: "Nació en Thornton, Reino Unido, en 1818. La personalidad de Emily era áspera, salvaje y violenta. Este trabajo rompió por completo con los cañones de decoro que la Inglaterra victoriana requería para toda producción literaria.", categoria: "Literature", autorImage: "emily")
        
        let guerraPaz = Libro(nombre: "War and Peace", descripcion: "Tolstoy's epic masterpiece intertwines the lives of private and public individuals during the time of the Napoleonic wars and the French invasion of Russia. The fortunes of the Rostovs and the Bolkonskys, of Pierre, Natasha, and Andrei, are intimately connected with the national history that is played out in parallel with their lives. ", autor: "León Tolstói", imagen: "guerra", detalles: "Literatura Rusa", sobreAutor: "Escritor, dramaturgo, filósofo, novelista, pedagogo y publicista de origen ruso, nacido en 1828, considerado uno de los escritores más importantes de la literatura mundial. Recibió varias nominaciones al Premio Nobel de Literatura de los años 1902 a 1906 y nominaciones al Premio Nobel de la Paz en 1901, 1902 y 1910.", categoria: "Literature", autorImage: "leon")
        
        let literatura = Categoria(nombre: "Literature", libros: [cumbres,guerraPaz])
        
        // MARK: - Clásicos
 
        let LaDivinaComedia = Libro(nombre: "The Divine Comedy", descripcion: "The Divine Comedy is one of the greatest ever works of western literature. In this epic poem, Dante imagines the afterlife by representing his own travels through Hell, Purgatory and Paradise. With Virgil as his guide, he travels to the Earthly Paradise.", autor: "Dante Alighieri", imagen: "divina", detalles: "Historia Universal", sobreAutor: "Poeta italiano, nacido en 1265 en Florencia, Italia. Fue un importante poeta italiano de finales de la Edad Media y principios del Renacimiento. Dante recurre a la teología y filosofía cristianas medievales, especialmente a la filosofía tomista y a la Summa Theologica de Tomás de Aquino.", categoria: "Clasics", autorImage: "dante")
        
        let donQuijote = Libro(nombre: "Don Quixote", descripcion: "Entranced by romantic tales of heroism and chivalry, Don Quixote goes on a delusional quest for fame and adventure as a self-proclaimed knight errant. Riding his nag of a horse and wearing a rusty old suit of armor, he roams the countryside with his loyal squire Sancho Panza. Together they encounter an array of unforgettable characters and undertake some of the most famously foolhardy exploits in literature.", autor: "Miguel de Cervantes", imagen: "quijote", detalles: "Obra literaria", sobreAutor: "Dramaturgo español nacido en 1547 en Madrid, España. Fue novelista, poeta, dramaturgo y soldado español. Es considerado la figura más grande de la literatura española.", categoria: "Clasics", autorImage: "miguel")
        
        let Clasicos = Categoria(nombre: "Clasics", libros: [LaDivinaComedia, donQuijote])
        
        // MARK: - Novelas
 
        let ElCastillo = Libro(nombre: "The Castle", descripcion: "The story of K - the unwanted land surveyor who is never to be admitted to the Castle and yet cannot go home - seems to depict, like a dream from the deepest recesses of consciousness, an inexplicable truth about the nature of existence. A perpetual human condition lies at the heart of this labyrinthine world: dualities of certainty and doubt, hope and fear, reason and nonsense, harmony and disintegration.", autor: "Franz Kafka", imagen: "castillo", detalles: "Alianza Editorial", sobreAutor: "Austrohúngaro, nació en 1883, Praga, República Checa y tiene como principales temas los conflictos paternofiliales, la ansiedad, el existencialismo, la brutalidad física y psicológic", categoria: "Novels", autorImage: "franz")
        
        let hombreInvisible = Libro(nombre: "Invisible Man", descripcion: "Published in 1952 when American society was in the cusp of immense change, the powerfully depicted adventures of Ellison's invisible man - from his expulsion from a Southern college to a terrifying Harlem race riot - go far beyond the story of one individual to give voice to the experience of an entire generation of black Americans.", autor: "Ralph Ellison", imagen: "hombre", detalles: "Novela Inglesa", sobreAutor: "Escritor y profesor estadounidense, nacido en Oklahoma, Estados Unidos, en 1913 y considerado uno de los novelistas estadounidenses más influyentes de la posguerra y ganador del Premio Anisfield-Wolf a los Logros Especiales y el Premio Nacional del Libro de ficción en 1953, entre otras distinciones.", categoria: "Novels", autorImage: "ralph")
        
        let ViejoMar = Libro(nombre: "The Old Man and The Sea", descripcion: "The Old Man and the Sea examines themes of courage in the face of hardship and perseverance in the face of apparent defeat through Santiago, an old Cuban fisherman who is down on his luck. He also happens to be in the middle of his life’s greatest struggle — a high-stakes battle with a relentless marlin out the Gulf Stream. (You can understand the Moby-Dick comparison). ", autor: "Ernest Hemingway", imagen: "viejo", detalles: "ambientada en cuba", sobreAutor: "Escritor y periodista estadounidense, uno de los principales novelistas y escritores del siglo XX, nació en Illinois, Estados Unidos en 1899. Sus obras, consideradas clásicas en la literatura del siglo XX, tuvieron una notable influencia por la sobriedad de sus escritos, estilo que lo convirtió en el ganador del Premio Nobel de literatura en 1954.", categoria: "Novels", autorImage: "ernest")
        
        let Novelas = Categoria(nombre: "Novels", libros: [ElCastillo, hombreInvisible, ViejoMar])
        
        // MARK: - Epopeya Latina
        let Eneida = Libro(nombre: "Eneida", descripcion: "Eneida cuenta los viajes y conflictos en los que está involucrado el héroe troyano Eneas después de su fuga apresurada de la ciudad de Troja. En el Mediterráneo, Eneas y sus colegas huyen de los troyanos de su ciudad natal, Troya, que fue destruida por los griegos.", autor: "Virgilio", imagen: "eneida", detalles: "siglo IX a.C.", sobreAutor: "Poeta romano nacido el 70 a. C. C. en Mantua, Italia. Autor del género Epic Poetry, sus primeras composiciones poéticas fueron compiladas bajo el nombre de Apéndice Virgiliano.", categoria: "Latin Epic", autorImage: "virgilio")
        
        let EpopeyaLatina = Categoria(nombre: "Latin Epic", libros: [Eneida])
        
        let Libros = BookObject(categorias: [Cuentos,literatura,Clasicos, Novelas, EpopeyaLatina], title: "Libros Recientes")
        
        dataSource = Libros
        
    }
// MARK: - Imagenes de libros
    
    func getImage(){

        let cuentos = Book(imagen: "cuentos")
        let cuentosInfantiles = Book(imagen: "cuentosInf")
        let cumbres = Book(imagen: "cumbres")
        let guerraPaz = Book(imagen: "guerra")
        let LaDivinaComedia = Book(imagen: "divina")
        let donQuijote = Book(imagen: "quijote")
        let ElCastillo = Book(imagen: "castillo")
        let hombreInvisible = Book(imagen: "hombre")
        let ViejoMar = Book(imagen: "viejo")
        let Eneida = Book(imagen: "eneida")
        let Cuentos = Catego(nombre: "Cuentos", books: [cuentos, cuentosInfantiles, cumbres, guerraPaz, LaDivinaComedia, donQuijote, ElCastillo, hombreInvisible, ViejoMar, Eneida])

        let Image = BooksObjectCollection(catego: [Cuentos], title: "Libros Recientes")
        
        imageSource = Image
        
        librosCollectionView.reloadData()
        
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
        return dataSource?.categorias?[section].nombre ?? ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView() //aqui definimos el UIView el cual se va a retornar en la funcion
        view.backgroundColor = UIColor.backgroundColor //lo agregamos a la vista
        
        //se declara el label
        let label = UILabel(frame: CGRect(x: 25, y: 2, width: 200, height: 20))
        label.text = dataSource?.categorias?[section].nombre ?? ""
        label.font = .boldSystemFont(ofSize: 20)
        view.addSubview(label)
        
        return view
    }
    
    
    // muestra la sección y la celda por sección donde se da click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I`m on the sección \(indexPath.section) on the cell \(indexPath.row)")
        
        let libro = dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        
        let vc = DetailBookViewController(libro: libro!)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.categorias?.count ?? 0
    }
    
}

// MARK: - UITableDataSource

    extension BooksViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.categorias?[section].libros?.count ?? 0
  }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libr = dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        let currentCounter = cart[libr?.nombre ?? ""] ?? 0
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
        
        cart[product.nombre ?? ""] = count
        UserDefaults.standard.set(cart, forKey: "superCart")
        countCounter()
    }
        
    func countCounter(){
            counter = 0
            for product in cart{
                counter += product.value as! Int
            }
            counterLabel.text = "\(counter)"
        }
    
    func removetoCar(product: Libro, count: Int) {
        
        cart[product.nombre ?? ""] = count
        countCounter()
    }
}


//MARK: - UICollectionDelegate && UICollectionDataSourse

extension BooksViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSource?.catego?[section].books?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    let cell = librosCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionView
        let producto = imageSource?.catego?[indexPath.section].books?[indexPath.item]
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
