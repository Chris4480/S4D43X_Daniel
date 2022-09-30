@AbapCatalog.sqlViewName: 'Z00DEMO09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 9: UNION and UNION ALL'
define view Z00_Demo09
  as select from scustom
{
  key id    as Id,
      name  as Name,
      form  as Form,
      email as Email
}
where
  city = 'Berlin'
union select distinct from scustom
  inner join               sbook     on sbook.customid = scustom.id
  inner join               stravelag on stravelag.agencynum = sbook.agencynum
{
  key id           as Id,
      scustom.name as Name,
      form         as Form,
      email        as Email
}
where
  stravelag.city = 'Berlin'
