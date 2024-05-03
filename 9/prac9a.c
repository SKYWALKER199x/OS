#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    fork();
    fork();
    printf("this is working with process id: %d\n", getpid());
    return 0;
}
