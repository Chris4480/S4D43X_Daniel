*&---------------------------------------------------------------------*
*& Report z00_abapcds_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abapcds_10.

DATA customers TYPE TABLE OF z00_customerwithbookings.

SELECT FROM z00_customerwithbookings
 FIELDS *
 INTO TABLE @customers
 UP TO 100 ROWS.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( customers ).
