*&---------------------------------------------------------------------*
*& Report z00_abapcds_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abapcds_01.

PARAMETERS p_ctry TYPE s_country.

DATA agencys TYPE TABLE OF zi_abap_agencywithrevenue.

SELECT FROM zi_abap_agencywithrevenue
 FIELDS *
 WHERE country = @p_ctry
 ORDER BY name ASCENDING
 INTO TABLE @agencys.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( agencys ).
