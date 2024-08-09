      PROGRAM MPI
      IMPLICIT REAL*8(A-H,O-Z)
      include 'mpif.h'
      PARAMETER( NDX = 5 )
      PARAMETER( NDY = 4 )
      DIMENSION A(NDX,NDY)
      DIMENSION B(NDX,NDY)

      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      print *, 'Process ', myid, ' of ', numprocs, ' is alive'
      MM=NDY/numprocs
      IMIN=1+MM*myid
      IMAX=MM*(myid+1)

      A=2.0D0

      II=0
      DO J=IMIN,IMAX
      DO I=1,NDX
      II=II+1
      III=II
      IF (myid.EQ.1) III=-III
      A(I,J)=III+A(I,J)
      ENDDO
      ENDDO

      IF (myid.EQ.0) THEN
      WRITE(6,*) 'C-------------C'
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      WRITE(6,*) 'C-------------C'
      ENDIF

      IF (myid.EQ.1) THEN
      WRITE(6,*) 'C-------------C'
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      WRITE(6,*) 'C-------------C'
      ENDIF
      
      ! sum both processors outputs
      call MPI_ALLREDUCE(A(1,1),B(1,1),NDX*NDY,MPI_DOUBLE_PRECISION,
     &     MPI_SUM,
     &     MPI_COMM_WORLD,ierr)

      ! print the sum with the first processor
      IF (myid.EQ.0) THEN
      WRITE(6,*) 'HI !',myid
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) B(I,J)
      ENDDO
      ENDDO
      ENDIF

      call MPI_FINALIZE(ierr)
      STOP
      END
