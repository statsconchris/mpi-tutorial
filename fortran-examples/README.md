## Compile the code
`mpif90 -o hello-world.out hello-world.f`

## Run the code
<<<<<<< HEAD

`mpirun -np 2 hello-world.out`
=======
`mpirun -np 20 hello-world.out`
>>>>>>> 6b8691bf06881d9734f164c6a118e7bb5ecc6d64

or as root user (not recommended)

`mpirun --allow-run-as-root -np 2 hello-world.out`

In this example, 2 processors are requested.

## Examples

- `hello-world.f`

  output: compute-node name and process number

- `h1.f`

  output: no MPI. Prints matrix values

<<<<<<< HEAD
output: compute-node name and process name

2) h1.f

 
=======
  
>>>>>>> 6b8691bf06881d9734f164c6a118e7bb5ecc6d64
