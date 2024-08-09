## Compile the code
`mpif90 -o hello-world.out hello-world.f`

## Run the code

`mpirun -np 2 hello-world.out`

or as root user (not recommended):

`mpirun --allow-run-as-root -np 2 hello-world.out`

In this example, 2 processors are requested.

## Examples

- `hello-world.f`

   Prints compute-node name and process number

- `h1.f`

  No MPI. Prints 1D array, A()

- `h2.f`

  MPI. Prints 1D array, A(), splitted in 2 processors. Processor 1 from A(1) to A(5). Processor 2 from A(6) to A(10)

- `h3.f`

  MPI. Prints 1D array, A(), splitted in 2 processors. Then gather all results an each processor prints the full output

- `h4.f`

  MPI. Prints 2D array, A(), splitted in 2 processors. Then gather all results and first processor prints the full output 
