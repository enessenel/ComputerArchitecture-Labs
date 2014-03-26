0: CPi 1000 0 // memLoc1000 = n
1: CPi 200 1 // initial current ptr = 1
2: CPi 250 0 // res_addr = 0

//BEGIN
3: CP 298 299 // temp stack
4: ADD 298 200 // get S[ptr]
5: CPIi 298 250 // set S[ptr] = res_addr
6: ADDi 200 1 // ptr++
7: CP 298 299 // temp stack
8: ADD 298 200 // get S[ptr]
9: CPIi 298 1000 // S[ptr] = n
10: CPi 2000 1 
11: NAND 2000 2000 
12: ADDi 2000 1 //-1 at 2000
13: CP 2001 2000
14: ADD 2001 2001 // -2 at 2001
//ENDOFBEGIN

//FACTORIAL
15: CP 298 299 // temp stack
16: ADD 298 200 // S[ptr]
17: CPI 275 298 // 275 has *(stack+ptr)
18: BZJ 100 275 // if *(stack+ptr) = 0 goto 100
19: ADD 275 2000 // *(stack+ptr) -1
20: BZJ 100 275 //if*(stack+ptr) = 1 goto 100

21: ADDi 200 1 //ptr++
22: CP 298 299 //temp stack
23: ADD 298 200 //temp stack+ptr
24: CPIi 298 200 //*(stack+ptr) = ptr

25: ADDi 200 1 //ptr++
26: CP 298 299 //temp stack
27: ADD 298 200 // stack+ptr
28: CP 296 298 // 296 = stack +ptr
29: ADD 296 2001 // stack+ptr-2
30: CPI 295 296 //*(stack +ptr-2)
31: ADD 295 2000 //*(stack+ptr-2) -1
32: CPIi 298 295 // *(stack+ptr) = *(stack+ptr-2) -1
33: BZJi 34 0 //gotoFactorial
34: 15

//STACK_UNWIND
35: ADD 200 2000 // ptr--
36: CP 201 200 // copy ptr
37: ADD 201 2000 //temp ptr-1
38: BZJ 10000 201 //if ptr = 0 goto END

39: CP 298 299 //temp stack
40: ADD 298 200 // stack+ptr
41: CPI 650 298 // *(stack+ptr)
42: CP 651 298 // stack+ptr copy
43: ADD 651 2000 // stack+ptr-1
44: CPI 652 651 // *(stack+ptr -1)
45: MUL 652 650 // *(stack+ptr-1) * (*(stack+ptr))

46: CP 660 298 // stack+ptr
47: ADD 660 2001 //Stack+ptr -2
48: CPI 661 660 //*(stack+pte -2)
49: CP 662 299 // stack copy
50: ADD 662 661 
51: CPIi 662 652 //*(stack+*(stack+ptr-2))
52: ADD 200 2000 //ptr--
53: BZJi 54 0
54: 35


//IF1 FACTORIAL
100: 101
101: CP 130 298 // stack+ptr
102: ADD 130 2000 //stack+ptr-1
103: CPI 131 130 // *stack+ptr-1
104: ADD 131 299 // stack + *stack+ptr-1
105: CPi 120 1
106: CPIi 131 120 //*Stack +*stack+ptr-1 = 1
107: BZJi 108 0 //goto Unwind
108: 35 



299: 300 // stack pointer


10000: 10001
10001: BZJi 10002 0
10002: 10001