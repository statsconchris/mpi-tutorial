      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDX = 5 )
      PARAMETER( NDY = 4 )
      DIMENSION A(NDX,NDY)
      DIMENSION B(NDX,NDY)
C
      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'
      MM=NDY/numprocs
      IMIN=1+MM*myid
      IMAX=MM*(myid+1)
C
      II=0
      DO J=IMIN,IMAX
      DO I=1,NDX
      II=II+1
      III=II
      IF (myid.EQ.1) III=-III
      A(I,J)=III
      ENDDO
      ENDDO
C
      IF (myid.EQ.0) THEN
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      IF (myid.EQ.1) THEN
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      call MPI_ALLGATHER(A(1,IMIN),NDX*MM,MPI_DOUBLE_PRECISION,
     &     B(1,1),NDX*MM,MPI_DOUBLE_PRECISION,
     &     MPI_COMM_WORLD,ierr)
C
      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) B(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      call MPI_FINALIZE(ierr)
      STOP
      END
