      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDX = 3 )
      PARAMETER( NDY = 2 )
      DIMENSION A(NDX,NDY)
C
      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'
C
      II=0
      IF (myid.EQ.0) THEN
      DO J=1,NDY
      DO I=1,NDX
      II=II+1
      A(I,J)=II
      ENDDO
      ENDDO
      ENDIF
C
      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      IF (myid.EQ.1) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      call MPI_BCAST(A,NDX*NDY,
     $               MPI_DOUBLE_PRECISION,0,MPI_COMM_WORLD,ierr)
C
      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      IF (myid.EQ.1) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF
C
      call MPI_FINALIZE(ierr)
      STOP
      END
