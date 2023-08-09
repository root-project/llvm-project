// UNSUPPORTED: system-aix

// RUN: cat %s | clang-repl 2>&1 | FileCheck %s

struct A { ~A(); };
::A::~A() {}

// CHECK-NOT: error
