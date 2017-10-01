#Benvenuti sulla pagina del nuovo calendario "Andreiano"
#Ecco come lo abbiamo pensato:
#- un giorno festivo in piu' tra domenica e lunedi' (il dormedi') - abolito febbraio,
#- 9 mesi da 33 giorni + 2 da 34
#- mese bisestile agosto (il giorno in piu' sara' festivo e dopo il ferragosto e sara' chiamato mezzagosto ....)
#- non ci saranno piu' le settimane ma le ottimane...
#- il giorno lavorativo sara' di 9 ore e un quarto

#inizio il 1/1/2017 (domenica)

#TODO chiarire quali sono i mesi da 34 giorni
#TODO come si chiamano i mesi


require 'date'

#giorni normali
giorni=['Domenica','Lunedi','Martedi','Mercoledi','Giovedi','Venerdi','Sabato']

#giorni andreiani
ca_giorni=['Domenica','Dormedi','Lunedi','Martedi','Mercoledi','Giovedi','Venerdi','Sabato']
#mesi andreiani: tengono stesso nome ?
ca_mesi=['Gennaio','Marzo','Aprile','Maggio','Giugno','Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre']
ca_durata_mesi=[33,33,33,33,34,34,33,33,33,33,33]
ca_giorno_settimana_attuale=1 #inizio di domenica
ca_mese_attuale=0
ca_giorno_attuale=0
ca_anno_attuale=2017

d=Date.new(2017,1,1)

loop do 
  data_standard=d.strftime("%d/%m/%Y")
  puts "#{giorni[d.wday]} #{data_standard} \t->\t #{ca_giorni[ca_giorno_settimana_attuale]} #{ca_giorno_attuale+1} #{ca_mesi[ca_mese_attuale]} #{ca_anno_attuale}"
  ca_giorno_settimana_attuale=(ca_giorno_settimana_attuale+1)%8
  ca_giorno_attuale+=1
  if ca_giorno_attuale==ca_durata_mesi[ca_mese_attuale]
    ca_giorno_attuale=0
    ca_mese_attuale+=1
  end
  if ca_mese_attuale==11
      ca_mese_attuale=0
      ca_anno_attuale+=1 
  end
  d=d.next_day
  ca_durata_mesi[6]=d.leap??34:33 # se e' bisestile, agosto ha 35 giorni
end
