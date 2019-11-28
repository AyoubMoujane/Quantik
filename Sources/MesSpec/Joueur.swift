public protocol Joueur : CustomStringConvertible {

	// Joueur : -> Joueur
	// Creation d'un Joueur avec le set de pièces par défaut dont il est propriétaire, 2x cylindres, 2x cônes, 2x sphères et 2x cubes
	// et gagnant à False
	init()

	// description : Joueur -> String
	// Retourne piecesRestantes sous forme de String dans le but d'un affichage
	// Exemple d'affichage : ⬤ ◆ ◆ ou ◯ ◯ ⬡ ⬡
	var description : String {get}

	// pieceRestantes : Joueur -> [Piece]
	// Collection des pièces non jouées du joueur
	var piecesRestantes : [Piece] {get set}

	// gagnant : Joueur -> Bool
	// True si le joueur a gagné la partie, sinon False
    var gagnant : Bool {get set}

    // retirerPiece : Joueur x Piece -> Joueur
	// Retire la pièce des pièces restantes du joueur
    mutating func retirerPiece(piece:Piece)

    // findPiece : Joueur x String -> (Piece | Vide)
	// Retourne une pièce dont la forme est entrée en paramètre 
	// si elle est disponible dans la collection, retourne vide sinon
	func findPiece(forme : String) -> Piece?

}


