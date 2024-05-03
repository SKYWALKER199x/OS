#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

void caseInsensitiveSearch(char *filename, char *search) {
    FILE *file;
    char line[MAX_LINE_LENGTH];

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(line, sizeof(line), file)) {
        // Convert both line and search to lowercase for case-insensitive comparison
        char *temp_line = strdup(line);
        char *temp_search = strdup(search);
        strlwr(temp_line);
        strlwr(temp_search);
        if (strstr(temp_line, temp_search) != NULL) {
            printf("%s", line);
        }
        free(temp_line);
        free(temp_search);
    }

    fclose(file);
}

void displayMatchCount(char *filename, char *search) {
    FILE *file;
    char line[MAX_LINE_LENGTH];
    int count = 0;

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(line, sizeof(line), file)) {
        // Convert both line and search to lowercase for case-insensitive comparison
        char *temp_line = strdup(line);
        char *temp_search = strdup(search);
        strlwr(temp_line);
        strlwr(temp_search);
        if (strstr(temp_line, temp_search) != NULL) {
            count++;
        }
        free(temp_line);
        free(temp_search);
    }

    printf("Number of matches: %d\n", count);
    fclose(file);
}

void wholeWordSearch(char *filename, char *search) {
    FILE *file;
    char line[MAX_LINE_LENGTH];
    char *token;

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(line, sizeof(line), file)) {
        // Tokenize the line
        token = strtok(line, " \t\n");
        while (token != NULL) {
            // Compare token with search term as a whole word
            if (strcmp(token, search) == 0) {
                // Check if the token exactly matches the search term
                if (strcmp(token, search) == 0) {
                    printf("%s", line);
                    break;
                }
            }
            token = strtok(NULL, " \t\n");
        }
    }

    fclose(file);
}

void endOfStringMatch(char *filename, char *search) {
    FILE *file;
    char line[MAX_LINE_LENGTH];
    size_t len;

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    len = strlen(search);

    while (fgets(line, sizeof(line), file)) {
        size_t line_len = strlen(line);
        if (line_len >= len && strncmp(line + line_len - len, search, len) == 0) {
            printf("%s", line);
        }
    }

    fclose(file);
}

void showLineNumber(char *filename, char *search) {
    FILE *file;
    char line[MAX_LINE_LENGTH];
    int line_number = 1;

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(line, sizeof(line), file)) {
        printf("%d:%s", line_number++, line);
    }

    fclose(file);
}

int main() {
    int choice;
    char filename[100];
    char search[100];

    printf("Enter the file name: ");
    scanf("%s", filename);

    printf("Enter the search word: ");
    scanf("%s", search);

    do {
        printf("\nMenu:\n");
        printf("1. Case insensitive search\n");
        printf("2. Display the count of number of matches\n");
        printf("3. Checking for whole words in a file\n");
        printf("4. Matching the lines that end with a string\n");
        printf("5. Show line number while displaying the output\n");
        printf("0. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1:
                caseInsensitiveSearch(filename, search);
                break;
            case 2:
                displayMatchCount(filename, search);
                break;
            case 3:
                wholeWordSearch(filename, search);
                break;
            case 4:
                endOfStringMatch(filename, search);
                break;
            case 5:
                showLineNumber(filename, search);
                break;
            case 0:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice! Please enter a valid option.\n");
        }
    } while(choice != 0);

    return 0;
}
