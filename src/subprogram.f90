module subprogram
    use, intrinsic :: iso_fortran_env
    use param, only : N_MAX
    implicit none

contains
    !! c_inで漸化式を計算したときの発散のスピードを返す
    !! c_inがMandelbrot集合の要素であれば、戻り値は0となる
    function div_speed(c_in_real, c_in_imag) result(retval)
        real(real64), intent(in) :: c_in_real, c_in_imag
        real(real64), intent(out) :: retval

        real(real64) :: z_real, z_imag
        real(real64) :: z_next_real, z_next_imag
        integer(int32) :: n

        ! 漸化式を計算
        do n = 1, N_MAX
            z_next_real = z_real * z_real - z_imag * z_imag + c_in_real
            z_next_imag = 2.0 * z_real * z_imag + c_in_imag

            ! 発散する場合
            if (x_next_real * x_next_real + x_next_imag * x_next_imag > 4.0) then
                retval = log(n)
                return
            end if

            z_real = z_next_real
            z_imag = z_next_imag
        end do

        retval = 0
    end function

end module subprogram
