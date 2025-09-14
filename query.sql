drop view view_cat;
create view view_cat as 
select id, 
(case

when 
(Zahlungsempfaenger like '%EDEKA%')
or (Zahlungsempfaenger like '%REWE%')
or (Zahlungsempfaenger like '%DMDro%')
or (Zahlungsempfaenger like '%Rossmann%')
or (Zahlungsempfaenger like '%GOASIA%')
or (Zahlungsempfaenger like '%Rossmann%')
or (Zahlungsempfaenger like '%Vitalia%')
or (Zahlungsempfaenger like '%SparFil%')
or (Zahlungsempfaenger like '%DeliLinz%')
then 'groceries'

when 
(Zahlungsempfaenger like '%BAECKEREI%')
or (Zahlungsempfaenger like '%Back%')
or (Zahlungsempfaenger like '%MCDON%')
or (Zahlungsempfaenger like '%Subway%')
or (Zahlungsempfaenger like '%Burger%')
or (Zahlungsempfaenger like '%back%')
or (Zahlungsempfaenger like '%Gastr%')
or (Zahlungsempfaenger like '%UBER%')
or (Zahlungsempfaenger like '%LOsteria%')
or (Zahlungsempfaenger like '%Restaurant%')
or (Zahlungsempfaenger like '%Cinnamood%')
or (Zahlungsempfaenger like '%GAiAGasteig%')
or (Zahlungsempfaenger like '%AlisSuperfood%')
or (Zahlungsempfaenger like '%Kebab%')
or (Zahlungsempfaenger like '%BACK%')
or (Zahlungsempfaenger like '%GIESINGERBIERMANUFAK%')
or (Zahlungsempfaenger like '%SLURPNUDELBAR%')
or (Zahlungsempfaenger like '%Foodmore%')
or (Zahlungsempfaenger like '%XIAOMILI%')
or (Zahlungsempfaenger like '%Cocktailhaus%')
or (Zahlungsempfaenger like '%Letcha%')
or (Zahlungsempfaenger like '%SPCTUMunchen%')
or (Zahlungsempfaenger like '%THEALLEYMUNICH%')
or (Zahlungsempfaenger like '%DUMPLINGS%')
or (Zahlungsempfaenger like '%TEASYUANWEI%')
or (Zahlungsempfaenger like '%DBFERN%')
or (Zahlungsempfaenger like '%IrishPub%')
or (Zahlungsempfaenger like '%ChuanFans%')
or (Zahlungsempfaenger like '%OLIVAAirport%')
or (Zahlungsempfaenger like '%DieTagesbar%')
or (Zahlungsempfaenger like '%RIEDMAIR%')
or (Zahlungsempfaenger like '%DerverrueckteEismache%')
or (Zahlungsempfaenger like '%MUNMUNTHAICOOKING%')
or (Zahlungsempfaenger like '%Lieferando%')

or (Zahlungsempfaenger like '%SumUpKioskTegernse%')
or (Zahlungsempfaenger like '%HORESTAURANTINMANC%')
or (Zahlungsempfaenger like '%GeishaPanAsia%')
or (Zahlungsempfaenger like '%JUPITERRESTAURANTB%')
or (Zahlungsempfaenger like '%HRatschillerSpezialb%')
or (Zahlungsempfaenger like '%deandavid%')
or (Zahlungsempfaenger like '%ChiThuChiThuGmbH%')
or (Zahlungsempfaenger like '%ChinaExpressResta%')
or (Zahlungsempfaenger like '%SUBWAY%')
or (Zahlungsempfaenger like '%BAGUETTSKI%')
or (Zahlungsempfaenger like '%DolceVitaamFriderici%')
or (Zahlungsempfaenger like '%KaffeeGlockenspiel%')
or (Zahlungsempfaenger like '%DEANDAVID%')
then 'restaurant'


when 
(Zahlungsempfaenger like '%PayPal%')
then 'paypal'


when 
(Zahlungsempfaenger like '%KochelaSee%')
or (Zahlungsempfaenger like '%DB Vertrieb%')
or (Zahlungsempfaenger like '%Therme%')
or (Zahlungsempfaenger like '%DBInfraGO%')
or (Zahlungsempfaenger like '%AgipServiceStation/Klais%')
or (Zahlungsempfaenger like '%OEBBTicket%')
then 'vacation'


when 
(Zahlungsempfaenger like '%AMAZON%')
or (Zahlungsempfaenger like '%SPORTHSCHUSTER%')
or (Zahlungsempfaenger like '%DECATHLON%')
or (Zahlungsempfaenger like '%CARHART%')
or (Zahlungsempfaenger like '%TRENDOPTIC%')
or (Zahlungsempfaenger like '%GooglePlayApps%')
then 'items'


when 
(Zahlungsempfaenger like '%DOGADO%')
or (Zahlungsempfaenger like '%Sixt%')
or (Zahlungsempfaenger like '%AUDIBLE%')
or (Zahlungsempfaenger like '%Kunsthalle%')
or (Zahlungsempfaenger like '%STADTWERKEMUENCHEN%')
or (Zahlungsempfaenger like '%DAVKletter%')
or (Zahlungsempfaenger like '%Boulder%')
or (Zahlungsempfaenger like '%KINOPOLISMULTIPLEX%')
or (Zahlungsempfaenger like '%VerleihSAPGarden%')
or (Zahlungsempfaenger like '%Schaustellerbetrieb%')
or (Zahlungsempfaenger like '%TierparkHellabrunn%')

then 'entertainment'

when 
(Zahlungsempfaenger like '%Jost%')
or (Zahlungsempfaenger like '%Muenchner Verkehrsge%')
or (Zahlungsempfaenger like '%MVGRAD%')
or (Zahlungsempfaenger like '%VOIDE%')
or (Zahlungsempfaenger like '%Techniker Krankenkasse%')
then 'rent/insurance/elec/mobility'

when 
(Zahlungsempfaenger like '%RBANK%')
or (Zahlungsempfaenger like '%TRANSACT22209769%')
then 'bargeld'

when 
(Zahlungsempfaenger like '%FLATEX%')
then 'umbuchung'

when 
(Zahlungsempfaenger like '%Greenpeace%')
or (Zahlungsempfaenger like '%SCHUFA%')
or (Zahlungsempfaenger like '%SPORTS4YOU%')
or (Zahlungsempfaenger like '%TUFAST%')
then 'mix'

else 'unknown'
end) as category
from umsaetze;

-- select id,buchungstag,betrag,verwendungszweck
-- from umsaetze 
-- where 
-- zahlungsempfaenger like '%PayPal%'
-- order by id
-- limit 50;

--Einnamen

-- select sum(Betrag)
-- from umsaetze, view_cat
-- where
-- view_cat.id = umsaetze.id and
-- umsatztyp = 'Eingang' and
-- buchungstag like '%0425'
-- limit 50;

--Ausgaben

-- select sum(Betrag)
-- from umsaetze, view_cat
-- where
-- view_cat.id = umsaetze.id and
-- umsatztyp = 'Ausgang' and
-- buchungstag like '%0425'
-- limit 50;

--Kategorien

-- select sum(Betrag),category
-- from umsaetze, view_cat
-- where
-- view_cat.id = umsaetze.id and
-- umsatztyp = 'Ausgang' and
-- buchungstag like '%0425'
-- group by category
-- limit 50;

-- select umsaetze.id, buchungstag, glaubiger, betrag, verwendungszweck, Zahlungsempfaenger
-- from umsaetze, view_cat
-- where
-- view_cat.id = umsaetze.id and
-- category = 'unknown' and
-- umsatztyp = 'Ausgang' and
-- limit 50;

