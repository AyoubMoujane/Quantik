public protocol Piece {
	// Pre : la forme entrée est soit "Cube","Cône","Sphère","Cylindre"
	// Piece : Joueur x String -> Piece
	// Creation d'une pièce dont le proprietaire et la forme est en paramètre 
	init(joueur:Joueur,forme:String)

	// proprietaire : Piece -> Joueur
	// Joueur proprietaire de la piece
    var proprietaire : Joueur {get}

    // forme : Piece -> String
    // forme de la pièce (cône, sphere, cube ou cylindre pour le jeu Quantik)
    var forme : String {get}

    // memeForme : Piece x Piece | Vide -> Bool
    // False si piece est vide
	// Sinon si la piece en paramètre a la même forme que la piece alors True, False sinon
    func memeForme(piece:Piece?)->Bool

    // memeProprietaire : Piece x Piece | Vide -> Bool
    // False si piece est vide
    // Sinon si la piece en paramètre a le même proprietaire que la piece alors True, False sinon
    func memeProprietaire(piece:Piece?)->Bool

}
