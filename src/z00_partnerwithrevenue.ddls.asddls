@AbapCatalog.sqlViewName: 'Z00PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Partner with Revenue'
define view Z00_PartnerWithRevenue
  as select from Z00_CustomerWithRevenue
{
  key ID,
      'C' as Type,
      Name,
      Street,
      Postcode,
      City,
      Country,
      TotalAmount,
      CurrencyCode,
      AverageDaysAhead
}
union select from ZI_ABAP_AgencyWithRevenue
{
  key ID,
      'A' as Type,
      Name,
      Street,
      Postcode,
      City,
      Country,
      TotalAmount,
      CurrencyCode,
      AverageDaysAhead
}
