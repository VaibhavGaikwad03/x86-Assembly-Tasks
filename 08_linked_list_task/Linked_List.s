.section .rodata
    msg_main_print_menu:
    .string "\n1.Insert\n2.Delete\n3.Search\n4.Count\n5.Reverse Display\n6.Exit\n"

    msg_main_print_enter_choice:
    .string "Enter your choice:\t"

    msg_main_print_insert_choices:
    .string "\n1.InsertFirst\n2.InsertLast\n3.InsertAtPosition\n4.Back\n"

    msg_main_print_enter_choice_again:
    .string "Enter your choice again:\t"

    msg_main_scan_one_element:
    .string "%d"

    msg_main_print_enter_valid_choice:
    .string "Enter valid choice\n"

    msg_main_print_enter_data_to_insert:
    .string "Enter data to be insert:\t"

    msg_main_print_enter_position:
    .string "Enter position:\t"

    msg_main_print_list_is_empty_deletion_impossible:
    .string "Linked List Empty, Deletion impossible.\n"

    msg_main_print_delete_choices:
    .string "\n1.DeleteFirst\n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"

    msg_main_print_list_is_empty:
    .string "Linked List Empty\n"

    msg_main_print_deleted_data_is:
    .string "Deleted data is %d\n"

    msg_main_print_list_is_empty_searching_impossible:
    .string "Linked List Empty, Searching impossible.\n"

    msg_main_print_search_choices:
    .string "\n1.SearchFirstOccurance\n2.SearchLastOccurance\n3.SearchAllOccurances\n4.Back\n"

    msg_main_print_enter_data_to_search:
    .string "Enter data to be search:\t"

    msg_main_print_data_not_found:
    .string "Data not found\n"

    msg_main_print_data_found_at_pos:
    .string "Data found at %d position\n"

    msg_main_print_data_found_no_of_times:
    .string "Data found %d times\n"

    msg_main_print_total_node_present:
    .string "Total node present : %d\n"

    msg_main_print_bye:
    .string "Bye...\n"

    msg_print_memory_allocation_failed:
    .string "memory allocation FAILED\n"

    msg_print_position_is_invalid:
    .string "Position is invalid\n"

    msg_display_print_list_is:
    .string "\nLinked list is:\n"

    msg_print_empty:
    .string "EMPTY\n"

    msg_display_print_node_data:
    .string "<-|%d|->"

    msg_deleteall_print:
    .string "\nDeleted All Nodes Successfully\n"

    msg_reverse_display_linked_list_is:
    .string "\nReverse Linked list is:\n"

    msg_print_newline:
    .string "\n"

################################
    msg_hello:
    .string "Hello\n"

    msg_test:
    .string "%d\n%d\n"

    msg_test_1:
    .string "%d...\n"

    msg_test_2:
    .string "%d\n%d\n%d\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $48, %esp

    movl    $0, -16(%ebp)
    movl    $0, -20(%ebp)

# while 1 starts
    jmp     label_while_1_condition
