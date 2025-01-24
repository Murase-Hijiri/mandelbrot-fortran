module param
    use, intrinsic :: iso_fortran_env
    implicit none

    !! C0_REAL：計算の中心となる複素数の実部
    !! C0_IMAG：計算の中心となる複素数の虚部
    !! CALC_RANGE：中心から±CALC_RANGEの範囲だけ計算する
    real(real64), parameter :: &
    C0_REAL = 0, &
    C0_IMAG = 0.1145, &
    CALC_RANGE =0.003

    !! N_MAX：計算回数の上限
    !! NUM_STEP：
    integer(int32), parameter :: &
    N_MAX = 20000, &
    NUM_STEP = 800
    
end module param
