! { dg-do run }
! Tests for the constant folding of the NEAREST intrinsic
! We compare against the results of the runtime implementation,
! thereby making sure that they remain consistent
REAL, PARAMETER :: x(10) = (/ 1., 0.49999997, 0.5, 8388609.0, -1., &
                                      -0.49999997, -0.5, -8388609.0, &
                                      0., 0. /), &
                 dir(10) = (/ -1.,       +1., -1.,       -1., +1., &
                                             -1.,  +1.,        +1., &
                                     +1.,-1./)
REAL :: a(10)

a = x
if (nearest (x(1), dir(1)) /= nearest (a(1), dir(1))) call abort ()
if (nearest (x(2), dir(2)) /= nearest (a(2), dir(2))) call abort ()
if (nearest (x(3), dir(3)) /= nearest (a(3), dir(3))) call abort ()
if (nearest (x(4), dir(4)) /= nearest (a(4), dir(4))) call abort ()
if (nearest (x(5), dir(5)) /= nearest (a(5), dir(5))) call abort ()
if (nearest (x(6), dir(6)) /= nearest (a(6), dir(6))) call abort ()
if (nearest (x(7), dir(7)) /= nearest (a(7), dir(7))) call abort ()
if (nearest (x(8), dir(8)) /= nearest (a(8), dir(8))) call abort ()
! These last two tests are commented out because mpfr provides no support
! for denormals, and therefore we get TINY instead of the correct result.
!if (nearest (x(9), dir(9)) /= nearest (a(9), dir(9))) call abort ()
!if (nearest (x(10), dir(10)) /= nearest (a(10), dir(10))) call abort ()

end
