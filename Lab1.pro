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

neccesary_drug(Name, Quantity, Phone):-drug(ID, Name), sell(Ph_ID, ID,_,Number),
    Number >= Quantity,
    pharmacy_ID_phone(Ph_ID,Phone).

cheapest_drug(Name, Price):-drug_ID(Name, Drug_ID),sell(_, Drug_ID, _, Price1),
                                                  (sell(_, Drug_ID, _, Price2), not(Price2 == Price1)),
                                                   (sell(_, Drug_ID, _, Price3), not(Price3 == Price2)),
                                                   (sell(_, Drug_ID, _, Price4),not(Price3 == Price4)),
    minimum(Price1,Price2,Min1),
    minimum(Price3,Price4,Min2),
    minimum(Min1,Min2,Price).
