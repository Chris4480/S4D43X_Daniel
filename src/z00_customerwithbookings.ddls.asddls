@AbapCatalog.sqlViewName: 'Z00CUSTBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with Bookings'
define view Z00_CustomerWithBookings
  as select from Z00_Customer
  association [0..*] to Z00_BookingAfterDeadline as _Bookings on Z00_Customer.ID = _Bookings.CustomerID
{
  key ID,
      Name,
      Form,
      Street,
      Postcode,
      City,
      Country,
      Discount,
      _Bookings
}
