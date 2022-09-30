@AbapCatalog.sqlViewAppendName: 'Z00BOOKX'
@EndUserText.label: 'Booking Extension'
extend view Z00_Booking with Z00_BookingExtension
  association [1..1] to stravelag as _TravelAgency on sbook.agencynum = _TravelAgency.agencynum
{
  sbook.custtype as CustomerType,
  sbook.smoker   as IsSmoker,
  _TravelAgency
}
