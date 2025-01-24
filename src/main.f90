program main
    use, intrinsic :: iso_fortran_env
    use param, only : C0_REAL, C0_IMAG, CALC_RANGE, NUM_STEP
    use subprogram, only : div_speed
    implicit none

    real(real64) :: c_real, c_imag
    integer(int32) :: i, j
    real(real64) :: c_inc

    !! 発散速度のマッピング
    !! 1つ目のインデックスを虚部、2つ目のインデックスを実部としている。
    real(real64), allocatable :: div_speed_map(:, :)
    
    allocate(div_speed_map(NUM_STEP, NUM_STEP))
    
    c_real = C0_REAL
    c_imag = C0_IMAG
    c_inc = 2.0 * CALC_RANGE / NUM_STEP

    do i = 1, NUM_STEP
        do j = 1, NUM_STEP
            div_speed_map(j, i) = div_speed(c_real, c_imag)
            c_imag = c_imag + c_inc
        end do
        c_real = c_real + c_inc
    end do

    deallocate(div_speed_map)

end program main
