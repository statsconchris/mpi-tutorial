      PROGRAM ORG
      IMPLICIT REAL*8(A-H,O-Z)
      PARAMETER( NDIM = 10 )
      DIMENSION A(NDIM)
      
      IMAX=NDIM
      DO I=1,IMAX
      A(I)=I
      ENDDO
      DO I=1,IMAX
      WRITE(6,*) I,A(I)
      ENDDO
      STOP
      END
