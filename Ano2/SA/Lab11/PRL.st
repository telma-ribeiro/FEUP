(* B1 *)
IF(%MW0=0)AND(%X6 OR %X7 OR %X8)AND(RE %I1.6)THEN
	%MW0:=1;
	SET %S23;
ELSIF(%MW0=1)AND(NOT %I1.6)THEN
	%MW0:=0;
	RESET %S23;
	RESET %X8;
	SET %X8;
ELSIF(%MW0=1)AND(RE %I1.7)THEN
	%MW0:=2;
	SET %S9;
ELSIF(%MW0=2)AND((NOT %I1.6)OR(NOT %I1.7))THEN
	%MW0:=1;
	RESET %S9;

(* B2 *)
ELSIF(%MW0=0)AND(%X6 OR %X7 OR %X8)AND(RE %I1.5)THEN
	%MW0:=3;
	%M0:=%X6;
	%M1:=%X7;
	%M2:=%X8;
	%M3:=%X9;
	%M4:=%X10;
	%M5:=%X11;
	SET %S22;
	SET %S9;
ELSIF(%MW0=3)AND(RE %I1.4)THEN
	%MW0:=4;
ELSIF(%MW0=3)AND(NOT %I1.5)THEN
	%MW0:=0;
	IF %M0 THEN SET %X6;END_IF;
	IF %M1 THEN SET %X7;END_IF;
	IF %M2 THEN SET %X8;END_IF;
	IF %M3 THEN SET %X9;END_IF;
	IF %M4 THEN SET %X10;END_IF;
	IF %M5 THEN SET %X11;END_IF;
	RESET %S9;
	RESET %S22;
ELSIF(%MW0=4)AND(NOT %I1.5)AND(NOT %I1.4)THEN
	%MW0:=0;
	RESET %S9;
	RESET %S22;
	SET %S21;
	RESET %Q2.3;
	RESET %Q2.11;
	RESET %Q2.9;
	RESET %Q2.7;

(* B3 *)
ELSIF(%MW0=0)AND(%X8)AND(%X8.T>=60)THEN
	%MW0:=5;
	SET %S21;
	RESET %Q2.3;
	RESET %Q2.11;
	RESET %Q2.9;
	RESET %Q2.7;
ELSIF(%MW0=5)THEN
	%MW0:=0;
	RESET %S21;
END_IF;