label_while_1_body:  
    movl    $msg_main_print_menu, (%esp)
    call    printf

    movl    $msg_main_print_enter_choice, (%esp)
    call    printf

    leal    -12(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    movl    -12(%ebp), %eax

    cmpl    $1, %eax
    je      label_switch_1_case_1

    cmpl    $2, %eax
    je      label_switch_1_case_2

    cmpl    $3, %eax
    je      label_switch_1_case_3

    cmpl    $4, %eax
    je      label_switch_1_case_4

    cmpl    $5, %eax
    je      label_switch_1_case_5

    cmpl    $6, %eax
    je      label_switch_1_case_6

    jmp     label_switch_1_default_case

label_switch_1_case_1:
# while 2 starts
    jmp     label_while_2_condition
label_while_2_body:
    movl    $msg_main_print_insert_choices, (%esp)
    call    printf

    movl    $msg_main_print_enter_choice_again, (%esp)
    call    printf

    leal    -12(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    movl    -12(%ebp), %eax
    cmpl    $4, %eax
    jne     label_if_1_out
    jmp     label_if_1_break_statement

label_if_1_out:
    movl    -12(%ebp), %eax
    cmpl    $0, %eax
    jle     label_if_2_body
    cmpl    $3, %eax
    jg      label_if_2_body
    jmp     label_if_2_out

label_if_2_body:
    movl    $msg_main_print_enter_valid_choice, (%esp)
    call    printf

    jmp     label_while_2_condition

label_if_2_out:
    movl    $msg_main_print_enter_data_to_insert, (%esp)
    call    printf

    leal    -4(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf
# switch 2 starts
    movl    -12(%ebp), %eax

    cmpl    $1, %eax
    je      label_switch_2_case_1

    cmpl    $2, %eax
    je      label_switch_2_case_2

    cmpl    $3, %eax
    je      label_switch_2_case_3

label_switch_2_case_1:
    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx
    movl    -4(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    InsertFirst
    jmp     label_switch_2_exit

label_switch_2_case_2:
    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx
    movl    -4(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    InsertLast
    jmp     label_switch_2_exit

label_switch_2_case_3:
    movl    $msg_main_print_enter_position, (%esp)
    call    printf

    leal    -8(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx
    movl    -4(%ebp), %ecx
    movl    -8(%ebp), %ebx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    movl    %ebx, 12(%esp)
    call    InsertAtPosition

label_switch_2_exit:
# switch 2 ends
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display
   

label_while_2_condition:
    jmp     label_while_2_body
label_if_1_break_statement:
# while 2 ends
    jmp     label_switch_1_exit

label_switch_1_case_2:
    movl    -16(%ebp), %ebx
    cmpl    $0, %ebx
    jne     label_if_3_out
    movl    $msg_main_print_list_is_empty_deletion_impossible, (%esp)
    call    printf
    jmp     label_switch_1_exit

label_if_3_out:
# while 3 starts
    jmp     label_while_3_condition
label_while_3_body:
    movl    $msg_main_print_delete_choices, (%esp)
    call    printf

    movl    $msg_main_print_enter_choice_again, (%esp)
    call    printf

    leal    -12(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

# if 4 starts
    movl    -12(%ebp), %eax
    cmpl    $4, %eax
    jne     label_if_4_out
    jmp     label_if_4_break_statement
# if 4 ends
label_if_4_out:
# switch 3 starts
    movl    -12(%ebp), %eax

    cmpl    $1, %eax
    je      label_switch_3_case_1

    cmpl    $2, %eax
    je      label_switch_3_case_2

    cmpl    $3, %eax
    je      label_switch_3_case_3

    jmp     label_switch_3_default_case

label_switch_3_case_1:
    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    DeleteFirst
    movl    %eax, -4(%ebp)

    jmp     label_switch_3_exit

label_switch_3_case_2:
    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    DeleteLast
    movl    %eax, -4(%ebp)

    jmp     label_switch_3_exit

label_switch_3_case_3:
    movl    $msg_main_print_enter_position, (%esp)
    call    printf

    leal    -8(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx
    movl    -8(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    DeleteAtPosition
    movl    %eax, -4(%ebp)
    jmp     label_switch_3_exit

label_switch_3_default_case:
    movl    $msg_main_print_enter_valid_choice, (%esp)
    call    printf

    movl    $4, -12(%ebp)

label_switch_3_exit:
# switch 3 ends
# if 5 starts
    movl    -4(%ebp), %eax
    cmpl    $-1, %eax
    jne     label_if_5_else_if_5
    movl    $msg_main_print_list_is_empty, (%esp)
    call    printf
    jmp     label_if_5_else_if_out
# if 5 ends
# else if 5 starts
label_if_5_else_if_5:
    movl    -12(%ebp), %eax
    cmpl    $4, %eax
    je      label_if_5_else_if_out
    movl    -4(%ebp), %eax
    cmpl    $-2, %eax
    je      label_if_5_else_if_out
    
    movl    -4(%ebp), %eax
    movl    $msg_main_print_deleted_data_is, (%esp)
    movl    %eax, 4(%esp)
    call    printf

    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display

label_if_5_else_if_out:
# else if 5 ends
label_while_3_condition:
    jmp     label_while_3_body
label_if_4_break_statement:
# while 3 ends
    jmp     label_switch_1_exit

label_switch_1_case_3:
    movl    -16(%ebp), %ebx
    cmpl    $0, %ebx
    jne     label_if_6_out

    movl    $msg_main_print_list_is_empty_searching_impossible, (%esp)
    call    printf

    jmp     label_switch_1_exit 

label_if_6_out:
# while 4 starts
    jmp     label_while_4_condition
label_while_4_body:
    movl    $msg_main_print_search_choices, (%esp)
    call    printf

    movl    $msg_main_print_enter_choice_again, (%esp)
    call    printf

    leal    -12(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

# if 7 starts
    movl    -12(%ebp), %eax
    cmpl    $4, %eax
    jne     label_if_7_out
    jmp     label_if_7_break_statement
# if 7 ends
label_if_7_out:
# if 8 starts
    movl    -12(%ebp), %eax
    cmpl    $0, %eax
    jle     label_if_8_body
    cmpl    $3 , %eax
    jg      label_if_8_body
    jmp     label_if_8_out

label_if_8_body:
    movl    $msg_main_print_enter_valid_choice, (%esp)
    call    printf

    jmp     label_while_4_condition
# if 8 ends
label_if_8_out:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display

    movl    $msg_main_print_enter_data_to_search, (%esp)
    call    printf

    leal    -4(%ebp), %ebx
    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

# switch 4 starts
    movl    -12(%ebp), %eax

    cmpl    $1, %eax
    je      label_switch_4_case_1

    cmpl    $2, %eax
    je      label_switch_4_case_2

    cmpl    $3, %eax
    je      label_switch_4_case_3

label_switch_4_case_1:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx
    movl    -4(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    SearchFirstOccurance
    movl    %eax, -4(%ebp)
# if 9 starts
    cmpl    $-1, %eax
    jne     label_else_if_9
    movl    $msg_main_print_list_is_empty, (%esp)
    call    printf
    jmp     label_if_9_out

label_else_if_9:
    cmpl    $-2, %eax
    jne     label_else_9 
    movl    $msg_main_print_data_not_found, (%esp)
    call    printf
    jmp     label_if_9_out

label_else_9:
    # movl    -4(%ebp), %eax
    movl    $msg_main_print_data_found_at_pos, (%esp)
    movl    %eax, 4(%esp)
    call    printf

label_if_9_out:
# if 9 ends
    jmp     label_switch_4_exit

label_switch_4_case_2:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx
    movl    -4(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    SearchLastOccurance
    movl    %eax, -4(%ebp)

# if 10 starts
    cmpl    $-1, %eax
    jne     label_else_if_10
    movl    $msg_main_print_list_is_empty, (%esp)
    call    printf

    jmp     label_if_10_out

label_else_if_10:
    cmpl    $-2, %eax
    jne     label_else_10
    movl    $msg_main_print_data_not_found, (%esp)
    call    printf

    jmp     label_if_10_out

label_else_10:
    movl    $msg_main_print_data_found_at_pos, (%esp)
    movl    %eax, 4(%esp)
    call    printf

label_if_10_out:
# if 10 ends
    jmp     label_switch_4_exit

label_switch_4_case_3:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx
    movl    -4(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    SearchAllOccurances
    movl    %eax, -4(%ebp)

    movl    $msg_main_print_data_found_no_of_times, (%esp)
    movl    %eax, 4(%esp)
    call    printf
label_switch_4_exit:
# switch 4 ends
label_while_4_condition:
    jmp     label_while_4_body
# while 4 ends
label_if_7_break_statement:
    jmp     label_switch_1_exit 

label_switch_1_case_4:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display

    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    CountNode
    movl    %eax, -4(%ebp)
    
    movl    $msg_main_print_total_node_present, (%esp)
    movl    %eax, 4(%esp)
    call    printf

    jmp     label_switch_1_exit

label_switch_1_case_5:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display

    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    ReverseDisplay
    jmp     label_switch_1_exit

label_switch_1_case_6:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    Display

    movl    -16(%ebp), %ebx
    cmpl    $0, %ebx
    je      label_if_11_out
    leal    -16(%ebp), %eax
    leal    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    DeleteAllNodes

label_if_11_out:
    movl    $msg_main_print_bye, (%esp)
    call    printf

    movl    $0, (%esp)
    call    exit

label_switch_1_default_case:
    movl    $msg_main_print_enter_valid_choice, (%esp)
    call    printf

label_switch_1_exit:
label_while_1_condition:
    jmp     label_while_1_body
# while 1 ends

.globl  InsertFirst
.type InsertFirst, @function
InsertFirst:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -4(%ebp)

    movl    $12, %eax
    movl    %eax, (%esp)
    call    malloc
    movl    %eax, -4(%ebp)

    cmpl    $0, %eax
    je      label_memory_allocation_failed

    movl    16(%ebp), %eax
    movl    -4(%ebp), %edx
    movl    %eax, 4(%edx)

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    
    cmpl    $0, %ebx
    jne      label_insert_first_if_out

    movl    -4(%ebp), %eax
    movl    8(%ebp), %edx
    movl    %eax, (%edx)

    movl    12(%ebp), %edx
    movl    %eax, (%edx)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    %ebp, %esp
    popl    %ebp
    ret

label_insert_first_if_out:
    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    -4(%ebp), %edx
    movl    %eax, 8(%edx)

    movl    -4(%ebp), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    -4(%ebp), %eax
    movl    8(%ebp), %edx
    movl    %eax, (%edx)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  InsertLast
.type   InsertLast, @function
InsertLast:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -4(%ebp)

    movl    $12, %eax
    movl    %eax, (%esp)
    call    malloc
    movl    %eax, -4(%ebp)

    cmpl    $0, %eax
    je      label_memory_allocation_failed

    movl    16(%ebp), %eax
    movl    -4(%ebp), %edx
    movl    %eax, 4(%edx)

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    cmpl    $0, %ebx
    jne     label_insert_last_if_out

    movl    -4(%ebp), %eax
    movl    8(%ebp), %edx
    movl    %eax, (%edx)

    movl    12(%ebp), %edx
    movl    %eax, (%edx)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    %ebp, %esp
    popl    %ebp
    ret

label_insert_last_if_out:
    movl    -4(%ebp), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    -4(%ebp), %edx
    movl    %eax, (%edx)

    movl    -4(%ebp), %eax
    movl    12(%ebp), %edx
    movl    %eax, (%edx)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  InsertAtPosition
.type   InsertAtPosition, @function
InsertAtPosition:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    movl    $0, -4(%ebp)
    movl    $0, -8(%ebp)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    CountNode
    movl    %eax, -12(%ebp)

    movl    20(%ebp), %eax
    cmpl    $0, %eax
    jle     label_position_invalid_1
    movl    -12(%ebp), %edx
    addl    $1, %edx
    cmpl    %edx, %eax
    jg      label_position_invalid_1

    movl    20(%ebp), %eax
    cmpl    $1, %eax
    jne     label_insert_at_pos_if_1_out
    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    16(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    InsertFirst

    movl    %ebp, %esp
    popl    %ebp
    ret

label_insert_at_pos_if_1_out:  
    movl    -12(%ebp), %eax
    movl    20(%ebp), %edx
    addl    $1, %eax
    cmpl    %edx, %eax
    jne     label_insert_at_pos_if_2_out
    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    16(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    InsertLast

    movl    %ebp, %esp
    popl    %ebp
    ret

label_insert_at_pos_if_2_out:
    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    %eax, -8(%ebp)
    
    movl    $1, -12(%ebp)

# while  starts
    jmp     label_insert_at_pos_while_condition
label_insert_at_pos_while_body:
    addl    $1, -12(%ebp)

    movl    -8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, -8(%ebp)

label_insert_at_pos_while_condition:
    movl    -12(%ebp), %eax
    movl    20(%ebp), %edx
    subl    $1, %edx
    cmpl    %edx, %eax
    jl      label_insert_at_pos_while_body
# while  ends

    movl    $12, %eax
    movl    %eax, (%esp)
    call    malloc
    movl    %eax, -4(%ebp)
    
    cmpl    $0, %eax
    je      label_memory_allocation_failed

    movl    16(%ebp), %edx
    movl    %edx, 4(%eax)

    movl    -8(%ebp), %eax
    movl    8(%eax), %eax
    movl    -4(%ebp), %edx
    movl    %eax, 8(%edx)

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    movl    8(%edx), %edx
    movl    %eax, (%edx)

    movl    -8(%ebp), %edx
    movl    %eax, 8(%edx)

    movl    -8(%ebp), %eax
    movl    -4(%ebp), %edx
    movl    %eax, (%edx)

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  DeleteFirst
.type   DeleteFirst, @function
DeleteFirst:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    cmpl    $0, %ebx
    jne     label_delete_first_if_1_out
    
    movl    $-1, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_delete_first_if_1_out:
    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    4(%ebx), %eax
    movl    %eax, -4(%ebp)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx

    cmpl    %edx, %eax
    jne     label_delete_first_if_2_out

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    $0, 8(%ebx)
    movl    $0, (%ebx)

    movl    %ebx, (%esp)
    call    free    

    movl    8(%ebp), %ebx
    movl    $0, (%ebx)
    movl    12 (%ebp), %ebx
    movl    $0, (%ebx)

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
label_delete_first_if_2_out:
    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%eax), %eax
    movl    8(%ebp), %edx
    movl    %eax, (%edx)

    movl    12(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    8(%ebx), %ebx
    movl    $0, 8(%ebx)

    movl    12(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    8(%ebx), %ebx
    movl    $0, (%ebx)

    movl    12(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    8(%ebx), %ebx

    movl    %ebx, (%esp)
    call    free

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  DeleteLast
.type   DeleteLast, @function
DeleteLast:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    cmpl    $0, %ebx
    jne     label_delete_last_if_1_out
    
    movl    $-1, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_delete_last_if_1_out:
    movl    12(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    4(%ebx), %eax
    movl    %eax, -4(%ebp)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx

    cmpl    %edx, %eax
    jne     label_delete_last_if_2_out

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    $0, 8(%ebx)
    movl    $0, (%ebx)

    movl    %ebx, (%esp)
    call    free    

    movl    8(%ebp), %ebx
    movl    $0, (%ebx)
    movl    12 (%ebp), %ebx
    movl    $0, (%ebx)

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
label_delete_last_if_2_out:
    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    %eax, (%edx)

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %ebx
    movl    $0, 8(%ebx)

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %ebx
    movl    $0, (%ebx)

    movl    %ebx, (%esp)
    call    free

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, (%edx)

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  DeleteAtPosition
.type   DeleteAllNodes, @function
DeleteAtPosition:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -4(%ebp)

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    CountNode
    movl    %eax, -8(%ebp)

    movl    16(%ebp), %eax
    cmpl    $0, %eax
    je      label_position_invalid_2
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jg      label_position_invalid_2

    cmpl    $1, %eax
    jne     label_delete_at_pos_if_1_out

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    DeleteFirst

    movl    %ebp, %esp
    popl    %ebp
    ret

label_delete_at_pos_if_1_out:
    movl    -8(%ebp), %eax
    movl    16(%ebp), %edx
    cmpl    %edx, %eax
    jne     label_delete_at_pos_if_2_out

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    DeleteLast

    movl    %ebp, %esp
    popl    %ebp
    ret

label_delete_at_pos_if_2_out:
    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    %ebx, -4(%ebp)

    movl    $1, -8(%ebp)

# while starts
    jmp     label_delete_at_pos_while_condition

label_delete_at_pos_while_body:
    addl    $1, -8(%ebp)

    movl    -4(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, -4(%ebp)

label_delete_at_pos_while_condition:
    movl    -8(%ebp), %eax
    movl    16(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_delete_at_pos_while_body
# while ends

    movl    -4(%ebp), %eax
    movl    8(%eax), %eax
    movl    -4(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

    movl    -4(%ebp), %eax
    movl    (%eax), %eax
    movl    -4(%ebp), %edx
    movl    8(%edx), %edx
    movl    %eax, (%edx)

    movl    -4(%ebp), %ebx
    movl    $0, 8(%ebx)
    movl    $0, (%ebx)

    movl    4(%ebx), %eax
    movl    %eax, -8(%ebp)

    movl    %ebx, (%esp)
    call    free

    movl    -8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  SearchFirstOccurance
.type   SearchFirstOccurance, @function
SearchFirstOccurance:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    cmpl    $0, %ebx
    jne     label_search_first_occ_if_1_out
    
    movl    $-1, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_search_first_occ_if_1_out:
    movl    $1, -4(%ebp)

    movl    8(%ebp), %eax
label_search_first_occ_do_while:
    movl    16(%ebp), %edx
    movl    4(%eax), %eax
    cmpl    %edx, %eax
    jne     label_search_first_occ_if_2_out
    jmp     label_search_first_occ_do_while_break

label_search_first_occ_if_2_out:
    addl    $1, -4(%ebp)

    movl    8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, 8(%ebp)

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne     label_search_first_occ_do_while
label_search_first_occ_do_while_break:

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne      label_search_first_occ_if_3_out
    movl    -4(%ebp), %eax
    cmpl    $1, %eax
    je      label_search_first_occ_if_3_out

    movl    $-2, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_search_first_occ_if_3_out:
    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  SearchLastOccurance
.type   SearchLastOccurance, @function
SearchLastOccurance:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    cmpl    $0, %ebx
    jne     label_search_last_occ_if_1_out
    
    movl    $-1, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_search_last_occ_if_1_out:
    movl    $1, -4(%ebp)
    movl    $0, -8(%ebp)

# do while starts
    movl    8(%ebp), %eax
label_search_last_occ_do_while:
    movl    16(%ebp), %edx
    movl    4(%eax), %eax

    cmpl    %edx, %eax
    jne     label_search_last_occ_if_2_out
    movl    -4(%ebp), %eax
    movl    %eax, -8(%ebp)
label_search_last_occ_if_2_out:
    addl    $1, -4(%ebp)

    movl    8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, 8(%ebp)

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne     label_search_last_occ_do_while
# do while ends
    movl    -8(%ebp), %eax
    cmpl    $0, %eax
    jne     label_search_last_occ_if_3_out

    movl    $-2, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_search_last_occ_if_3_out:
    movl    -8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  SearchAllOccurances
.type   SearchAllOccurances, @function
SearchAllOccurances:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -4(%ebp)

    movl    8(%ebp), %ebx
    cmpl    $0, %ebx
    jne     label_search_all_occ_if_1_out
    
    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_search_all_occ_if_1_out:
    movl    8(%ebp), %eax
label_search_all_occ_do_while:
    movl    16(%ebp), %edx
    movl    4(%eax), %eax

    cmpl    %edx, %eax
    jne     label_search_all_occ_if_2_out
    addl    $1, -4(%ebp)

label_search_all_occ_if_2_out:
    movl    8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, 8(%ebp)

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne     label_search_all_occ_do_while

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  DeleteAllNodes
.type   DeleteAllNodes, @function
DeleteAllNodes:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    cmpl    $0, %ebx
    jne     label_delete_all_if_out

    movl    %ebp, %esp
    popl    %ebp
    ret

label_delete_all_if_out:
# while starts
    jmp     label_delete_all_while_condition
label_delete_all_while_body:
    movl    $0, (%eax)
    
    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    8(%eax), %eax
    movl    8(%ebp), %edx
    movl    %eax, (%edx)

    movl    12(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    8(%ebx), %ebx
    movl    $0, 8(%ebx)

    movl    %ebx, (%esp)
    call    free

    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx
    movl    %eax, 8(%edx)

label_delete_all_while_condition: 
    movl    8(%ebp), %eax
    movl    (%eax), %eax
    movl    12(%ebp), %edx
    movl    (%edx), %edx

    cmpl    %edx, %eax
    jne     label_delete_all_while_body
# while ends

    movl    8(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    $0, 8(%ebx)
    movl    $0, (%ebx)
    movl    %ebx, (%esp)
    call    free

    movl    8(%ebp), %eax
    movl    $0, (%eax)
    movl    12(%ebp), %edx
    movl    $0, (%edx)

    movl    $msg_deleteall_print, (%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  CountNode
.type   CountNode, @function
CountNode:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -4(%ebp)

    movl    8(%ebp), %ebx

    cmpl    $0, %ebx
    jne     label_count_node_if_out
    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_count_node_if_out:
label_count_node_do_while:
    addl    $1, -4(%ebp)

    movl    8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, 8(%ebp)

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne     label_count_node_do_while

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  Display
.type   Display, @function
Display:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16 , %esp

    movl    $msg_display_print_list_is, (%esp)
    call    printf

    movl    8(%ebp), %ebx
    cmpl    $0, %ebx
    je      label_empty

    movl    8(%ebp), %eax
label_display_do_while:
    movl    4(%eax), %eax
    movl    $msg_display_print_node_data, (%esp)
    movl    %eax, 4(%esp)
    call    printf

    movl    8(%ebp), %ebx
    movl    8(%ebx), %ebx
    movl    %ebx, 8(%ebp)

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    8(%edx), %edx
    cmpl    %edx, %eax
    jne     label_display_do_while

    movl    $msg_print_newline, (%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret

.globl  ReverseDisplay
.type   ReverseDisplay, @function
ReverseDisplay:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $msg_reverse_display_linked_list_is, (%esp)
    call    printf

    movl    12(%ebp), %ebx
    
    cmpl    $0, %ebx
    je      label_empty

    movl    12(%ebp), %eax
label_reverse_display_do_while:
    movl    4(%eax), %eax
    movl    $msg_display_print_node_data, (%esp)
    movl    %eax, 4(%esp)
    call    printf

    movl    12(%ebp), %eax
    movl    (%eax), %eax
    movl    %eax, 12(%ebp)

    movl    12(%ebp), %eax
    movl    8(%ebp), %edx
    movl    (%edx), %edx
    cmpl    %edx, %eax
    jne      label_reverse_display_do_while

    movl    $msg_print_newline, (%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret


# error wala code
label_position_invalid_1:
    movl    $msg_print_position_is_invalid ,(%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret

label_position_invalid_2:
    movl    $msg_print_position_is_invalid ,(%esp)
    call    printf

    movl    $-2, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

label_empty:
    movl    $msg_print_empty, (%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret

label_memory_allocation_failed:
    movl    $msg_print_memory_allocation_failed, (%esp)
    call    printf

    movl    %ebp, %esp
    popl    %ebp
    ret
