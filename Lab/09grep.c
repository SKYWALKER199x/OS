#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int main(int argc, char *argv[]) {
    // Check if correct number of arguments are provided
    if (argc != 3) {
        printf("Usage: %s <search_string> <filename>\n", argv[0]);
        return 1;
    }

    char *search_string = argv[1];
    char *filename = argv[2];
    char line[MAX_LINE_LENGTH];
    FILE *file = fopen(filename, "r");

   
    if (file == NULL) {
        printf("Error opening file %s\n", filename);
        return 1;
    }

    // Read file line by line
    while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
        
        if (strstr(line, search_string) != NULL) {
           
            printf("%s", line);
        }
    }

    fclose(file);
    
    return 0;
}
