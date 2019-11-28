// Un Quantik est un plateau de 4x4 avec 4 régions dans chaque coins de 2x2,
// sur ce plateau jouent 2 joueurs dotés chacun d'un set de 8 pièces (2 cylindres, 2 cônes, 2 cubes, 2 boules) leur appartenant

public protocol Quantik : CustomStringConvertible {

	// Quantik : -> Quantik
	// Création d'une partie de Quantik
	// Création donc de deux joueurs ayant respectivement un set de pièce
	init ()

	// description : Quantik -> String
    // Retourne le plateau de jeu en String dans le but d'un affichage
    // Exemple d'affichage :
    // 							- : vide
    // 	-	-   ◯   -		◇ : cube joueur 1, ◆ : cube joueur 2
    //  ⬤   ◆   -   -    	◯ : sphere joueur 1, ⬤ : sphere joueur 2
    //  -   -   -   -		⬡ : cylindre joueur 1, ⬢ : cylindre joueur 2
    //  -   -   -   -		△ : cône joueur 1, ▲ : cône joueur 2
    var description : String {get}

    // Plateau : Quantik -> Quantik
	// Plateau de 4 cases sur 4 contenant ou non une pièce
	var Plateau : [Piece?] {get set}

	// Joueur1 : Quantik -> Quantik
	// Joueur 1
	var Joueur1 : Joueur {get set}

	// Joueur2 : Quantik -> Quantik
	// Joueur 2
	var Joueur2 : Joueur {get set}

	// JoueurActuel : Quantik -> Quantik
	// Prend Joueur1 ou Joueur2 selon qui est en train de jouer
	var JoueurActuel : Joueur {get set}

	// joueurAlea : Quantik -> Joueur
	// Retourne Joueur1 ou Joueur2 aléatoirement
	func joueurAlea() -> Joueur

	// switchJoueurActuel : Quantik -> Quantik
	// Si JoueurActuel est Joueur1 alors il devient Joueur2, sinon devient Joueur1
	mutating func switchJoueurActuel()

	// estVide : Quantik x Int x Int -> Bool
	// True si aux coordonées en paramètre on trouve du vide, false sinon
    func estVide(x:Int,y:Int) -> Bool

    // placementPossible : Quantik x Int x Int -> Bool
    // True si les coordonnées en paramètre sont dans le plateau, false sinon
    func placementPossible(x:Int,y:Int) -> Bool

    // estLibre : Quantik x Piece x Int x Int -> Bool
    // True si pour toute les pieceRecuperee, la pièce vérifie piece.memeForme(piece:pieceRecuperee) et !piece.memeProprietaire(piece:pieceRecuperee)
    // pieceRecuperee est une pièce de même région/ligne/colonne que la position choisie, False sinon
	func estLibre(piece:Piece,x:Int,y:Int) -> Bool
	
	// estPossible : Quantik x Piece|Vide x Joueur x Int x Int -> Bool
	// True si piece non vide et estLibre(piece:piece,x:x,y:y) et estVide(x:x,y:y) et placementPossible(piece:piece,x:x,y:y), false sinon
    func estPossible(piece:Piece?,joueur:Joueur,x:Int,y:Int) -> Bool

    // setPiece : Quantik x Piece x Int x Int -> Quantik
    // Pre : estPossible(piece:piece,joueur:piece.proprietaire,x:x,x:y)
    // Place la pièce sur la case (x,y)
    mutating func setPiece(piece:Piece,x:Int,y:Int) 

    // getLigne : Quantik -> [Piece]
    // Pre : Les coordonnées entrées sont valides et dans le tableau
    // Renvoi la ligne correspondant à la coordonnée entrée en paramètre
    func getLigne(x:Int,y:Int) -> [Piece]

    // getColonne : Quantik -> [Piece]
    // Pre : Les coordonnées entrées sont valides et dans le tableau
    // Renvoi la colonne correspondant à la coordonnée entrée en paramètre
    func getColonne(x:Int,y:Int) -> [Piece]

    // getRegion : Quantik -> [Piece]
    // Pre : Les coordonnées entrées sont valides et dans le tableau
    // Renvoi la région correspondant à la coordonnée entrée en paramètre
    func getRegion(x:Int,y:Int) -> [Piece]

    // partieTerminee : Quantik -> Quantik
    // Si une ligne/région/diagonale de 4 pièces différentes a été réalisée alors le joueur actuel est gagnant
    // Sinon si le joueur actuel ne peux plus rien jouer, alors l'adversaire est gagnant
    // Sinon ne fait rien
    mutating func partieTerminee() 

    
}