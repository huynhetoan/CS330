.data               # start of data section
# put any global or static variables here
    arr: .long 2, 3, 4, 5, 6 # integer array (5 elements, 4 bytes each)
    arr_len: .long 5 # length of the array
    fact_n: .long 6 # value to compute factorial of

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!
    format_sum: .string "Sum of array: %d\n" # format string for printing sum
    format_fact: .string "Factorial of %d: %d\n" # format string for printing factorial result

.text               # start of text /code
# everything inside .text is read-only, which includes  code!
.global main        # required, tells gcc where to begin execution

# === functions here ===

# 1) sum_array: Iterates through the array and returns the sum of its elements
sum_array:
    pushq %rbp # save caller's base pointer
    movq %rsp, %rbp # set up own stack frame
 
    movl $0, %eax # eax = 0 (initialize sum to 0)
    movl $0, %ecx # ecx = 0 (initialize loop counter i = 0)
 
sum_loop:
    cmpl %esi, %ecx # compare i with array length
    jge sum_done # if i >= length, exit loop
 
    movl (%rdi, %rcx, 4), %edx  # edx = arr[i]  (base + i*4; each int is 4 bytes)
    addl %edx, %eax # sum += arr[i]
 
    incl %ecx # i++ loop counter
    jmp sum_loop # go back to top of loop
 
sum_done:
    # %eax already holds the final sum — it is the return value
    leave # restore %rbp and %rsp (undo stack frame)
    ret # return to caller; return value is in %eax / %rax
# end of sum_array function

# 2) factorial: computes n! using a loop
factorial:
    pushq %rbp # save caller's base pointer
    movq %rsp, %rbp # set up stack frame
 
    movl $1, %eax # eax = 1 handle cases n=0 and n=1
    movl %edi, %ecx # ecx = n copy to loop counter
 
    cmpl $1, %ecx # if n <= 1, factorial is 1, so we can skip the loop
    jle fact_done # jump to done if n <= 1
 
fact_loop:
    cmpl $1, %ecx # compare counter with 1
    jle fact_done # if counter is <= 1, every element has been multiplied
 
    imull %ecx, %eax # product *= counter  (signed 32-bit multiply)
    decl %ecx # counter-- decrement loop counter
    jmp fact_loop  # repeat
 
fact_done:
    # %eax is the factorial return value
    leave # restore %rbp and %rsp
    ret # return to caller
# end of factorial function

main:               # start of main() function
# preamble
    pushq %rbp # save caller's base pointer
    movq %rsp, %rbp # set up stack frame

# === main() code here ===

# Call sum_array(arr, arr_len)
    leaq arr(%rip), %rdi # rdi = address of arr (argument 1)
    movl arr_len(%rip), %esi # esi = array length (argument 2)
    call sum_array # call sum function; result is in %eax
 
# Print sum_array result
    movl %eax, %esi # esi = sum (argument 2 to printf)
    leaq format_sum(%rip), %rdi # rdi = format string (argument 1 to printf)
    movl $0, %eax # eax = 0 (required before printf)
    call printf # printf("Sum of array: %d\n", sum)
 
# --- Call factorial(fact_n) ---
    movl fact_n(%rip), %edi          # edi = n (argument 1 to factorial)
    call factorial                   # call factorial function; result is in %eax
 
    # --- Print the factorial result ---
    movl %eax, %edx # edx = factorial result (argument 3 to printf)
    movl fact_n(%rip), %esi # esi = n (argument 2 to printf)
    leaq format_fact(%rip), %rdi # rdi = format string (argument 1)
    movl $0, %eax # eax = 0 (required before printf)
    call printf # printf("Factorial of %d: %d\n", n, result)
 
# clean up and return
movq $0, %rax       # place return value in rax
leave               # undo preamble, clean up the stack
ret                 # return