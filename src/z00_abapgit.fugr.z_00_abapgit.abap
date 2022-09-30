FUNCTION Z_00_ABAPGIT.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(MODE_ZABAPGIT) TYPE  ENQMODE DEFAULT 'E'
*"     REFERENCE(TYPE) TYPE  ZABAPGIT-TYPE OPTIONAL
*"     REFERENCE(VALUE) TYPE  ZABAPGIT-VALUE OPTIONAL
*"     REFERENCE(X_TYPE) TYPE  C DEFAULT SPACE
*"     REFERENCE(X_VALUE) TYPE  C DEFAULT SPACE
*"     REFERENCE(_SCOPE) TYPE  C DEFAULT '2'
*"     REFERENCE(_WAIT) TYPE  C DEFAULT SPACE
*"     REFERENCE(_COLLECT) TYPE  DDENQCOLL DEFAULT ' '
*"  EXCEPTIONS
*"      FOREIGN_LOCK
*"      SYSTEM_FAILURE
*"----------------------------------------------------------------------
DATA: __seqta_tab TYPE SEQTA OCCURS 01 WITH HEADER LINE,
      __scope TYPE DDENQSCOPE,
      __wait TYPE DDENQWAIT.
__wait = _wait.
__scope = _scope.


DATA: BEGIN OF %a_ZABAPGIT,
*       Lock argument for table ZABAPGIT
            TYPE TYPE ZABAPGIT-TYPE,
            VALUE TYPE ZABAPGIT-VALUE,
      END OF %a_ZABAPGIT.
* Initialization of lock argument:
CALL 'C_ENQ_WILDCARD' ID 'HEX0' FIELD %a_ZABAPGIT.


* Assignment of lock parameters to lock fields:

IF NOT TYPE IS INITIAL OR
   NOT x_TYPE IS INITIAL.
   MOVE TYPE TO:
        %a_ZABAPGIT-TYPE.
ENDIF.

IF NOT VALUE IS INITIAL OR
   NOT x_VALUE IS INITIAL.
   MOVE VALUE TO:
        %a_ZABAPGIT-VALUE.
ENDIF.


* Fill the lock table:

__seqta_tab-gname = 'ZABAPGIT'.
__seqta_tab-gmode = MODE_ZABAPGIT.
__seqta_tab-garg = %a_ZABAPGIT.
APPEND __seqta_tab.


* Lock assigned:
PERFORM send_enqueue(saplsena)
        TABLES __seqta_tab
        USING '1' __scope __wait ' ' 'EZABAPGIT' _collect.

ENDFUNCTION.
