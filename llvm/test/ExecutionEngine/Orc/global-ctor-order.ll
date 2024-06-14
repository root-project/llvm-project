; Test that global constructors are correctly ordered
;
; RUN: lli -jit-kind=orc %s | FileCheck %s
;
; CHECK: H1
; CHECK-NEXT: H2
; CHECK-NEXT: H3
; CHECK-NEXT: M1
; CHECK-NEXT: M2
; CHECK-NEXT: M3
; CHECK-NEXT: 1
; CHECK-NEXT: 2
; CHECK-NEXT: 3
; CHECK-NEXT: 4
; CHECK-NEXT: 5
; CHECK-NEXT: 6
; CHECK-NEXT: 7
; CHECK-NEXT: 8
; CHECK-NEXT: 9
; CHECK-NEXT: 10
; CHECK-NEXT: 11
; CHECK-NEXT: 12
; CHECK-NEXT: 13
; CHECK-NEXT: 14
; CHECK-NEXT: 15
; CHECK-NEXT: 16
; CHECK-NEXT: 17

declare i32 @puts(i8* nocapture readonly)

@str.H1 = private constant [3 x i8] c"H1\00"
@str.H2 = private constant [3 x i8] c"H2\00"
@str.H3 = private constant [3 x i8] c"H3\00"
@str.M1 = private constant [3 x i8] c"M1\00"
@str.M2 = private constant [3 x i8] c"M2\00"
@str.M3 = private constant [3 x i8] c"M3\00"
@str.1 = private constant [2 x i8] c"1\00"
@str.2 = private constant [2 x i8] c"2\00"
@str.3 = private constant [2 x i8] c"3\00"
@str.4 = private constant [2 x i8] c"4\00"
@str.5 = private constant [2 x i8] c"5\00"
@str.6 = private constant [2 x i8] c"6\00"
@str.7 = private constant [2 x i8] c"7\00"
@str.8 = private constant [2 x i8] c"8\00"
@str.9 = private constant [2 x i8] c"9\00"
@str.10 = private constant [3 x i8] c"10\00"
@str.11 = private constant [3 x i8] c"11\00"
@str.12 = private constant [3 x i8] c"12\00"
@str.13 = private constant [3 x i8] c"13\00"
@str.14 = private constant [3 x i8] c"14\00"
@str.15 = private constant [3 x i8] c"15\00"
@str.16 = private constant [3 x i8] c"16\00"
@str.17 = private constant [3 x i8] c"17\00"
@llvm.global_ctors = appending global [23 x { i32, i32 ()*, i8* }] [{ i32, i32 ()*, i8* } { i32 1024, i32 ()* @medium.1, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.1, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.2, i8* null }, { i32, i32 ()*, i8* } { i32 1, i32 ()* @high.1, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.3, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.4, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.5, i8* null }, { i32, i32 ()*, i8* } { i32 1, i32 ()* @high.2, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.6, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.7, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.8, i8* null }, { i32, i32 ()*, i8* } { i32 1024, i32 ()* @medium.2, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.9, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.10, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.11, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.12, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.13, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.14, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.15, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.16, i8* null }, { i32, i32 ()*, i8* } { i32 65535, i32 ()* @default.17, i8* null }, { i32, i32 ()*, i8* } { i32 1024, i32 ()* @medium.3, i8* null }, { i32, i32 ()*, i8* } { i32 1, i32 ()* @high.3, i8* null }]

define internal i32 @high.1() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.H1, i64 0, i64 0))
  ret i32 0
}

define internal i32 @high.2() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.H2, i64 0, i64 0))
  ret i32 0
}

define internal i32 @high.3() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.H3, i64 0, i64 0))
  ret i32 0
}

define internal i32 @medium.1() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.M1, i64 0, i64 0))
  ret i32 0
}

define internal i32 @medium.2() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.M2, i64 0, i64 0))
  ret i32 0
}

define internal i32 @medium.3() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.M3, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.1() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.1, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.2() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.2, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.3() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.3, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.4() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.4, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.5() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.5, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.6() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.6, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.7() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.7, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.8() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.8, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.9() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.9, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.10() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.10, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.11() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.11, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.12() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.13() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.13, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.14() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.14, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.15() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.15, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.16() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.16, i64 0, i64 0))
  ret i32 0
}

define internal i32 @default.17() #0 {
  %call = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.17, i64 0, i64 0))
  ret i32 0
}

define i32 @main() {
  ret i32 0
}
