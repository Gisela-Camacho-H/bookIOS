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

            let tales = Book(imagen: "tales")
            let fairyTales = Book(imagen: "fairy")
            let wutheringHeights = Book(imagen: "heights")
            let warAndPeace = Book(imagen: "war")
            let theDivineComedy = Book(imagen: "divine")
            let donQuixote = Book(imagen: "quixote")
            let theCastle = Book(imagen: "castle")
            let invisibleMan = Book(imagen: "man")
            let TheOldman = Book(imagen: "old")
            let Eneida = Book(imagen: "eneida")
            let Tales = Catego(name: "Tales", books: [tales, fairyTales, wutheringHeights, warAndPeace, theDivineComedy, donQuixote, theCastle, invisibleMan, TheOldman, Eneida])

            let Image = BooksObjectCollection(catego: [Tales], title: "Recent Books")
            
            imageSource = Image
            
        }
    var counter = 0
    var cart = [String: Any]()
    var dataSource : BookObject?
    
    func getData(){
        
        cart = UserDefaults.standard.dictionary(forKey: "superCart") ?? [String:Any]()
        
        // MARK: - Tales
 
        let talesAndPoems = Books(name: "Tales and Poems", description: "This title collects Poe's fiction and poetry, including 'The Fall of the House of Usher', 'The Tell-Tale Heart', 'The Pit and the Pendulum', 'The Raven', 'Annabel Lee', and the novel 'The Narrative of Arthur Gordon Pym of Nantucket'.", author: "Edgar Allan Poe", image: "tales", details: "Austral Basics", aboutAuthor: "Edgar Allan Poe was an American writer, poet, critic and editor best known for evocative short stories and poems that captured the imagination and interest of readers around the world. His imaginative storytelling and tales of mystery and horror gave birth to the modern detective story.", categories: "Tales", imageAuthor: "edgar")
        
        let fairyTales = Books(name: "Fairy Tales", description: "All the best-loved fairy tales of Hans Christian Andersen, including 'The Ugly Duckling,' 'Thumbelina,' 'The Red Shoes,' 'The Princess on the Pea,' and 'The Emperor’s New Clothes,' fill the pages of this beautiful leather-bound collector’s edition", author: "Hans C. Andersen", image: "fairy", details: "Nordican Leyends", aboutAuthor: "Andersen was a Danish author. Although a prolific writer of plays, travelogues, novels, and poems, he is best remembered for his literary fairy tales.", categories: "Tales", imageAuthor: "hans")
        
        let Tales = Category(name: "Tales", books: [talesAndPoems, fairyTales])
        
        // MARK: - literatura
        let heights = Books(name: "Wuthering Heights", description: "Catherine and Heathcliff's, a foundling adopted by Catherine's father, passionate but doomed love forms the core of this extraordinary tale. Catherine's brother Hindley's hatred and humiliation of Heathcliff leads to tragedy when Catherine marries another and Heathcliff returns newly wealthy to enact his revenge on all who wronged him.", author: "Emily Brontë", image: "heights", details: "British Literature", aboutAuthor: "Emily Jane Brontë, pseudonym Ellis Bell, (born July 30, 1818, Thornton, Yorkshire, England—died December 19, 1848, Haworth, Yorkshire), English novelist and poet who produced but one novel, Wuthering Heights (1847), a highly imaginative work of passion and hate set on the Yorkshire moors", categories: "Literature", imageAuthor: "emily")
        
        let warAndPeace = Books(name: "War and Peace", description: "Tolstoy's epic masterpiece intertwines the lives of private and public individuals during the time of the Napoleonic wars and the French invasion of Russia. The fortunes of the Rostovs and the Bolkonskys, of Pierre, Natasha, and Andrei, are intimately connected with the national history that is played out in parallel with their lives. ", author: "León Tolstói", image: "war", details: "Russian Literature", aboutAuthor: "was a Russian writer who is regarded as one of the greatest authors of all time. He received nominations for the Nobel Prize in Literature every year from 1902 to 1906 and for the Nobel Peace Prize in 1901, 1902, and 1909. That he never won is a major controversy.", categories: "Literature", imageAuthor: "leon")
        
        let literature = Category(name: "Literature", books: [heights, warAndPeace])
        
        // MARK: - Clásicos
 
        let theDivineComedy = Books(name: "The Divine Comedy", description: "The Divine Comedy is one of the greatest ever works of western literature. In this epic poem, Dante imagines the afterlife by representing his own travels through Hell, Purgatory and Paradise. With Virgil as his guide, he travels to the Earthly Paradise.", author: "Dante Alighieri", image: "divine", details: "Universal", aboutAuthor: "Dante, in full Dante Alighieri, (born c. May 21–June 20, 1265, Florence [Italy]—died September 13/14, 1321, Ravenna), Italian poet, prose writer, literary theorist, moral philosopher, and political thinker.", categories: "Clasics", imageAuthor: "dante")
        
        let donQuixote = Books(name: "Don Quixote", description: "Entranced by romantic tales of heroism and chivalry, Don Quixote goes on a delusional quest for fame and adventure as a self-proclaimed knight errant. Riding his nag of a horse and wearing a rusty old suit of armor, he roams the countryside with his loyal squire Sancho Panza. Together they encounter an array of unforgettable characters and undertake some of the most famously foolhardy exploits in literature.", author: "Miguel de Cervantes", image: "quixote", details: "literature", aboutAuthor: "Miguel de Cervantes, in full Miguel de Cervantes Saavedra, (born September 29?, 1547, Alcalá de Henares, Spain—died April 22, 1616, Madrid), Spanish novelist, playwright, and poet, the creator of Don Quixote (1605, 1615) and the most important and celebrated figure in Spanish literature.", categories: "Clasics", imageAuthor: "miguel")
        
        let Clasics = Category(name: "Clasics", books: [theDivineComedy, donQuixote])
        
        // MARK: - Novelas
 
        let theCastle = Books(name: "The Castle", description: "The story of K - the unwanted land surveyor who is never to be admitted to the Castle and yet cannot go home - seems to depict, like a dream from the deepest recesses of consciousness, an inexplicable truth about the nature of existence. A perpetual human condition lies at the heart of this labyrinthine world: dualities of certainty and doubt, hope and fear, reason and nonsense, harmony and disintegration.", author: "Franz Kafka", image: "castle", details: "Fiction Works", aboutAuthor: "Franz Kafka, (born July 3, 1883, Prague, Bohemia, Austria-Hungary [now in Czech Republic]—died June 3, 1924, Kierling, near Vienna, Austria), German-language writer of visionary fiction whose works", categories: "Novels", imageAuthor: "franz")
        
        let invisibleMan = Books(name: "Invisible Man", description: "Published in 1952 when American society was in the cusp of immense change, the powerfully depicted adventures of Ellison's invisible man - from his expulsion from a Southern college to a terrifying Harlem race riot - go far beyond the story of one individual to give voice to the experience of an entire generation of black Americans.", author: "Ralph Ellison", image: "man", details: "Novela Inglesa", aboutAuthor: "in full Ralph Waldo Ellison, (born March 1, 1914, Oklahoma City, Oklahoma, U.S.—died April 16, 1994, New York, New York), American writer who won eminence with his first novel (and the only one published during his lifetime), Invisible Man (1952).", categories: "Novels", imageAuthor: "ralph")
        
        let manAndSea = Books(name: "The Old Man and The Sea", description: "The Old Man and the Sea examines themes of courage in the face of hardship and perseverance in the face of apparent defeat through Santiago, an old Cuban fisherman who is down on his luck. He also happens to be in the middle of his life’s greatest struggle — a high-stakes battle with a relentless marlin out the Gulf Stream. (You can understand the Moby-Dick comparison). ", author: "Ernest Hemingway", image: "old", details: "Cuban Work", aboutAuthor: "Ernest Hemingway, in full Ernest Miller Hemingway, (born July 21, 1899, Cicero [now in Oak Park], Illinois, U.S.—died July 2, 1961, Ketchum, Idaho), American novelist and short-story writer, awarded the Nobel Prize for Literature in 1954.", categories: "Novels", imageAuthor: "ernest")
        
        let Novels = Category(name: "Novels", books: [theCastle, invisibleMan, manAndSea])
        
        // MARK: - Epopeya Latina
        let aeneid = Books(name: "Aeneid", description: " is a Latin epic poem, written by Virgil between 29 and 19 BC,[1] that tells the legendary story of Aeneas, a Trojan who fled the fall of Troy and travelled to Italy, where he became the ancestor of the Romans. ", author: "Virgil", image: "eneida", details: " IX b.C.", aboutAuthor: "Virgil, also spelled Vergil, Latin in full Publius Vergilius Maro, (born October 15, 70 BCE, Andes, near Mantua [Italy]—died September 21, 19 BCE, Brundisium), Roman poet, best known for his national epic, the Aeneid (from c. 30 BCE; unfinished at his death)..", categories: "Latin Epic", imageAuthor: "virgilio")
        
        let LatinEpic = Category(name: "Latin Epic", books: [aeneid])
        
        let BooksCollection = BookObject(categories: [Tales,literature ,Clasics, Novels, LatinEpic], title: "Recent Books")
        
        dataSource = BooksCollection
        
    }
}
