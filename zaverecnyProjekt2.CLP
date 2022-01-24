(deftemplate penguin
	(slot species(type SYMBOL) (allowed-symbols Adelie Chinstrap Gentoo))
	(slot culmen_length_mm (type FLOAT) (range 0.0 59.6))
	(slot culmen_depth_mm (type FLOAT) (range 0.0 21.5))
	(slot flipper_length_mm (type FLOAT) (range 0.0 231.0))
	(slot body_mass_g (type FLOAT) (range 0.0 6300.0))
	(slot island_Biscoe(type INTEGER) (range 0 1))
	(slot island_Dream(type INTEGER) (range 0 1))
	(slot island_Torgersen(type INTEGER) (range 0 1))
	(slot sex_FEMALE(type INTEGER) (range 0 1))
	(slot sex_MALE(type INTEGER) (range 0 1))	
)

(deftemplate zadane_hodnoty
	(slot culmen_length_mm (type FLOAT) (range 0.0 59.6))
	(slot culmen_depth_mm (type FLOAT) (range 0.0 21.5))
	(slot flipper_length_mm (type FLOAT) (range 0.0 231.0))
	(slot body_mass_g (type FLOAT) (range 0.0 6300.0))
	(slot island_Biscoe(type INTEGER) (range 0 1))
	(slot island_Dream(type INTEGER) (range 0 1))
	(slot island_Torgersen(type INTEGER) (range 0 1))
	(slot sex_FEMALE(type INTEGER) (range 0 1))
	(slot sex_MALE(type INTEGER) (range 0 1))	
)

;zoznam
(deffacts penguins
  (penguin (species Adelie) (culmen_length_mm 39.1)
  (culmen_depth_mm 18.7) (flipper_length_mm 181.0) (body_mass_g 3750.0)
  (island_Biscoe 0) (island_Dream 0) (island_Torgersen 1)
  (sex_FEMALE 0) (sex_MALE 1))

  (penguin (species Adelie) (culmen_length_mm 39.5)
  (culmen_depth_mm 17.4) (flipper_length_mm 186.0) (body_mass_g 3800.0)
  (island_Biscoe 0) (island_Dream 0) (island_Torgersen 1)
  (sex_FEMALE 1) (sex_MALE 0))

  (penguin (species Chinstrap) (culmen_length_mm 46.5)
  (culmen_depth_mm 17.9) (flipper_length_mm 192.0) (body_mass_g 3500.0)
  (island_Biscoe 0) (island_Dream 1) (island_Torgersen 0)
  (sex_FEMALE 1) (sex_MALE 0))

  (penguin (species Chinstrap) (culmen_length_mm 50.0)
  (culmen_depth_mm 19.5) (flipper_length_mm 196.0) (body_mass_g 3900.0)
  (island_Biscoe 0) (island_Dream 1) (island_Torgersen 0)
  (sex_FEMALE 0) (sex_MALE 1))

  (penguin (species Gentoo) (culmen_length_mm 46.1)
  (culmen_depth_mm 13.2) (flipper_length_mm 211.0) (body_mass_g 4500.0)
  (island_Biscoe 1) (island_Dream 0) (island_Torgersen 0)
  (sex_FEMALE 1) (sex_MALE 0))

  (penguin (species Gentoo) (culmen_length_mm 50.0)
  (culmen_depth_mm 16.3) (flipper_length_mm 230.0) (body_mass_g 5700.0)
  (island_Biscoe 1) (island_Dream 0) (island_Torgersen 0)
  (sex_FEMALE 0) (sex_MALE 1))
)

(deffacts pomocne_fakty
	(menu)
	(pom))

