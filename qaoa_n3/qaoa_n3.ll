; RUN: opt -passes=qasm-gen %s --disable-output &> %t
; RUN: diff --strip-trailing-cr %t %S/hs4_n4.qasm

define dso_local i32 @main() {
qreg q[3];
creg c[3];

h q[0];
h q[1];
h q[2];
cx q[0],q[2];
rz(5.654426) q[2];
cx q[0],q[2];
cx q[0],q[1];
cx q[1],q[2];
rz(-11.308885) q[2];
cx q[1],q[2];
cx q[0],q[1];
rx(1.713248) q[2];
rz(-16.96331) q[1];
rx(1.713248) q[0];
rx(1.713248) q[1];
measure q[2] -> c2[0];
measure q[0] -> c0[0];
measure q[1] -> c1[0];
ret i32 0
}