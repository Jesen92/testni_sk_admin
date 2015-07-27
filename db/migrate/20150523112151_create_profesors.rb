class CreateProfesors < ActiveRecord::Migration
  def change
    create_table :profesors do |t|
      t.string :name 
      t.integer :OIB
      t.string :adresa
      t.string :jezik
      t.boolean :radi_za_nas
      t.text	:komentar
      t.boolean :sudski_tumac
      t.string 	:mobitel
      t.string	:telefon
      t.string	:mail
      t.string	:obrazovanje
      t.string	:karijerska_pozicija
      t.boolean	:inozemno_iskustvo
      t.date	:datum_rodenja
      t.string	:mjesto_rodenja
      t.string	:postanski_broj
      t.string	:grad
      t.string	:racun_banke
      add_attachment :document

      t.timestamps
    end
  end
end
