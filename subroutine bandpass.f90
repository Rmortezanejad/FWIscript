  subroutine bandpass(x,n,delta_t,f1,f2)
    ! a double-precision wrapper around sac xapiir()
    ! modified from FLEXWIN subroutines on 26-July-2009

    implicit none
    integer, intent(in) :: n
    double precision, intent(inout),  dimension(*) :: x
    double precision, intent(in) :: delta_t,f1,f2
    real, dimension(:), allocatable :: x_sngl

    allocate(x_sngl(n))

    x_sngl(1:n) = sngl(x(1:n))
    !  delta_t_sngl = sngl(delta_t)

    ! old version - uses old SacLib
    ! does band-pass filter
    !call xapiir(x_sngl,n,'BU',sngl(TRBDNDW),sngl(APARM),IORD,'BP',sngl(FSTART),sngl(FEND),delta_t_sngl,PASSES)

    ! new version, uses subroutines in libsac.a
    ! does band-pass filter
    ! BU - butterworth
    ! BP - bandpass
    ! LQY: Shouldn't  delta_t_sngl = sngl(delta_t) still be done? same for f1,f2?
    call xapiir(x_sngl,n,'BU',TRBDNDW,APARM,IORD,'BP',f1,f2,delta_t,PASSES)

    x(1:n) = dble(x_sngl(1:n))

    deallocate(x_sngl)

  end subroutine bandpass
