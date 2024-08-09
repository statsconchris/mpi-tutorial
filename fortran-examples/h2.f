      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDIM = 10 )
      DIMENSION A(NDIM)

      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'

      ! 2 processors
      MM=NDIM/numprocs ! MM=5
      IMIN=1+MM*myid   ! IMIN = 1 or 6
      IMAX=MM*(myid+1) ! IMAX = 5 or 10

      DO I=IMIN,IMAX
      A(I)=I
      ENDDO

      ! first processor
      IF (myid.EQ.0) THEN
      DO I=1,NDIM
      WRITE(6,*) I,A(I)
      ENDDO
      ENDIF

      ! second processor
      IF (myid.EQ.1) THEN
      DO I=1,NDIM
      WRITE(6,*) I,A(I)
      ENDDO
      ENDIF

      call MPI_FINALIZE(ierr)
      STOP
      END
