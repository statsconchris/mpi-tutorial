## Compile the code
`mpif90 -o hello-world.out hello-world.f`

## Run the code
`mpirun -np 20 hello-world.out`

In this example, 20 processors are requested.

## Examples

- `hello-world.f`

  output: compute-node name and process number

- `h1.f`

  output: no MPI. Prints matrix values

  
