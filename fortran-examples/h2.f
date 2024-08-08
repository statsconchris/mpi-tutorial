      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDIM = 10 )
      DIMENSION A(NDIM)
C
      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'
      MM=NDIM/numprocs
      IMIN=1+MM*myid
      IMAX=MM*(myid+1)
C
      DO I=IMIN,IMAX
      A(I)=I
      ENDDO
C
      IF (myid.EQ.0) THEN
      DO I=1,NDIM
      WRITE(6,*) I,A(I)
      ENDDO
      ENDIF
C
      IF (myid.EQ.1) THEN
      DO I=1,NDIM
      WRITE(6,*) I,A(I)
      ENDDO
      ENDIF
C
      call MPI_FINALIZE(ierr)
      STOP
      END
