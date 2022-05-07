pharmacy(100, "Ригла", "Минская", 1234567).
pharmacy(101, "Горздрав", "Столетова", 8981453).
pharmacy(110, "36.6", "Кременчугская", 5221675).
pharmacy(111, "Столички", "Черниховского", 3467823).

drug(322, "Арбидол").
drug(323, "Тавегил").
drug(324, "Солпадеин").
drug(325, "Цетрин").

sell(100, 324, 150, 32).
sell(100, 323, 224, 13).
sell(100, 325, 768, 15).
sell(101, 322, 333, 29).
sell(101, 324, 220, 34).
sell(110, 325, 769, 48).
sell(111, 322, 335, 27).

pharmacy_id(ID, Name):-pharmacy(ID, Name, _, _).

pharmacy_adress(Name, Adress):-pharmacy(_,Name,Adress,_).

pharmacy_phone(Name, Phone):-pharmacy(_,Name,_,Phone).

pharmacy_ID_phone(ID, Phone):-pharmacy(ID,_,_,Phone).

drug_ID(Name,ID):-drug(ID, Name).

minimum(A,B,Min):-A<B,Min = A ; Min = B.

available_drugs(Name, Drug_ID):-pharmacy_id(ID, Name), sell(ID, Drug_ID, _, _).

println(Name):- print(Name),print("\n");

/*Находит аптеку в котором колчисетво лекарств не меньше чем Quantity*/
neccesary_drug(Name, Quantity, Phone):-drug(ID, Name), sell(Ph_ID, ID,_,Number),
    Number >= Quantity,
    pharmacy_ID_phone(Ph_ID,Phone).

/*Выводит все аптеки в которых продается лекарство*/
all_pharmacies(Name):-drug(ID,Name), sell(Ph_ID,ID,_,_), pharmacy_id(Ph_ID, Ph_Name), println(Ph_Name), fail.
