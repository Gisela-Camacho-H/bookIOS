//
//  BooksViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 21/01/22.
//

import UIKit

class BooksViewController : UIViewController {

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var dataSource : BookObject?
    var masPopularesLabel: UILabel?
    var backButton : UIButton?
    var buttonContent : UIView?
    
    var backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1) //rgba(220,218,220,255)
    var blueColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    var lightBlueColor = UIColor(displayP3Red: 283/255, green: 162/255, blue: 129/255, alpha: 1)
    //238, 162, 129
    
    var libroButton: UIButton?
    var categoriasButton: UIButton?
    var autoresButton: UIButton?
    var lineView: UIView?
    var lineView2: UIView?
    var agregadosLabel: UILabel?
    
    var tableView : UITableView?
    
    var librosCollectionView: UICollectionView = { //ponemos el nombre de la var y lo igualamos a {}()
    
        let layout = UICollectionViewFlowLayout() //Declaramos un layout el cual nos servirá para definir los atributos del collectionView
        layout.scrollDirection = .horizontal //aqui definimos el tipo de scroll que tendrá el collection
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        
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

        //view.backgroundColor = backgroundColor
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        getData()
        
        initUI()
    }
    func initUI(){
        
        masPopularesLabel = UILabel(frame: CGRect(x: 30, y: 70, width: width - 60, height: 30))
        masPopularesLabel?.text = "Más populares"
        masPopularesLabel?.font = .boldSystemFont(ofSize: 25)
        masPopularesLabel?.textColor = lightBlueColor
        masPopularesLabel?.textAlignment = .center
        view.addSubview(masPopularesLabel!)
        
        backButton = UIButton(frame: CGRect(x: 20, y: 70, width: 45, height: 45))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        agregadosLabel = UILabel(frame: CGRect(x: 20, y: 390, width: 150, height: 30))
        agregadosLabel?.text = "Recién agregados"
        agregadosLabel?.font = .boldSystemFont(ofSize: 14)
        agregadosLabel?.textColor = lightBlueColor
        agregadosLabel?.textAlignment = .center
        view.addSubview(agregadosLabel!)
        
        createButtonsView()
        
        tableView = UITableView(frame: CGRect(x: 20, y: height/3 + 115, width: width - 40, height: height - 410))
        tableView?.backgroundColor = backgroundColor
        tableView?.delegate = self
        tableView?.dataSource = self //en donde se va a definir (en si mismo)
        view.addSubview(tableView!) //se hace visible
        
        librosCollectionView.delegate = self
        librosCollectionView.dataSource = self
        view.addSubview(librosCollectionView)
        librosCollectionView.addAnchorsAndSize(width: nil, height: height/5, left: 0, top: 125, right: 20, bottom: nil)
        
    }
    
    func createButtonsView(){
        buttonContent = UIView(frame: CGRect(x: 30, y: height/3 + 30 , width: width - 60, height: 50))
        buttonContent?.backgroundColor = .white
        buttonContent?.layer.cornerRadius = 10
        view.addSubview(buttonContent!)
        
        libroButton = UIButton(frame: CGRect(x: 2, y: 15, width: 80, height: 20))
        libroButton?.setTitle("Libros", for: .normal)
        libroButton?.setTitleColor(blueColor, for: .normal)
        //libroButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        buttonContent?.addSubview(libroButton!)
        
        categoriasButton = UIButton(frame: CGRect(x: 115, y: 15, width: 100, height: 20))
        categoriasButton?.setTitle("Categorías", for: .normal)
        categoriasButton?.setTitleColor(blueColor, for: .normal)
        //categoriasButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        buttonContent?.addSubview(categoriasButton!)
        
        autoresButton = UIButton(frame: CGRect(x: 240, y: 15, width: 80, height: 20))
        autoresButton?.setTitle("Autores", for: .normal)
        autoresButton?.setTitleColor(blueColor, for: .normal)
        //autoresButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        buttonContent?.addSubview(autoresButton!)
        
        lineView =  UIView(frame: CGRect(x: 90, y: 8 , width: 2, height: 35))
        lineView?.backgroundColor = blueColor
        buttonContent?.addSubview(lineView!)
        
        lineView2 =  UIView(frame: CGRect(x: 230, y: 8 , width: 2, height: 35))
        lineView2?.backgroundColor = blueColor
        buttonContent?.addSubview(lineView2!)
        
    }
    
    func getData(){
        // MARK: - cuentos
 
        let cuentos = Libro(nombre: "Cuentos", descripcion: "La edición de Cuentos en dos volúmenes ofrece la recopilación de los 67 Cuentos publicados a lo largo de su vida por Edgar Alan Poe. Se reúnen las narraciones dominadas por el terror, la presencia de lo sobrenatural.", autor: "Edgar Allan Poe", imagen: "cuentos", detalles: "Austral Básicos", sobreAutor: "Escritor, poeta, narrador, periodista y crítico literario americano, quien se conoció por su narrativa de terror, horror romántico y su maestría del relato de influencia gótica, siendo considerado uno de los grandes de la literatura universal y padre del género detectivesco.", categoria: "cuentos", autorImage: "edgar")
        
        let cuentosInfantiles = Libro(nombre: "Cuentos de Andersen", descripcion: "Algunos inspirados en cuentos y leyendas nórdicas, pero la mayoría de ellos inventados por él y caracterizada por una gran imaginación, humor y sensibilidad.", autor: "Hans C. Andersen", imagen: "cuentosInf", detalles: "Leyendas Nórdicas", sobreAutor: "Nació en el año 1805, en Odense, Dinamarca, fue escritor del género infantil por los cuáles recibió las distinciones Orden de Dannebrog, Order of the Red Eagle 3rd Class, Premio Prometheus en la categoría Hall of Fame, Orden bávara de Maximiliano para la Ciencia y las Artes (1859) y Golden Paintbrush (1976).", categoria: "Cuentos", autorImage: "hans")
        
        let Cuentos = Categoria(nombre: "Cuentos", libros: [cuentos, cuentosInfantiles])
        // MARK: - literatura
        let cumbres = Libro(nombre: "Cumbres Borrascosas", descripcion: "Una de las novelas inglesas más relevantes del siglo XIX, cuenta la historia épica de Catherine y Heathcliff. Situado en los páramos sombríos y desolados de Yorkshire, constituye una sorprendente visión metafísica del destino, la obsesión, la pasión y la venganza.", autor: "Emily Brontë", imagen: "cumbres", detalles: "Literatura Inglesa", sobreAutor: "Nació en Thornton, Reino Unido, en 1818. La personalidad de Emily era áspera, salvaje y violenta. Este trabajo rompió por completo con los cañones de decoro que la Inglaterra victoriana requería para toda producción literaria.", categoria: "Literatura", autorImage: "emily")
        
        let guerraPaz = Libro(nombre: "Guerra y Paz", descripcion: "Guerra y paz es una novela donde se narra las vicisitudes de numerosos personajes de todo tipo y condición a lo largo de unos cincuenta años de la historia rusa, desde las guerras napoleónicas hasta más allá de mediados del siglo XIX.", autor: "León Tolstói", imagen: "guerra", detalles: "Literatura Rusa", sobreAutor: "Escritor, dramaturgo, filósofo, novelista, pedagogo y publicista de origen ruso, nacido en 1828, considerado uno de los escritores más importantes de la literatura mundial. Recibió varias nominaciones al Premio Nobel de Literatura de los años 1902 a 1906 y nominaciones al Premio Nobel de la Paz en 1901, 1902 y 1910.", categoria: "Literatura", autorImage: "leon")
        
        let literatura = Categoria(nombre: "Literatura", libros: [cumbres,guerraPaz])
        
        // MARK: - Clásicos
 
        let LaDivinaComedia = Libro(nombre: "La Divina Comedia", descripcion: "Es ampliamente considerado el poema más importante de la Edad Media y la mayor obra literaria en lengua italiana. Se trata del viaje de Dante al infierno, al purgatorio y al paraíso, para expiar sus pecados y encontrar el significado de su vida, de la mano de la intervención divina.", autor: "Dante Alighieri", imagen: "divina", detalles: "Historia Universal", sobreAutor: "Poeta italiano, nacido en 1265 en Florencia, Italia. Fue un importante poeta italiano de finales de la Edad Media y principios del Renacimiento. Dante recurre a la teología y filosofía cristianas medievales, especialmente a la filosofía tomista y a la Summa Theologica de Tomás de Aquino.", categoria: "Clásicos", autorImage: "dante")
        
        let donQuijote = Libro(nombre: "Don Quijote de la Mancha", descripcion: "Publicada en 1605, trata la historia de Alonso Quijano, un caballero, es decir, un noble rico y de baja escala social, de unos cincuenta años, que vive en algún lugar de La Mancha a principios del siglo XVII. Su hobby es leer libros de caballería, donde se narran fantásticas aventuras de caballeros, princesas, magos y castillos encantados.", autor: "Miguel de Cervantes", imagen: "quijote", detalles: "Obra literaria", sobreAutor: "Dramaturgo español nacido en 1547 en Madrid, España. Fue novelista, poeta, dramaturgo y soldado español. Es considerado la figura más grande de la literatura española.", categoria: "Clásicos", autorImage: "miguel")
        
        let Clasicos = Categoria(nombre: "Clásicos", libros: [LaDivinaComedia, donQuijote])
        
        // MARK: - Novelas
 
        let ElCastillo = Libro(nombre: "El Castillo", descripcion: "El protagonista de El Castillo, conocido solo como K., lucha por acceder a las misteriosas autoridades de un castillo que gobierna la ciudad en la que K. comenzó a trabajar como topógrafo.", autor: "Franz Kafka", imagen: "castillo", detalles: "Alianza Editorial", sobreAutor: "Austrohúngaro, nació en 1883, Praga, República Checa y tiene como principales temas los conflictos paternofiliales, la ansiedad, el existencialismo, la brutalidad física y psicológic", categoria: "Novelas", autorImage: "franz")
        
        let hombreInvisible = Libro(nombre: "El Hombre Invisible", descripcion: "Considerado la obra maestra de Ralph Ellison, es el relato en primera persona de un hombre negro sin nombre que se describe a sí mismo como un hombre invisible, no debido a una condición fisiológica anormal, sino porque la sociedad permanece ciega ante él.", autor: "Ralph Ellison", imagen: "hombre", detalles: "Novela Inglesa", sobreAutor: "Escritor y profesor estadounidense, nacido en Oklahoma, Estados Unidos, en 1913 y considerado uno de los novelistas estadounidenses más influyentes de la posguerra y ganador del Premio Anisfield-Wolf a los Logros Especiales y el Premio Nacional del Libro de ficción en 1953, entre otras distinciones.", categoria: "Novelas", autorImage: "ralph")
        
        let ViejoMar = Libro(nombre: "El Viejo y el Mar", descripcion: "Tiene un lenguaje de gran fuerza y ​​simplicidad. En la narración, vemos a un viejo pescador cubano llamado Santiago, con el mayor desafío que enfrenta: la batalla implacable con un pez gigantesco en las aguas del golfo.", autor: "Ernest Hemingway", imagen: "viejo", detalles: "ambientada en cuba", sobreAutor: "Escritor y periodista estadounidense, uno de los principales novelistas y escritores del siglo XX, nació en Illinois, Estados Unidos en 1899. Sus obras, consideradas clásicas en la literatura del siglo XX, tuvieron una notable influencia por la sobriedad de sus escritos, estilo que lo convirtió en el ganador del Premio Nobel de literatura en 1954.", categoria: "Novelas", autorImage: "ernest")
        
        let Novelas = Categoria(nombre: "Novelas", libros: [ElCastillo, hombreInvisible, ViejoMar])
        
        // MARK: - Epopeya Latina
        let Eneida = Libro(nombre: "Eneida", descripcion: "Eneida cuenta los viajes y conflictos en los que está involucrado el héroe troyano Eneas después de su fuga apresurada de la ciudad de Troja. En el Mediterráneo, Eneas y sus colegas huyen de los troyanos de su ciudad natal, Troya, que fue destruida por los griegos.", autor: "Virgilio", imagen: "eneida", detalles: "siglo IX a.C.", sobreAutor: "Poeta romano nacido el 70 a. C. C. en Mantua, Italia. Autor del género Epic Poetry, sus primeras composiciones poéticas fueron compiladas bajo el nombre de Apéndice Virgiliano.", categoria: "Epopeya Latina", autorImage: "virgilio")
        
        let EpopeyaLatina = Categoria(nombre: "Epopeya Latina", libros: [Eneida])
        
        
        // MARK: - Menu
        let menu = BookObject(categorias: [Cuentos,literatura,Clasicos, Novelas, EpopeyaLatina], title: "Libros Recientes")
        
        dataSource = menu
        
        librosCollectionView.reloadData()
        
    }

    @objc func backAction(){
        print("back")
        dismiss(animated: true)
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
        view.backgroundColor = backgroundColor //lo agregamos a la vista
        
        //ae declara el label
        let label = UILabel(frame: CGRect(x: 25, y: 2, width: 200, height: 20))
        label.text = dataSource?.categorias?[section].nombre ?? ""
        label.font = .boldSystemFont(ofSize: 20)
        view.addSubview(label)
        
        return view
    }
    
    
    // muestra la sección y la celda por sección donde se da click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la sección \(indexPath.section) en la celda \(indexPath.row)")
        
        let libro = dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        
        let vc = DetailBookViewController(libro: libro!)
        //vc.mLibro = libro
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.categorias?.count ?? 0
    }
    
}

    extension BooksViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.categorias?[section].libros?.count ?? 0
  }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libr = dataSource?.categorias?[indexPath.section].libros?[indexPath.row]
        let cell = BookTableViewCell(libro: libr!)
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return height/7
        }
    }


extension BooksViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.categorias?[section].libros?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    let cell = librosCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionView
        let producto = dataSource?.categorias?[indexPath.section].libros?[indexPath.item]
        cell.setData( libro: producto!)
        
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: width/3 - 30, height: height / 4 - 60)
        //((indexPath.item % 2)  != 0 ) ? CGSize(width: width/2 - 40, height: height / 4) : CGSize(width: width/2 - 40, height: height / 5)
    }
}