(defrule zobraz_menu
?prec<-(menu)
=>
	(retract ?prec)
	(printout t "------------<MENU>-----------" crlf)
	(printout t "Zoznam tucniakov............A" crlf)
	(printout t "Zisti druh tucniaka.........B" crlf)
	(printout t "Pridanie do zoznamu.........C" crlf)
        (printout t "Zoznam podla pohlavia.......D" crlf)
	(printout t "Zoznam podla druhu..........E" crlf)
	(printout t "Koniec programu.............K" crlf)
	(printout t "-----------------------------" crlf)
	(printout t " " crlf)
	(printout t "Zadajte vasu volbu:")
	(assert (moja_volba (read))))

;zoznam tucniakov
(defrule zoznam
	(moja_volba A)
	(penguin (species ?a) (culmen_length_mm ?b)
  	(culmen_depth_mm ?c) (flipper_length_mm ?d) (body_mass_g ?e)
 	(island_Biscoe ?f) (island_Dream ?g) (island_Torgersen ?h)
  	(sex_FEMALE ?i) (sex_MALE ?j))
=>	
	(printout t "V zozname je evidovany tucniak --> ")
	(printout t " Druh: " ?a ", Dlzka zobaka: " ?b ", Hlbka zobaka: " ?c ", Dlzka plutvy: " ?d 
	 ", Vaha: " ?e ", " crlf "Ostrov Biscoe: " ?f ", Ostrov Dream: " ?g ", Ostrov Torgersen: " ?h ", Samica: " ?i ", Samec: " ?j crlf crlf crlf))

;vstupne hodnoty
(defrule vstupne_hodnoty
   (moja_volba B)
=>
   (printout t "-----------------------------" crlf)
   (printout t "--<ZADAJTE VSTUPNE HODNOTY>--" crlf)
   (printout t "-----------------------------" crlf)

   (printout t "culmen_length_mm - dlzka zobaka v mm(0.0-59.6):")
   (bind ?culmen_length_mm (read))
   (printout t "culmen_depth_mm - hlbka zobaka v mm(0.0-21.5):")
   (bind ?culmen_depth_mm (read))
   (printout t "flipper_length_mm - Dlzka plutvy v mm(0.0-231.0):")
   (bind ?flipper_length_mm (read))
   (printout t "body_mass_g - hmotnost tucniaka v gramoch(0.0-6300.0):")
   (bind ?body_mass_g (read))
   (printout t "island_Biscoe - ostrov Biscoe(0-1):")
   (bind ?island_Biscoe (read))
   (printout t "island_Dream - ostrov Dream(0-1):")
   (bind ?island_Dream (read))
   (printout t "island_Torgersen - ostrov Torgersen(0-1):")
   (bind ?island_Torgersen (read))
   (printout t "sex_FEMALE - samica(0-1):")
   (bind ?sex_FEMALE (read))
   (printout t "sex_MALE - samec(0-1):")
   (bind ?sex_MALE (read))

   (assert (zadane_hodnoty (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE)))
)

;pravidla-Adelie
(defrule rules-Adelie
  	(zadane_hodnoty (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE))

        (test
		(or
			(and (<= ?flipper_length_mm 206.5)
         		(<= ?culmen_length_mm 43.35)
	 		(<= ?culmen_length_mm 42.35)
	 		(> ?culmen_depth_mm 16.7))
     
	 		(and (<= ?flipper_length_mm 206.5)
         		(<= ?culmen_length_mm 43.35)
	 		(<= ?culmen_length_mm 42.35)
	 		(<= ?culmen_depth_mm 16.7)
		 	(<= ?culmen_length_mm 39.5))
	
 	 		(and (<= ?flipper_length_mm 206.5)
         		(<= ?culmen_length_mm 43.35)
	 		(> ?culmen_length_mm 42.35)
	 		(<= ?sex_FEMALE 0.5))

	 		(and (<= ?flipper_length_mm 206.5)
         		(> ?culmen_length_mm 43.35)
	 		(<= ?island_Dream 0.5)
	 		(<= ?flipper_length_mm 200.0))

	 		(and (> ?flipper_length_mm 206.5)
	 		(> ?culmen_depth_mm 17.65)
         		(<= ?culmen_length_mm 46.55))

	 		(and (<= ?flipper_length_mm 206.5)
	 		(> ?culmen_length_mm 43.35)
         		(> ?island_Dream 0.5)
	 		(<= ?culmen_length_mm 44.65)			
	 		(<= ?flipper_length_mm 199.0))
	 	)
        )

=>	
        (printout t "Druh tucniaka - Adelie" crlf))

