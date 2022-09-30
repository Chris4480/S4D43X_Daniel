@AbapCatalog.sqlViewName: 'Z00DEMO01' // Name der Datenbankview, max. 16 Zeichen
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 1: Projections'
define view Z00_Demo01 // Name der CDS-View, max. 30 Zeichen
  as select from scarr
{
  key carrid   as CarrierID,
      carrname as CarrierName,
      currcode as CurrencyCode
}
