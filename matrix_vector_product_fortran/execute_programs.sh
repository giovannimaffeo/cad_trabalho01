#!/bin/bash

# Compile o programa em Fortran
gfortran matrix_vector_product_by_row.f90 -o matrix_vector_product_by_row

# Array de valores de N
sizes=(6 60 600 6000 12000 18000 24000 30000 36000 42000 48000 54000 60000 66000 72000)

# Loop através dos valores de N executando por linha
for size in "${sizes[@]}"
do
    echo "Executing matrix_vector_product_by_row for N = $size"
    ./matrix_vector_product_by_row $size
    echo
done

# Remova o arquivo executável
rm matrix_vector_product_by_row

###############

# Compile o programa em Fortran
gfortran matrix_vector_product_by_column.f90 -o matrix_vector_product_by_column

# Loop através dos valores de N executando por coluna
for size in "${sizes[@]}"
do
    echo "Executing matrix_vector_product_by_column for N = $size"
    ./matrix_vector_product_by_column $size
    echo
done

rm matrix_vector_product_by_column