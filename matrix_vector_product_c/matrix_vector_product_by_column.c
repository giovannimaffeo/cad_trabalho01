#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to allocate and initialize a square matrix of size nxn with random numbers
int** create_matrix(int n) {
    int** matrix = (int**)malloc(n * sizeof(int*));
    for (int i = 0; i < n; i++) {
        matrix[i] = (int*)malloc(n * sizeof(int));
        for (int j = 0; j < n; j++) {
            matrix[i][j] = rand() % 100; // Random numbers between 0 and 99
        }
    }
    return matrix;
}

// Function to allocate and initialize a vector of size n with random numbers
int* create_random_vector(int n) {
    int* vector = (int*)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        vector[i] = rand() % 100; // Random numbers between 0 and 99
    }
    return vector;
}

// Function to allocate and initialize a vector of size n with number 0
int* create_zero_vector(int n) {
    int* vector = (int*)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        vector[i] = 0; 
    }
    return vector;
}

// Function to deallocate the memory allocated for the matrix and the vector
void free_memory(int** matrix, int* vector, int n) {
    for (int i = 0; i < n; i++) {
        free(matrix[i]);
    }
    free(matrix);
    free(vector);
}

// Function to perform the matrix-vector multiplication by iterating over columns
void matrix_vector_product(int** matrix, int* vector, int* result, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            result[j] += matrix[j][i] * vector[i];
        }
    }
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: ./matrix_vector_product <n>\n");
        return 1;
    }

    int n = atoi(argv[1]);

    // Memory allocation
    int** matrix = create_matrix(n);
    int* vector = create_random_vector(n);
    int* result = create_zero_vector(n);

    // Matrix-vector product
    clock_t start = clock();
    matrix_vector_product(matrix, vector, result, n);
    clock_t end = clock();

    // Calculation of execution time
    double time = (double)(end - start) / CLOCKS_PER_SEC;

    // Print execution time
    printf("Execution time: %.6f seconds\n", time);

    // Memory deallocation
    free_memory(matrix, vector, n);

    return 0;
}