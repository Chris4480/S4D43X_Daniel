@AbapCatalog.sqlViewName: 'Z00DEMO07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 7: Aggregations'
define view Z00_Demo07
  as select from Z00_Flight
{
  key CarrierID,
      //  key ConnectionID,
      count(*)                                                                   as NumberOfFlights,
      count(distinct Planetype)                                                  as NumberOfDifferentPlanetypes,
      sum(MaximumSeatsBusiness)                                                  as TotalNumberOfMaxSeatsBusiness,
      sum(Paymentsum)                                                            as TotalPaymentsum,
      min(Price)                                                                 as LowestPrice,
      max(Price)                                                                 as HighestPrice,
      avg(Price as abap.dec(16,2))                                               as AveragePrice,
      CurrencyCode,
      sum(case when MaximumSeatsEconomy = OccupiedSeatEconomy then 1 else 0 end) as NumberOfBookedUpFlights
}
where
  Price > 500
group by
  CarrierID,
  //  ConnectionID,
  CurrencyCode
having
  sum(Paymentsum) > 10000000
