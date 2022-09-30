@AbapCatalog.sqlViewName: 'Z00DEMO11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 11: Environment System Fields'
define view Z00_Demo11
  with parameters
    PCarrierID    : s_carr_id,
    PConnectionID : s_conn_id,
    @Environment.systemField: #USER_DATE
    PDeadline     : s_date
  as select from Z00_Demo10(
                 PCarrierID: $parameters.PCarrierID,
                 PConnectionID: $parameters.PConnectionID)
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
  FlightDate > $parameters.PDeadline
//  FlightDate > $session.user_date
