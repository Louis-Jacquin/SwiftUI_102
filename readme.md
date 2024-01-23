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