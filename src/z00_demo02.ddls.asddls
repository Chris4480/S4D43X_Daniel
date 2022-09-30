@AbapCatalog.sqlViewName: 'Z00DEMO02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 2: Selections and Inner Joins'
define view Z00_Demo02
  as select from sflight as Flight
    inner join   spfli   as Connection on  Flight.carrid = Connection.carrid
                                       and Flight.connid = Connection.connid
    inner join   scarr   as Carrier    on Flight.carrid = Carrier.carrid
{
  key Flight.carrid       as FlightCarrierID,
  key Connection.carrid   as ConnectionCarrierID,
  key Carrier.carrid      as CarrierCarrierID,
  key Flight.connid       as ConnectionID,
  key Flight.fldate       as FlightDate,
      Connection.cityfrom as DepartureCity,
      Connection.cityto   as ArrivalCity,
      Carrier.carrname    as CarrierName
}
where
  fltype <> 'X' // keine Charterflüge
