# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "open-uri"


puts "Creating user admin"
User.create(email: "wanders.citytour@gmail.com", password: "170191")
puts "User lucie created"


puts "Creating categories"
Category.create(name: "Histoire") # 1
Category.create(name: "Insolite") # 2
Category.create(name: "Gastronomie") # 3
Category.create(name: "Art") # 4
Category.create(name: "Architecture") # 5
Category.create(name: "Divertissement") # 6
Category.create(name: "Mode") # 6
Category.create(name: "Cinéma") # 6
puts "Categories created"




puts "Creating places"
# 1
file_1 = URI.open("https://breves-histoire.fr/wp-content/uploads/2019/03/enseigne-croissant-lune_0.jpg")
place_1 = Place.new(fr_title: "Au Croissant de Lune", fr_description: "Si vous vous baladez du côté de la rue Montorgueil, vous pourrez admirer les traces d anciens cabarets, auberges et boutiques qui entre le 13ème et le 19ème siècle, profitaient de la proximité du grand marché des Halles pour attirer les visiteurs et les mareyeurs qui livrait huitres et poissons depuis les ports de Normandie. Au n°9, vers la Pointe de Sainte-Eustache, vous découvrirez une jolie sculpture en forme de croissant de lune sur fond de volutes, trônant à l entrée de la façade datant de 1730. Ce vestige est le seul élément de décor du célèbre cabaret « Au Croissant » qui, au 17ème siècle aurait appartenu à un dénommé Cyprien Hervet, docteur en médecine (revendu en 1681). Il aurait été fréquenté notamment par Giacomo Casanova de Seingalt, aventurier vénitien et grand séducteur de son époque.",
address: "9 rue Montorgueil, Paris", latitude: 48.863841961612785, longitude: 2.3462103108801284, category_id:6)
place_1.photo.attach(io: file_1, filename: "croissant.png", content_type: "image/png")
place_1.save
# 2
file_2 = URI.open("https://tse3.mm.bing.net/th?id=OIP.CFTIpbDaqAKBOliIwvUqggHaE8&pid=Api&P=0")
place_2 = Place.new(fr_title: "La Samaritaine", fr_description: "La Samaritaine est dans le paysage parisien depuis plus d un siècle. Installée sur les bords de Seine, elle doit son nom à une pompe à eau édifiée sur le pont Neuf. Inaugurée en 1608 à la demande du roi Henri IV, celle-ci est décorée de figures représentant la rencontre de Jésus et de la Samaritaine au puits de Jacob.C est en 1869 qu Ernest Cognacq crée la Samaritaine. Avant cela, il exerce plusieurs métiers de vendeur dont celui de calicot dans une tente sur le pont Neuf non loin de l ancienne pompe détruite en 1813. Très vite, il décide de louer un petit commerce de nouveautés juste à côté qu il nomme « À la Samaritaine ».",
address: "9 rue de la monnaie, Paris", latitude: 48.85996712540697, longitude: 2.342432453266122, category_id:5)
place_2.photo.attach(io: file_2, filename: "samaritaine.png", content_type: "image/png")
place_2.save
# 3
file_3 = URI.open("https://tse3.mm.bing.net/th?id=OIP.cea3TRhsEO0GgJGUVxUS2AHaFY&pid=Api&P=0")
place_3 = Place.new(fr_title: "Les Halles de Baltard", fr_description: "Surnommées « ventre de Paris » par Émile Zola qui, fasciné par la vie foisonnante qui s en dégageait, leur consacra l un de ses romans les plus célèbres, les halles constituent la principale source d approvisionnement de la capitale et de son agglomération. Délimitées à l est par la rue Saint-Denis, au sud par la rue de la Ferronnerie, à l ouest par la rue de la Tonnellerie et au nord par la rue de la Grande Truanderie, elles conservaient encore au début du XIXe siècle leur physionomie moyenâgeuse, comme le montre cette peinture de Giuseppe Canella l Aîné. La rue de la Tonnellerie y apparaît bordée de galeries couvertes, dits piliers, qui abritent les boutiques des commerçants et des artisans. Une foule dense se bouscule dans ces galeries où s entassent les denrées, souvent dans des conditions d hygiène douteuses. À cette insalubrité s ajoute l encombrement permanent des halles et des alentours, si bien qu en 1842 le préfet de Paris, Rambuteau, crée la Commission des halles et la charge d étudier leur réaménagement complet ou leur transfert. Aussitôt, l architecte Victor Baltard (1805-1874) élabore plusieurs projets successifs pour leur reconstruction. Après avoir imaginé dans un premier temps une solution hybride combinant la pierre et le fer, il s oriente à la demande expresse de Napoléon III vers une structure entièrement métallique déployée en de vastes parapluies, s inspirant de l architecture contemporaine des gares et des propositions audacieuses présentées par son collègue Hector Horeau. Après bien des tâtonnements et des hésitations, le projet définitif, qui consiste en l édification de douze pavillons à ossature de fonte recouverts de vitrages et réunis par des rues couvertes, est finalement retenu en 1854, et les travaux entamés aussitôt à l emplacement des halles de l Ancien Régime. Quinze ans furent nécessaires pour édifier dix des douze pavillons prévus. Une photographie d Henri Lemoine prise vers 1900 montre ces nouveaux pavillons dont les hautes verrières et la structure métallique apparente constituent une véritable prouesse technique. Les ressources offertes par le fer et le verre sont ici mises au service d une meilleure hygiène, grâce à la création de nombreux espaces dégagés dont la ventilation et l éclairage naturel sont assurés de manière efficace par des persiennes de verre.",
address: "101, Porte Berger, Paris", latitude: 48.86219388410755, longitude: 2.3470614919252717, category_id:5)
place_3.photo.attach(io: file_3, filename: "halles.png", content_type: "image/png")
place_3.save
# 4
file_4 = URI.open("https://tse4.mm.bing.net/th?id=OIP.ANqlC93yvQSgkZ0A5fp9uQHaE8&pid=Api&P=0")
place_4 = Place.new(fr_title: "Centre Pompidou", fr_description: "Dans les années 1960, le président Georges Pompidou lance le grand chantier du Centre Pompidou pour l art contemporain pour développer le rayonnement culturel et artistique français. Le quartier de Beaubourg est choisi, l espace disponible et la localisation permettent de grands projets. 681 projets d architecture sont proposés. Le jury désigne Renzo Piano et Richard Rogers comme lauréats. La maquette du projet surprend et ne fait pas l unanimité. Finalement, ce sera un immeuble ultra-moderne, la façade recouverte d un enchevêtrement de tuyaux et un rooftop surplombant Paris. Un projet très novateur pour l époque. Pompidou voulait faire de ce musée un centre multiculturel où plusieurs formes d art s expriment et se lient.D autre part, la bibliothèque tient une part importante. Elle permet aux lecteurs et étudiants de travailler dans un cadre idéal tout en étant en contact avec les arts.",
address: "1, Place Georges-Pompidou, Paris", latitude: 48.860614832318056, longitude: 2.351463011217993, category_id:4)
place_4.photo.attach(io: file_4, filename: "pompidou.png", content_type: "image/png")
place_4.save
# 5
file_5 = URI.open("https://tse3.mm.bing.net/th?id=OIP.YuiK_vN0AE6RixYv0CvtaQHaGb&pid=Api&P=0")
place_5 = Place.new(fr_title: "Pâtisserie Stohrer", fr_description: "Attention les yeux, Stohrer peut se vanter d'être la plus ancienne pâtisserie de Paris. Créée en 1730, elle a notamment nourri Marie Leszczynska, la femme de Louis XV, qui a en fait emmené dans ses valises son pâtissier polonais. Créateur du baba au rhum, Nicolas Stohrer est très vite devenu une référence de la rue Montorgueil. Et si tu n'aimes pas pâtisseries, tu peux au moins t'arrêter pour regarder sa jolie façade historique, ses dorures et ses fresques, mais surtout son esprit commerce de quartier.",
address: "51, rue Montorgueil, Paris", latitude: 48.86578945647034, longitude: 2.3466358225884973, category_id:3)
place_5.photo.attach(io: file_5, filename: "stoher.png", content_type: "image/png")
place_5.save
# 6
file_6 = URI.open("https://tse4.mm.bing.net/th?id=OIP.XEdTl7LXuc3yXhf8IREbdAHaFc&pid=Api&P=0")
place_6 = Place.new(fr_title: "L'escargot Montorgueil", fr_description: "Impossible de passer à côté de ce restaurant à la déco Second Empire. Bon, tout est dans le nom donc si la vue des escargots te dégoûte, on te conseille de passer ton chemin. En revanche si tu es friand de mollusques aux échalotes et à l'ail, ça devrait t'intéresser. Tu pourras évidememnt déguster de délicieux escargots mais tu trouveras aussi au menu le canard de Challans à l orange ou encore les crêpes Suzette. Mais ce restaurant ne serait rien sans son histoire : figure-toi qu'il était le QG de personnalités comme Sarah Bernhardt ou encore Marcel Proust.",
address: "38,rue Montorgueil, Paris", latitude: 48.86474006771653, longitude: 2.3469983606620715, category_id:3)
place_6.photo.attach(io: file_6, filename: "escargot.png", content_type: "image/png")
place_6.save
# 7
file_7 = URI.open("https://tse2.mm.bing.net/th?id=OIP.l3R6gOAq9req0SkWz2Ap5gHaJ4&pid=Api&P=0")
place_7 = Place.new(fr_title: "Mur végétal", fr_description: "Les 250 m2 de ce mur végétal imaginé par Patrick Blanc ont de quoi impressionner ! Tu pourras y voir 7500 plantes de près de 250 espèces différentes, une petite merveille. Baptisé l'oasis d'Aboukir, ce mur est une véritable mini-forêt au milieu des immeubles, et on doit avouer que ça fait du bien.",
address: "1, Rue d Aboukir, Paris", latitude: 48.86843773565951, longitude: 2.3468253686155576, category_id:2)
place_7.photo.attach(io: file_7, filename: "vegetal.png", content_type: "image/png")
place_7.save
# 8
file_8 = URI.open("https://tse3.mm.bing.net/th?id=OIP.l7KQE6qjhM4YpEy5cAemIAHaFU&pid=Api&P=0")
place_8 = Place.new(fr_title: "Saint Eustache", fr_description: "Située au bout de la rue Montorgueil, l'église Sainte-Eustache est l'une des plus visitées de Paris. Construite en 1532, puis restaurée en 1840, elle superpose les styles et les époques : gothique à l extérieur, renaissance et classique à l intérieur. Connue pour sa très bonne acoustique et surtout pour son orgue, Sainte-Eustache accueille de nombreuses formations philharmoniques, des chœurs et des festivals.",
address: "2, impasse Saint-Eustache, Paris", latitude: 48.86352696680335, longitude: 2.34508077106212, category_id:5)
place_8.photo.attach(io: file_8, filename: "eustache.png", content_type: "image/png")
place_8.save
puts "Places created"




puts "Creating Favourite places"
FavouritePlace.create(user_id: 1, place_id:1)
FavouritePlace.create(user_id: 1, place_id:2)
FavouritePlace.create(user_id: 1, place_id:3)
puts "Favourite places created"
