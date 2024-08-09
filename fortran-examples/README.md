## Compile the code
`mpif90 -o hello-world.out hello-world.f`

## Run the code

`mpirun -np 2 hello-world.out`

or as root user (not recommended):

`mpirun --allow-run-as-root -np 2 hello-world.out`

In this example, 2 processors are requested.

## Examples

- `hello-world.f`

   Prints compute-node name and process number.

- `h1.f`

  No MPI. Prints 1D array, A().

- `h2.f`

  MPI. Prints 1D array, A(), splitted in 2 processors. Processor 1 prints A(1) to A(5). Processor 2 prints A(6) to A(10).

- `h3.f`

  MPI. Prints 1D array, A(), splitted in 2 processors. Then gather all results together and each processor prints the full output.

- `h4.f`

  MPI. Prints 2D array, A(), splitted in 2 processors. Then gather all results together and first processor prints the full output.

- `h5.f`

  MPI. Prints 2D array, A(). First processor's output is casted, i.e., the second processor prints the first processor's output.

- `h6.f`

  MPI. Prints 2D arrays. Each processor computes an array with different values. Then, we add both and print the output using the first processor.

- `h7.f`

  MPI. Similar to `h5.f`; however, here we use a subroutine. 
