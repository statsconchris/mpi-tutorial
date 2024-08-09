        PROGRAM hello_world_mpi
        include 'mpif.h'
        
        integer process_rank, ierror, tag, resultlen, num
        CHARACTER(20) :: name

        call MPI_INIT( ierror )
        call MPI_COMM_SIZE( MPI_COMM_WORLD, num, ierror )
        call MPI_COMM_RANK( MPI_COMM_WORLD, process_rank, ierror )
        call MPI_GET_PROCESSOR_NAME( name, resultlen, ierror )

        print *, 'We are in compute-node: ', name
        print *, 'Hello world from process: ', process_rank, 'of ', num

        call MPI_FINALIZE(ierror)
        END PROGRAM
