@AbapCatalog.sqlViewName: 'Z00DEMO13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 13: Path Expressions'
define view Z00_Demo13
  as select from Z00_Demo12
{
  key Carrid,
  key Connid,
      _Carrier.carrname as Carrname,
      Countryfr,
      Cityfrom,
      Airpfrom,
      Countryto,
      Cityto,
      Airpto,
      /* Associations */
      _Flights
}
