//
//  BooksViewModel.swift
//  BookProyect
//
//  Created by GiselaCamacho on 22/02/22.
//

import Foundation

public class BooksViewModel {
    // MARK: - Imagenes de libros
    var imageSource : BooksObjectCollection?
    
        func getImage(){

            let tales = Book(imagen: "cuentos")
            let fairyTales = Book(imagen: "cuentosInf")
            let wutheringHeights = Book(imagen: "cumbres")
            let warAndPeace = Book(imagen: "guerra")
            let theDivineComedy = Book(imagen: "divina")
            let donQuixote = Book(imagen: "quijote")
            let theCastle = Book(imagen: "castillo")
            let invisibleMan = Book(imagen: "hombre")
            let TheOldman = Book(imagen: "viejo")
            let Eneida = Book(imagen: "eneida")
            let Tales = Catego(name: "Cuentos", books: [tales, fairyTales, wutheringHeights, warAndPeace, theDivineComedy, donQuixote, theCastle, invisibleMan, TheOldman, Eneida])

            let Image = BooksObjectCollection(catego: [Tales], title: "Recent Books")
            
            imageSource = Image
            
        }
    var counter = 0
    var cart = [String: Any]()
    var dataSource : BookObject?
    
    func getData(){
        
        cart = UserDefaults.standard.dictionary(forKey: "superCart") ?? [String:Any]()
        
        // MARK: - Tales
 
        let cuentos = Books(name: "Tales and Poems", description: "La edición de Cuentos en dos volúmenes ofrece la recopilación de los 67 Cuentos publicados a lo largo de su vida por Edgar Alan Poe. Se reúnen las narraciones dominadas por el terror, la presencia de lo sobrenatural.", author: "Edgar Allan Poe", image: "cuentos", details: "Austral Básicos", aboutAuthor: "Escritor, poeta, narrador, periodista y crítico literario americano, quien se conoció por su narrativa de terror, horror romántico y su maestría del relato de influencia gótica, siendo considerado uno de los grandes de la literatura universal y padre del género detectivesco.", categories: "Tales", imageAuthor: "edgar")
        
        let cuentosInfantiles = Books(name: "Fairy Tales", description: "Algunos inspirados en cuentos y leyendas nórdicas, pero la mayoría de ellos inventados por él y caracterizada por una gran imaginación, humor y sensibilidad.", author: "Hans C. Andersen", image: "cuentosInf", details: "Leyendas Nórdicas", aboutAuthor: "Nació en el año 1805, en Odense, Dinamarca, fue escritor del género infantil por los cuáles recibió las distinciones Orden de Dannebrog, Order of the Red Eagle 3rd Class, Premio Prometheus en la categoría Hall of Fame, Orden bávara de Maximiliano para la Ciencia y las Artes (1859) y Golden Paintbrush (1976).", categories: "Tales", imageAuthor: "hans")
        
        let Tales = Category(name: "Tales", books: [cuentos, cuentosInfantiles])
        
        // MARK: - literatura
        let cumbres = Books(name: "Wuthering Heights", description: "Catherine and Heathcliff's, a foundling adopted by Catherine's father, passionate but doomed love forms the core of this extraordinary tale. Catherine's brother Hindley's hatred and humiliation of Heathcliff leads to tragedy when Catherine marries another and Heathcliff returns newly wealthy to enact his revenge on all who wronged him.", author: "Emily Brontë", image: "cumbres", details: "Literatura Inglesa", aboutAuthor: "Nació en Thornton, Reino Unido, en 1818. La personalidad de Emily era áspera, salvaje y violenta. Este trabajo rompió por completo con los cañones de decoro que la Inglaterra victoriana requería para toda producción literaria.", categories: "Literature", imageAuthor: "emily")
        
        let guerraPaz = Books(name: "War and Peace", description: "Tolstoy's epic masterpiece intertwines the lives of private and public individuals during the time of the Napoleonic wars and the French invasion of Russia. The fortunes of the Rostovs and the Bolkonskys, of Pierre, Natasha, and Andrei, are intimately connected with the national history that is played out in parallel with their lives. ", author: "León Tolstói", image: "guerra", details: "Literatura Rusa", aboutAuthor: "Escritor, dramaturgo, filósofo, novelista, pedagogo y publicista de origen ruso, nacido en 1828, considerado uno de los escritores más importantes de la literatura mundial. Recibió varias nominaciones al Premio Nobel de Literatura de los años 1902 a 1906 y nominaciones al Premio Nobel de la Paz en 1901, 1902 y 1910.", categories: "Literature", imageAuthor: "leon")
        
        let literature = Category(name: "Literature", books: [cumbres,guerraPaz])
        
        // MARK: - Clásicos
 
        let LaDivinaComedia = Books(name: "The Divine Comedy", description: "The Divine Comedy is one of the greatest ever works of western literature. In this epic poem, Dante imagines the afterlife by representing his own travels through Hell, Purgatory and Paradise. With Virgil as his guide, he travels to the Earthly Paradise.", author: "Dante Alighieri", image: "divina", details: "Historia Universal", aboutAuthor: "Poeta italiano, nacido en 1265 en Florencia, Italia. Fue un importante poeta italiano de finales de la Edad Media y principios del Renacimiento. Dante recurre a la teología y filosofía cristianas medievales, especialmente a la filosofía tomista y a la Summa Theologica de Tomás de Aquino.", categories: "Clasics", imageAuthor: "dante")
        
        let donQuijote = Books(name: "Don Quixote", description: "Entranced by romantic tales of heroism and chivalry, Don Quixote goes on a delusional quest for fame and adventure as a self-proclaimed knight errant. Riding his nag of a horse and wearing a rusty old suit of armor, he roams the countryside with his loyal squire Sancho Panza. Together they encounter an array of unforgettable characters and undertake some of the most famously foolhardy exploits in literature.", author: "Miguel de Cervantes", image: "quijote", details: "Obra literaria", aboutAuthor: "Dramaturgo español nacido en 1547 en Madrid, España. Fue novelista, poeta, dramaturgo y soldado español. Es considerado la figura más grande de la literatura española.", categories: "Clasics", imageAuthor: "miguel")
        
        let Clasics = Category(name: "Clasics", books: [LaDivinaComedia, donQuijote])
        
        // MARK: - Novelas
 
        let ElCastillo = Books(name: "The Castle", description: "The story of K - the unwanted land surveyor who is never to be admitted to the Castle and yet cannot go home - seems to depict, like a dream from the deepest recesses of consciousness, an inexplicable truth about the nature of existence. A perpetual human condition lies at the heart of this labyrinthine world: dualities of certainty and doubt, hope and fear, reason and nonsense, harmony and disintegration.", author: "Franz Kafka", image: "castillo", details: "Alianza Editorial", aboutAuthor: "Austrohúngaro, nació en 1883, Praga, República Checa y tiene como principales temas los conflictos paternofiliales, la ansiedad, el existencialismo, la brutalidad física y psicológic", categories: "Novels", imageAuthor: "franz")
        
        let hombreInvisible = Books(name: "Invisible Man", description: "Published in 1952 when American society was in the cusp of immense change, the powerfully depicted adventures of Ellison's invisible man - from his expulsion from a Southern college to a terrifying Harlem race riot - go far beyond the story of one individual to give voice to the experience of an entire generation of black Americans.", author: "Ralph Ellison", image: "hombre", details: "Novela Inglesa", aboutAuthor: "Escritor y profesor estadounidense, nacido en Oklahoma, Estados Unidos, en 1913 y considerado uno de los novelistas estadounidenses más influyentes de la posguerra y ganador del Premio Anisfield-Wolf a los Logros Especiales y el Premio Nacional del Libro de ficción en 1953, entre otras distinciones.", categories: "Novels", imageAuthor: "ralph")
        
        let ViejoMar = Books(name: "The Old Man and The Sea", description: "The Old Man and the Sea examines themes of courage in the face of hardship and perseverance in the face of apparent defeat through Santiago, an old Cuban fisherman who is down on his luck. He also happens to be in the middle of his life’s greatest struggle — a high-stakes battle with a relentless marlin out the Gulf Stream. (You can understand the Moby-Dick comparison). ", author: "Ernest Hemingway", image: "viejo", details: "ambientada en cuba", aboutAuthor: "Escritor y periodista estadounidense, uno de los principales novelistas y escritores del siglo XX, nació en Illinois, Estados Unidos en 1899. Sus obras, consideradas clásicas en la literatura del siglo XX, tuvieron una notable influencia por la sobriedad de sus escritos, estilo que lo convirtió en el ganador del Premio Nobel de literatura en 1954.", categories: "Novels", imageAuthor: "ernest")
        
        let Novels = Category(name: "Novels", books: [ElCastillo, hombreInvisible, ViejoMar])
        
        // MARK: - Epopeya Latina
        let Eneida = Books(name: "Eneida", description: "Eneida cuenta los viajes y conflictos en los que está involucrado el héroe troyano Eneas después de su fuga apresurada de la ciudad de Troja. En el Mediterráneo, Eneas y sus colegas huyen de los troyanos de su ciudad natal, Troya, que fue destruida por los griegos.", author: "Virgilio", image: "eneida", details: "siglo IX a.C.", aboutAuthor: "Poeta romano nacido el 70 a. C. C. en Mantua, Italia. Autor del género Epic Poetry, sus primeras composiciones poéticas fueron compiladas bajo el nombre de Apéndice Virgiliano.", categories: "Latin Epic", imageAuthor: "virgilio")
        
        let LatinEpic = Category(name: "Latin Epic", books: [Eneida])
        
        let BooksCollection = BookObject(categories: [Tales,literature ,Clasics, Novels, LatinEpic], title: "Recent Books")
        
        dataSource = BooksCollection
        
    }
}
