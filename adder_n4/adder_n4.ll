source_filename = 'adder_n4.qasm'
target datalayout = ''
target triple = ''

define dso_local i32 @main() {

; declare 4 qubits
%q0 = alloca q1
%q1 = alloca q1
%q2 = alloca q1
%q3 = alloca q1

; declare 4 cbits
%c0 = alloca i1
%c1 = alloca i1
%c2 = alloca i1
%c3 = alloca i1

%q00 = x q1* %q0 ;x q[0]
%q10 = x q1* %q1 ;x q[1]
%q30 = h q1* %q3 ;h q[3];

%q31 = cx0 q1* %q2, i32 1 ; cx q[2],q[3];
%q32 = cx1 q1* %q30, i32 1 ; end cx gate

%q01 = t q1* %q00 ;t q[0];
%q11 = t q1* %q10 ;t q[1];
%q20 = t q1* %q2 ;t q[2];

%q33 = tdg q1* %q32 ;tdg q[3];

%q12 = cx0 q1* %q01, i32 1 ;cx q[0],q[1];
%q13 = cx1 q1* %q11, i32 1 ; end cx gate

%q34 = cx0 q1* %q20, i32 2 ;cx q[2],q[3];
%q35 = cx1 q1* %q33, i32 2 ; end cx gate

%q02 = cx0 q1* %q35, i32 3 ;cx q[3],q[0];
%q03 = cx1 q1* %q01, i32 3 ; end cx gate

%q21 = cx0 q1* %q13, i32 4 ;cx q[1],q[2];
%q22 = cx1 q1* %q20, i32 4 ; end cx gate

%q14 = cx0 q1* %q03, i32 5 ;cx q[0],q[1];
%q15 = cx1 q1* %q13, i32 5 ;end cx gate

%q36 = cx0 q1* %q22, i32 6 ;cx q[2],q[3];
%q37 = cx1 q1* %q35, i32 6 ;end cx gate

%q04 = tdg q1* %q03 ;tdg q[0];
%q16 = tdg q1* %q15 ;tdg q[1];
%q23 = tdg q1* %q22 ;tdg q[2];
%q38 = t q1* %q37 ;t q[3];

%q17 = cx0 q1* %q04, i32 7 ;cx q[0],q[1];
%q18 = cx1 q1* %q16, i32 7 ;end cx gate

%q39 = cx0 q1* %q23, i32 8 ;cx q[2],q[3];
%q3A = cx1 qq* %q38, i32 8 ;end cx gate

%q3B = s q1* %q3A ;s q[3];

%q05 = cx0 q1* %q3B, i32 9 ;cx q[3],q[0];
%q06 = cx1 q1* %q04, i32 9 ;end cx gate

%q3C = h q1* %q3B ;h q[3];

%q07 = measure q1* %q06, i1* %c0 ;measure q[0] -> c[0];
%q19 = measure q1* %q18, i1* %c1 ;measure q[1] -> c[1];
%q24 = measure q1* %q23, i1* %c2 ;measure q[2] -> c[2];
%q3D = measure q1* %q3C, i1* %c3 ;measure q[3] -> c[3];
}