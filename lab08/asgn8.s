.data               # start of data section
# put any global or static variables here
    arr: .long 2, 4, 6, 8, 10 # array for search (5 elements)
    arr_len: .long 5 # length of array
    num_pf: .long 15 # number for prime factorization
    fib_n: .long 6 # fibonacci input

.section .rodata    # start of read-only data section
# constants here, such as strings
# format strings
    fmt_pf: .string "Prime factor: %d\n" # prints one prime factor at a time
    fmt_fib: .string "Fibonacci(%d) = %d\n" # prints input n and computed fib(n)
    fmt_found: .string "Found at index %d\n" # prints index
    fmt_not: .string "Not Found\n" # prints when not found
# modifying these during runtime causes a segmentation fault, so be cautious!

.text               # start of text /code
# everything inside .text is read-only, which includes your code!
.global main        # required, tells gcc where to begin execution

# === functions here ===

# 1) Prime factorization function: takes an integer and finds its prime factors
# void prime_factors(int n)
# rdi = n
prime_factors:
    pushq %rbp # save old base pointer
    movq %rsp, %rbp # set new stack frame

    movl %edi, %eax # eax = n
    movl $2, %ecx # ecx = 2

pf_loop:
    cmpl $1, %eax # while n > 1
    jle pf_done # if n <= 1, done

    movl %eax, %edx # edx = n (prepares for division)
    xorl %eax, %eax # clear eax for division (before setting dividend)
    movl %edx, %eax # eax = n (dividend must be in eax)
    cdq # extend eax into edx:eax for division (required for idiv to work)
    idivl %ecx # eax = n / divisor, edx = remainder

    cmpl $0, %edx # check remainder
    jne pf_next # if not divisible, try next divisor

    # print divisor
    movl %ecx, %esi # esi = divisor (arg2)
    leaq fmt_pf(%rip), %rdi # rdi = format string
    movl $0, %eax # required for printf
    call printf # print factor

    # n = n / divisor
    movl %eax, %eax # quotient in eax
    jmp pf_loop # continue factoring

pf_next:
    incl %ecx # divisor++
    movl %edx, %eax # restore remainder
    jmp pf_loop # try next divisor

pf_done:
    leave # restore stack
    ret # return

# 2) Recursive Fibonacci: nth fib number
# int fib(int n)
# rdi = n, returns in eax
fib:
    pushq %rbp # save base pointer
    movq %rsp, %rbp # set stack frame
    pushq %rbx # save rbx

    cmpl $1, %edi # if n <= 1
    jle fib_base # base case
    movl %edi, %ebx # save original n

    # fib(n-1)
    movl %edi, %eax # eax = n
    decl %eax # eax = n-1
    movl %eax, %edi # edi = n-1
    call fib # recursive call
    movl %eax, %ebx # save fib(n-1)

    # fib(n-2)
    movl %ebx, %edi # restore original n
    subl $2, %edi # edi = n-2
    call fib # recursive call

    addl %ebx, %eax # fib(n) = fib(n-1) + fib(n-2)
    jmp fib_done # jump to end

fib_base:
    movl %edi, %eax # return n (0 or 1)
    popq %rbx #

fib_done:
    leave # restore stack
    ret # return

# 3) Linear Search: scans one by one search
# int linear_search(int* arr, int len, int key)
# rdi = arr, esi = len, edx = key
# return index or -1
linear_search:
    pushq %rbp # save base pointer
    movq %rsp, %rbp # new frame

    movl $0, %ecx # i = 0

ls_loop:
    cmpl %esi, %ecx # if i >= len
    jge ls_notfound # not found

    movl (%rdi, %rcx, 4), %eax # eax = arr[i]
    cmpl %edx, %eax # compare with key
    je ls_found # if equal

    incl %ecx # i++
    jmp ls_loop # repeat

ls_found:
    movl %ecx, %eax # return index
    jmp ls_done # exit

ls_notfound:
    movl $-1, %eax # return -1

ls_done:
    leave # restore stack
    ret # return

# 4) BINARY SEARCH: divide and conquer search
# int binary_search(int* arr, int len, int key)
binary_search:
    pushq %rbp # save base pointer
    movq %rsp, %rbp # new frame

    movl $0, %ecx # low = 0 (left side)
    movl %esi, %ebx # high = length of array
    decl %ebx # high = len-1 (right side)

bs_loop:
    cmpl %ebx, %ecx # if low > high
    jg bs_notfound # not found

    movl %ecx, %eax # eax = low
    addl %ebx, %eax # eax = low + high
    shrl $1, %eax # mid = (low+high)/2

    movl (%rdi, %rax, 4), %r8d # arr[mid] 4 bytes per int
    cmpl %edx, %r8d # compare with key
    je bs_found # if equal

    jl bs_right # if key > arr[mid] (search right half)

    movl %eax, %ebx # high = mid-1 (search left half)
    decl %ebx # mid - 1
    jmp bs_loop # repeat loop

bs_right:
    movl %eax, %ecx # low = mid+1
    incl %ecx # low = mid + 1 (right half)
    jmp bs_loop # repeat loop

bs_found:
    movl %eax, %eax # return mid
    jmp bs_done # jump to function exit

bs_notfound:
    movl $-1, %eax # return -1 if key not found

bs_done:
    leave # restore stacck frame (rbp, rsp)
    ret # return to caller

main:               # start of main() function
# preamble
    pushq %rbp
    movq %rsp, %rbp # set stack frame

# === main() code here ===
# Prime Facotrs
    movl num_pf(%rip), %edi # edi = number
    call prime_factors # call function

# Fibonacci
    movl fib_n(%rip), %edi # edi = n
    call fib # result in eax

    movl %eax, %edx # edx = result
    movl fib_n(%rip), %esi # esi = n
    leaq fmt_fib(%rip), %rdi # format string
    movl $0, %eax # printf requirement
    call printf # print result

# Linear Search
    leaq arr(%rip), %rdi # rdi = array
    movl arr_len(%rip), %esi # esi = length
    movl $6, %edx # key = 6
    call linear_search # call function 

    cmpl $-1, %eax # check if result = -1 (not found)
    je print_not # if equal, jump to not found

    movl %eax, %esi # move index into esi (2nd argument)
    leaq fmt_found(%rip), %rdi # load print format
    movl $0, %eax # required before calling printf
    call printf # prints found index
    jmp after_ls # skip not found

print_not:
    leaq fmt_not(%rip), %rdi # load not found
    movl $0, %eax # needed before printf
    call printf # print not found

after_ls:

# Binary Search
    leaq arr(%rip), %rdi # rdi = address of array
    movl arr_len(%rip), %esi # esi = length of array
    movl $10, %edx # edx = key to search for
    call binary_search # call function

    cmpl $-1, %eax # check if result is -1
    je print_not2 # if not found, jump

    movl %eax, %esi # move index to esi (printf arg)
    leaq fmt_found(%rip), %rdi # load format string
    movl $0, %eax # before printf
    call printf # print found index
    jmp end_main # skip not found

print_not2:
    leaq fmt_not(%rip), %rdi # load not found
    movl $0, %eax # before printf
    call printf # print message

# clean up and return
end_main:
    movq $0, %rax       # place return value in rax
    leave               # undo preamble, clean up the stack
    ret                 # return