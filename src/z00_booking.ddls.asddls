@AbapCatalog.sqlViewName: 'Z00BOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking'
define view Z00_Booking
  as select from sbook
{
  key carrid     as CarrierID,
  key connid     as ConnectionID,
  key fldate     as FlightDate,
  key bookid     as BookingID,
      customid   as CustomerID,
      @Semantics.quantity.unitOfMeasure: 'LuggageWeightUnit'
      luggweight as LuggageWeight,
      wunit      as LuggageWeightUnit,
      class      as FlightClass,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      forcuram   as Amount,
      forcurkey  as CurrencyCode,
      order_date as OrderDate,
      counter    as CounterID,
      agencynum  as AgencyNumber
}
where
  cancelled <> 'X'
