create table umsaetze(
id serial,
Buchungstag varchar(255),
Wertstellung varchar(255),
Buchungstext varchar(255),
Auftraggeber varchar(255),
Verwendungszweck varchar(1024),
Kontonummer varchar(255),
BLZ varchar(255),
Betrag float4,
Glaubiger varchar(255),
Mandatsreferenz varchar(255),
Kundenreferenz varchar(255)
);

\echo `cat /workspace/umsaetze.csv | sed 's/;$//g' | sed 's/,/./g' > /workspace/converted.csv`;

\COPY umsaetze(Buchungstag,Wertstellung,Buchungstext,Auftraggeber,Verwendungszweck,Kontonummer,BLZ,Betrag,Glaubiger,Mandatsreferenz,Kundenreferenz) FROM '/workspace/converted.csv' DELIMITER ';' CSV;