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

pharmacy_id(Name, ID):-pharmacy(ID, Name, _, _).

pharmacy_adress(Name, Adress):-pharmacy(_,Name,Adress,_).

pharmacy_phone(Name, Phone):-pharmacy(_,Name,_Phone).

available_drugs(Name):-pharmacy_id(Name, ID), sell(ID, _, _, _).

cheaepst_drug(Name, Adress):-


