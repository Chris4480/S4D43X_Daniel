@AbapCatalog.sqlViewName: 'Z00DEMO04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 4: Literals and Cases'
define view Z00_Demo04
  as select from sbook
{
  bookid             as BookingID,
  'Winter is Coming' as String1,
  42                 as Integer1,
  0.1                as FloatingPointNumber1,
  cancelled          as Cancelled,
  case cancelled
    when '' then 'Flight Booked'
    when 'X' then 'Booking Cancelled'
    else cancelled
  end                as CancelledText,
  class,
  luggweight,
  wunit,
  case when class = 'F' then ''
       when luggweight > 25 and wunit = 'KG' then 'X'
       else ''
  end                as ExcessLugagge
}
