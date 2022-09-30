*&---------------------------------------------------------------------*
*& Report z00_demo_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_01.

DATA carriers TYPE TABLE OF z00_demo01.

SELECT FROM Z00_Demo01
 FIELDS *
 ORDER BY PRIMARY KEY
 INTO TABLE @carriers.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( carriers ).