;pravidla-Chinstrap
(defrule rules-Chinstrap
  	(zadane_hodnoty (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE))

        (test
		(or
			(and (<= ?flipper_length_mm 206.5)
	    		(> ?culmen_length_mm 43.35)
	    		(> ?island_Dream 0.5)
	    		(> ?culmen_length_mm 44.65))
	    
	    		(and (<= ?flipper_length_mm 206.5)
	    		(<= ?culmen_length_mm 43.35)
	   		(> ?culmen_length_mm 42.35)
	    		(> ?sex_FEMALE 0.5)) 
	
	    		(and (> ?flipper_length_mm 206.5)
	  		(> ?culmen_depth_mm 17.65)
	    		(> ?culmen_length_mm 46.55))

	   	    	(and (<= ?flipper_length_mm 206.5)
	    		(> ?culmen_length_mm 43.35)
	    		(> ?island_Dream 0.5)
	    		(<= ?culmen_length_mm 44.65)	
	    		(> ?flipper_length_mm 199.0)) 

	    		(and (<= ?flipper_length_mm 206.5)
	    		(<= ?culmen_length_mm 43.35)
	    		(<= ?culmen_length_mm 42.35)
	    		(<= ?culmen_depth_mm 16.7)	
	    		(> ?culmen_length_mm 39.5)) 
	 	)
        )

=>	
        (printout t "Druh tucniaka - Chinstrap" crlf))

;pravidla-Gentoo
(defrule rules-Gentoo
  	(zadane_hodnoty (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE))

        (test
		(or
			(and (> ?flipper_length_mm 206.5)
	   		(<= ?culmen_depth_mm 17.65))
	    
	    		(and (<= ?flipper_length_mm 206.5)
	    		(> ?culmen_length_mm 43.35)
	    		(<= ?island_Dream 0.5)			
	   		(> ?flipper_length_mm 200.0))
	 	)
        )

=>	
        (printout t "Druh tucniaka - Gentoo" crlf))

;zmazanie vstupnych hodnot
(defrule delete
	(declare (salience -30))
	(moja_volba B)
	?zmazat<-(zadane_hodnoty (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE))
=>
	(retract ?zmazat)
)


;pridanie
(defrule pridat
       (moja_volba C)
       =>
   (printout t "-----------------------------" crlf)
   (printout t "--<ZADAJTE VSTUPNE HODNOTY>--" crlf)
   (printout t "-----------------------------" crlf)

   (printout t "species - druh(Adelie|Chinstrap|Gentoo):")
   (bind ?species (read))
   (printout t "culmen_length_mm - dlzka zobaka v mm(0.0-59.6):")
   (bind ?culmen_length_mm (read))
   (printout t "culmen_depth_mm - hlbka zobaka v mm(0.0-21.5):")
   (bind ?culmen_depth_mm (read))
   (printout t "flipper_length_mm - Dlzka plutvy v mm(0.0-231.0):")
   (bind ?flipper_length_mm (read))
   (printout t "body_mass_g - hmotnost tucniaka v gramoch(0.0-6300.0):")
   (bind ?body_mass_g (read))
   (printout t "island_Biscoe - ostrov Biscoe(0-1):")
   (bind ?island_Biscoe (read))
   (printout t "island_Dream - ostrov Dream(0-1):")
   (bind ?island_Dream (read))
   (printout t "island_Torgersen - ostrov Torgersen(0-1):")
   (bind ?island_Torgersen (read))
   (printout t "sex_FEMALE - samica(0-1):")
   (bind ?sex_FEMALE (read))
   (printout t "sex_MALE - samec(0-1):")
   (bind ?sex_MALE (read))

        (assert (penguin (species ?species) (culmen_length_mm ?culmen_length_mm)
  	(culmen_depth_mm ?culmen_depth_mm) (flipper_length_mm ?flipper_length_mm) (body_mass_g ?body_mass_g)
 	(island_Biscoe ?island_Biscoe) (island_Dream ?island_Dream) (island_Torgersen ?island_Torgersen)
  	(sex_FEMALE ?sex_FEMALE) (sex_MALE ?sex_MALE)))

	(printout t "-----------------------------" crlf)
	(printout t "--------------<OK>-----------" crlf)
	(printout t "-----------------------------" crlf crlf))


