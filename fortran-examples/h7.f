      PROGRAM MPI
      include 'mpif.h'
      call MPI_INIT( ierr )

      CALL TEST

      call MPI_FINALIZE(ierr)
      STOP
      END
      
      ! subroutine starts
      SUBROUTINE TEST
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDX = 3 )
      PARAMETER( NDY = 2 )
      DIMENSION A(NDX,NDY)

      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'

      ! 2 processors
      II=0

      IF (myid.EQ.0) THEN
      DO J=1,NDY
      DO I=1,NDX
      II=II+1
      A(I,J)=II
      ENDDO
      ENDDO
      ENDIF

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

      RETURN
      END
