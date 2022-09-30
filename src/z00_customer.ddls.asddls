@AbapCatalog.sqlViewName: 'Z00CUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer'
define view Z00_Customer
  as select from scustom
{
  key id       as ID,
      name     as Name,
      form     as Form,
      street   as Street,
      postcode as Postcode,
      city     as City,
      country  as Country,
      discount as Discount
}
