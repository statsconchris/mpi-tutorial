      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDX = 3 )
      PARAMETER( NDY = 2 )
      DIMENSION A(NDX,NDY)

      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'
      
      ! 2 processors
      II=0

      IF (myid.EQ.0) THEN
      DO J=1,NDY ! J -> 1 to 2
      DO I=1,NDX ! I -> 1 to 3
      II=II+1
      A(I,J)=II
      ENDDO
      ENDDO
      ENDIF
      ! first processor
      ! A(1,1)=1 A(2,1)=2 A(3,1)=3 A(1,2)=4 A(2,2)=5 A(3,2)=6

      ! second processor
      ! A(1,1)=0 A(2,1)=0 A(3,1)=0 A(1,2)=0 A(2,2)=0 A(3,2)=0

      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      IF (myid.EQ.1) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      ! cast first processor output
      call MPI_BCAST(A,NDX*NDY,
     $               MPI_DOUBLE_PRECISION,0,MPI_COMM_WORLD,ierr)

      ! first processor outputs its result
      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      ! second processor outputs first processor result
      IF (myid.EQ.1) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      call MPI_FINALIZE(ierr)
      STOP
      END
