program matrix_vector_product
    implicit none
    integer, parameter :: max_size = 75000
    integer, allocatable :: matrix(:,:), vector(:), result(:)
    character(len=10) :: n_str
    integer :: n, i, j
    real :: start_time, end_time, execution_time
    real :: temp
    integer :: clock_rate, clock_start, clock_end

    ! Read the value of n from command-line argument
    if (command_argument_count() /= 1) then
        write(*,*) "Usage: ./matrix_vector_product <n>"
        stop 1
    endif
    call get_command_argument(1, n_str)
    read(n_str, *) n

    ! Check if n is within the allowed range
    if (n < 1 .or. n > max_size) then
        write(*,*) "Error: Invalid value of n. Allowed range: 1 to", max_size
        stop 1
    endif

    ! Memory allocation
    allocate(matrix(n, n))
    allocate(vector(n))
    allocate(result(n))

    ! Initialize matrix with random numbers
    call random_seed()
    do i = 1, n
        do j = 1, n
            call random_number(temp)
            matrix(i, j) = modulo(int(temp * 100), 100)
        end do
    end do

    ! Initialize vector with random numbers
    call random_seed()
    do i = 1, n
        call random_number(temp)
        vector(i) = modulo(int(temp * 100), 100)
    end do

    ! Initialize result vector with zeros
    result = 0

    ! Matrix-vector product
    call system_clock(clock_start, clock_rate)
    do i = 1, n
        do j = 1, n
            result(i) = result(i) + matrix(i, j) * vector(j)
        end do
    end do
    call system_clock(clock_end)
    execution_time = real(clock_end - clock_start) / real(clock_rate)

    ! Print execution time
    write(*,*) "Execution time:", execution_time, "seconds"

    ! Memory deallocation
    deallocate(matrix)
    deallocate(vector)
    deallocate(result)

end program matrix_vector_product