;podla pohlavia
(defrule podla_pohlavia
	(moja_volba D)
	
=> 
	(printout t "Zadajte 1 ked chcete zoznam samiciek, 0 - ked chcete iba zoznam samic:" crlf)
        (bind ?pohlavie(read))
	(assert (pom ?pohlavie))
	
)

;podla pohlavia2
(defrule podla_pohlavia2
	(moja_volba D)
	(penguin (species ?a) (culmen_length_mm ?b)
  	(culmen_depth_mm ?c) (flipper_length_mm ?d) (body_mass_g ?e)
 	(island_Biscoe ?f) (island_Dream ?g) (island_Torgersen ?h)
  	(sex_FEMALE ?i) (sex_MALE ?j))

	(pom ?jednotka_alebo_nula)
	(test (eq ?i ?jednotka_alebo_nula))
=> 
	(printout t " Druh: " ?a ", Dlzka zobaka: " ?b ", Hlbka zobaka: " ?c ", Dlzka plutvy: " ?d 
	 ", Vaha: " ?e ", " crlf "Ostrov Biscoe: " ?f ", Ostrov Dream: " ?g ", Ostrov Torgersen: " ?h ", Samica: " ?i ", Samec: " ?j crlf crlf)

	
)

;podla pohlavia3
(defrule podla_pohlavia3
	(declare (salience -20))
	(moja_volba D)
	?prec2<-(pom ?x)
=>
	(retract ?prec2)
)

;podla druhu
(defrule podla_druhu
	(moja_volba E)
	
=> 
	(printout t "Zadajte species - druh(Adelie|Chinstrap|Gentoo):" crlf)
        (bind ?druh(read))
	(assert (pom ?druh))
	
)

;podla druhu2
(defrule podla_druhu2
	(moja_volba E)
	(penguin (species ?a) (culmen_length_mm ?b)
  	(culmen_depth_mm ?c) (flipper_length_mm ?d) (body_mass_g ?e)
 	(island_Biscoe ?f) (island_Dream ?g) (island_Torgersen ?h)
  	(sex_FEMALE ?i) (sex_MALE ?j))

	(pom ?druh)
	(test (eq ?a ?druh))
=> 
	(printout t " Druh: " ?a ", Dlzka zobaka: " ?b ", Hlbka zobaka: " ?c ", Dlzka plutvy: " ?d 
	 ", Vaha: " ?e ", " crlf "Ostrov Biscoe: " ?f ", Ostrov Dream: " ?g ", Ostrov Torgersen: " ?h ", Samica: " ?i ", Samec: " ?j crlf crlf)

	
)

;podla druhu3
(defrule podla_druhu3
	(declare (salience -30))
	(moja_volba E)
	?prec3<-(pom ?x)
=>
	(retract ?prec3)
)

;koniec programu
(defrule koniec
	(moja_volba K)
=>
	(printout t "-----------------------------" crlf)
	(printout t "------<KONIEC PROGRAMU!>-----" crlf)
	(printout t "-----------------------------" crlf crlf))

;dalsia volba
(defrule zrus_vsetko
	(declare (salience -50))
	?prec1<-(moja_volba ~K)
=>
	(retract ?prec1)
	(assert(menu)) 
)




