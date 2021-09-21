source_filename = "linearsolver_n3"
target datalayout = ""
target triple = ""

;qreg q[3];
%q0 = alloca q1
%q1 = alloca q1
%q2 = alloca q1

;creg c[3];
%c0 = alloca i1
%c1 = alloca i1
%c2 = alloca i1

%q00 = h q1* %q0 ;h q[0];
%q20 = x q1* %q2 ;x q[2];

;cx q[0],q[1];
%q10 = cx0 q1* %q00, i32 1
%q11 = cx1 q1* %q1, i32 1

%q01 = h q1* %q00 ;h q[0];
%q12 = h q1* %q11 ;h q[1];
%q21 = h q1* %q20 ;h q[2];

;cx q[2],q[1];
%q13 = cx0 q1* %q21, i32 2
%q14 = cx1 q1* %q12, i32 2

%q15 = h q1* %q14 ;h q[1];
%q22 = h q1* %q21 ;h q[2];

;u3(-0.58,0,0) q[2];
;h q[1];
;h q[2];
;cx q[2],q[1];
;h q[1];
;h q[2];
;h q[0];
;u3(0.58,0,0) q[2];
;cx q[0],q[1];
;h q[0];
;measure q[0] -> c[0];
;measure q[1] -> c[1];
;measure q[2] -> c[2];
