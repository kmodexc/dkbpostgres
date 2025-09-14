create table umsaetze(
id serial,
Buchungstag varchar(255),
Wertstellung varchar(255),
BStatus varchar(255),
Zahlungspflichtige varchar(255),
Zahlungsempfaenger varchar(255),
Verwendungszweck varchar(1024),
Umsatztyp varchar(255),
IBAN varchar(255),
Betrag float4,
Glaubiger varchar(255),
Mandatsreferenz varchar(255),
Kundenreferenz varchar(255)
);

-- "Buchungsdatum";"Wertstellung";"Status";"Zahlungspflichtige*r";"Zahlungsempfänger*in";"Verwendungszweck";"Umsatztyp";"IBAN";"Betrag (€)";"Gläubiger-ID";"Mandatsreferenz";"Kundenreferenz"

\echo `cat /workspace/umsaetze.csv | sed 's/;$//g' | sed 's/\.//g' | sed 's/,/./g' > /workspace/converted.csv`;

\COPY umsaetze(Buchungstag,Wertstellung,BStatus,Zahlungspflichtige,Zahlungsempfaenger,Verwendungszweck,Umsatztyp,IBAN,Betrag,Glaubiger,Mandatsreferenz,Kundenreferenz) FROM '/workspace/converted.csv' DELIMITER ';' CSV;