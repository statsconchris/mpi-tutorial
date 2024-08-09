## Compile the code

e.g.,

`mpif90 -o hello-world.out hello-world.f`

## Run the code

`mpirun -np 2 hello-world.out`

or as root user (not recommended)

`mpirun --allow-run-as-root -np 2 hello-world.out`

In this example, 2 processors are requested.

## Examples

1) hello-world.f

output: compute-node name and process name

2) h1.f

 
