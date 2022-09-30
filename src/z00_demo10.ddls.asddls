@AbapCatalog.sqlViewName: 'Z00DEMO10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 10: Parameters'
define view Z00_Demo10
  with parameters
    PCarrierID    : s_carr_id,
    PConnectionID : s_conn_id
  as select from Z00_Flight
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      Price,
      CurrencyCode,
      Planetype,
      MaximumSeatsEconomy,
      MaximumSeatsBusiness,
      MaximumSeatssFirst,
      OccupiedSeatEconomy,
      OccupiedSeatsBusiness,
      OccupiedSeatsFirst,
      FreeSeatsEconomy,
      FreeSeatsBusiness,
      FreeSeatsFirst,
      Paymentsum
}
where
      CarrierID    = $parameters.PCarrierID
  and ConnectionID = $parameters.PConnectionID
