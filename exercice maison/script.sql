#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        category_id   Int  Auto_increment  NOT NULL ,
        category_type Varchar (50) NOT NULL
	,CONSTRAINT category_PK PRIMARY KEY (category_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: biensImmo
#------------------------------------------------------------

CREATE TABLE biensImmo(
        biensImmo_id         Int  Auto_increment  NOT NULL ,
        biensImmo_name       Varchar (50) NOT NULL ,
        biensImmo_postalCode Varchar (5) NOT NULL ,
        biensImmo_price      Decimal NOT NULL ,
        category_id          Int NOT NULL
	,CONSTRAINT biensImmo_PK PRIMARY KEY (biensImmo_id)

	,CONSTRAINT biensImmo_category_FK FOREIGN KEY (category_id) REFERENCES category(category_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: clients
#------------------------------------------------------------

CREATE TABLE clients(
        clients_id        Int  Auto_increment  NOT NULL ,
        clients_lastname  Varchar (50) NOT NULL ,
        clients_firstname Varchar (50) NOT NULL ,
        clients_birthDate Date NOT NULL ,
        clients_mail      Varchar (50) NOT NULL ,
        clients_budget    Decimal NOT NULL ,
        category_id       Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (clients_id)

	,CONSTRAINT clients_category_FK FOREIGN KEY (category_id) REFERENCES category(category_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: time
#------------------------------------------------------------

CREATE TABLE time(
        time_id       Int  Auto_increment  NOT NULL ,
        time_timeslot Varchar (50) NOT NULL
	,CONSTRAINT time_PK PRIMARY KEY (time_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appointment
#------------------------------------------------------------

CREATE TABLE appointment(
        appointment_id   Int  Auto_increment  NOT NULL ,
        appointment_date Date NOT NULL ,
        time_id          Int NOT NULL ,
        clients_id       Int NOT NULL ,
        biensImmo_id     Int NOT NULL
	,CONSTRAINT appointment_PK PRIMARY KEY (appointment_id)

	,CONSTRAINT appointment_time_FK FOREIGN KEY (time_id) REFERENCES time(time_id)
	,CONSTRAINT appointment_clients0_FK FOREIGN KEY (clients_id) REFERENCES clients(clients_id)
	,CONSTRAINT appointment_biensImmo1_FK FOREIGN KEY (biensImmo_id) REFERENCES biensImmo(biensImmo_id)
)ENGINE=InnoDB;
