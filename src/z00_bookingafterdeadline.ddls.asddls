@AbapCatalog.sqlViewName: 'Z00BOOKDEAD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking After Deadline'
define view Z00_BookingAfterDeadline
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    PDeadline : abap.dats
  as select from Z00_Booking
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      LuggageWeight,
      LuggageWeightUnit,
      FlightClass,
      Amount,
      CurrencyCode,
      OrderDate,
      CounterID,
      AgencyNumber
}
where
  FlightDate > $parameters.PDeadline
//  FlightDate > $session.system_date
