; RUN: opt -passes=qasm-gen %s --disable-output &> %t
; RUN: diff --strip-trailing-cr %t %S/all_gates.qasm

define dso_local i32 @main() {

%q0 = alloca q1
%q1 = alloca q1
%q2 = alloca q1
%q3 = alloca q1
%q4 = alloca q1

%q00 = h q1* %q0
%q40 = cx0 q1* %q2, i32 1
%q41 = cx1 q1* %q4, i32 1

%q10 = cx0 q1* %q00, i32 2
%q11 = cx1 q1* %q1, i32 2

%q42 = t q1* %q41
%q01 = s q1* %q00
%q12 = x q1* %q11

%q30 = cx0 q1* %q12, i32 3
%q31 = cx1 q1* %q3, i32 3

ret i32 value 0
}