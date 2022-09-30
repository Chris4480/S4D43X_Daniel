@AbapCatalog.sqlViewName: 'Z00DEMO12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 12: Associations'
define view Z00_Demo12
  as select from spfli as Connection
  association [0..*] to sflight as _Flights on  _Flights.carrid = Connection.carrid
                                            and _Flights.connid = Connection.connid
  association [1..1] to scarr   as _Carrier on  Connection.carrid = _Carrier.carrid
{
  key Connection.carrid    as Carrid,
  key Connection.connid    as Connid,
      Connection.countryfr as Countryfr,
      Connection.cityfrom  as Cityfrom,
      Connection.airpfrom  as Airpfrom,
      Connection.countryto as Countryto,
      Connection.cityto    as Cityto,
      Connection.airpto    as Airpto,
      _Flights,
      _Carrier
}
where
  fltype <> 'X' // keine Charterflüge
