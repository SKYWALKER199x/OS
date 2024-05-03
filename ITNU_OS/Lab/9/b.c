#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int main()
{
    FILE *fptr;
    char name[20];
    printf("Enter filename: ");
    scanf("%s", &name);
    fptr = fopen(name, "r");

    char myString[100];
    fgets(myString, 100, fptr);

    bool f = true;

    while (f == true)
    {
        printf("1.-c This prints only a count of the lines that match a pattern"\n);
        printf("2.-i Ignores, case for matching\n");
        printf("3.-n Display the matched lines and their line numbers\n");
        printf("4.-v This prints out all the lines that do not matches the pattern\n");
        printf("5.-w Match whole word");
        printf("6.exit");

        printf("Enter your choice:");
        int c;
        scanf("%d", &c);

        switch (c)
        {
        case 1:
            grep_c();
            break;

        case 2:
            grep_i();
            break;

        case 3:
            grep_n();
            break;

        case 4:
            grep_v();
            break;

        case 5:
            grep_w();
            break;

        case 6:
            f = false;
            break;

        default:
            printf("Enter Valid Choice");
            break;
        }
    }
    fclose(fptr);
    return 0;
}

void grep_c()
{
    // 1.-c option
}

void grep_i()
{
    // 2.-i option
}

void grep_n()
{
    // 3.-n option
}

void grep_v()
{
    // 4.-v option
}

void grep_w()
{
    // 5.-w option
}