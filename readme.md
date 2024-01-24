# 2-Grid
## Exercice 1 : 
3) LazyVGrid c'est un composant qui ressemble à un VStack car il met en forme des éléments en colunne, mais il permet de gérer des grille d'éléments. On peux choisir le nombre de colonnes que nous voulons afin de faciliter le code.   
Il y a 3 types de colonne : 
- Flexible (Colonne de taille flexible, avec un min et un max de taille pour l'élément)
- Adaptative (Colonnes de taille fixe, ça met le plus d'élément possible dans la ligne avec la taille demandé)
- Fixed (Colonnes de taille fixe, ça met 1 élément de la taille demandé)

On utilise Flexible car on veux des éléments d'une taille minimum de 150px et que nous voulons 2 éléments par ligne

## Exercice 2 : 
```swift
// On étend notre fonction sur Image, pour pouvoir l'utiliser sur une Image
extension Image {
    // On créer un fonction "centerCropped()"
    func centerCropped() -> some View {
        // On créer un objet GeometryReader pour accéder à des propriétés comme la taille de l'écran
        GeometryReader { geo in
            // On utilise l'image actuelle
            self
            // On rend l'image resizable() pour qu'elle puisse changer de taille
            .resizable()
            // On garde les proportions de l'image pour éviter le déformement
            .scaledToFill()
            // On change la taille de l'image
            .frame(width: geo.size.width, height: geo.size.height)
            // On recadre l'image
            .clipped()
        }
    }
}
```

# 4-Appel-Reseau
## Exercice 3
async/await :
C'est le model asynchrone, on déclare des fonctions asynchrones avec async et quand on appelle ces fonctions on utilise await. C'est une syntaxe assez basique qui permet de facilement faire des appels API.   

Combine :
C'est un framework qui permet d'utiliser des flux de données asynchrone en Swift. Il faut créer des publishers qui emettent des valeurs, puis il faut manipuler ces publishers pour obtenir le résultat souhaité. C'est un méthode adapté pour les flux de données qui changent dans le temps.   

completionHandler / GCD :
C'est un model de programmation qui utilise les threads et des files d'attente. Il faut spécifier les actions à réaliser après une tache asynchrone. GCD est utilisé pour créer des files d'attente et executer du code sur ces files d'attente. Ce modele est très flexible et permet beaucoup de choses.

