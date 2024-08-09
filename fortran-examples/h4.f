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
      
      ! 2 processors
      MM=NDY/numprocs  ! MM=2
      IMIN=1+MM*myid   ! IMIN=1 or 3
      IMAX=MM*(myid+1) ! IMAX=2 or 4

      II=0
      DO J=IMIN,IMAX ! J -> 1 to 4
      DO I=1,NDX     ! I -> 1 to 5
      II=II+1 
      III=II
      IF (myid.EQ.1) III=-III
      A(I,J)=III 
      ENDDO
      ENDDO
      ! first processor 
      ! A(1,1)=1 A(2,1)=2 A(3,1)=3 A(4,1)=4 A(5,1)=5 
      ! A(1,2)=6 A(2,2)=7 A(3,2)=8 A(4,2)=9 A(5,2)=10 
      
      ! second processor
      ! A(1,3)=-1 A(2,3)=-2 A(3,3)=-3 A(4,3)=-4 A(5,3)=-5 
      ! A(1,4)=-6 A(2,4)=-7 A(3,4)=-8 A(4,4)=-9 A(5,4)=-10

      ! first processor
      IF (myid.EQ.0) THEN
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      ! second processor
      IF (myid.EQ.1) THEN
      DO J=1,NDY
      DO I=1,NDX
      WRITE(6,*) A(I,J)
      ENDDO
      ENDDO
      ENDIF

      ! gather all results in B matrix
      call MPI_ALLGATHER(A(1,IMIN),NDX*MM,MPI_DOUBLE_PRECISION,
     &     B(1,1),NDX*MM,MPI_DOUBLE_PRECISION,
     &     MPI_COMM_WORLD,ierr)

      ! print matrix B with first processor
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
