source_filename = "deutsch_n2.qasm"
target datalayout = ""
target triple = ""

;qreg q[2];
%q0 = alloca q1
%q1 = alloca q1

;creg c[2];
%c0 = alloca i1
%c1 = alloca i1

%q10 = x q1* %q1 ;x q[1];
%q00 = h q1* %q0 ;h q[0];
%q11 = h q1* %q10 ;h q[1];

;cx q[0],q[1];
%q12 =  cx0 p1* %q00 1
%q13 = cx1 p1* %q11 1

%q01 = h p1* %q00 ;h q[0];

%q02 = measure q1* %q01, i1* %c0 ;measure q[0] -> c[0];
%q14 = measure q1* %q13, i1* %c1 ;measure q[1] -> c[1];