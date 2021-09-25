source_filename = "grover_n2.qasm"
target datalayout = ""
target triple = ""

;qreg q[2];
%q0 = alloca q1
%q1 = alloca q1

;creg c[2];
%c0 = alloca i1
%c1 = alloca i1

%q00 = h q1* %q0 ;h q[0];
%q10 = h q1* %q1 ;h q[1];

%q11 = h q1* %q10 ;h q[1];

;cx q[0],q[1];
%q12 = cx0 q1* %q00, i32 1
%q13 = cx1 q1* %q11, i32 1

%q14 = h q1* %q13 ;h q[1];

%q01 = h q1* %q00 ;h q[0];
%q15 = h q1* %q14 ;h q[1];
%q02 = x q1* %q01 ;x q[0];
%q15 = x q1* %q14 ;x q[1];
%q16 = h q1* %q15 ;h q[1];

;cx q[0],q[1];
%q17 = cx0 q1* %q02, i32 2
%q18 = cx1 q1* %q16, i32 2

%q19 = h q1* %q18 ;h q[1];
%q03 = x q1* %q02 ;x q[0];
%q17 = x q1* %q16 ;x q[1];

%q04 = h q1* %q03;h q[0];
%q18 = h q1* %q17 ;h q[1];

%q05 = measure q1* %q04, i1* %c0 ;measure q[0] -> c[0];
%q19 = measure q1* %q18, i1* %c1 ;measure q[1] -> c[1];
