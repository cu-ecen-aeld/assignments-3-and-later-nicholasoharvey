#include <syslog.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main (int argc,char **argv)
{

    openlog (NULL, 0, 0);
    if (argc != 3) {
        syslog (LOG_ERR, "insufficient number of arguments");
        return 1;
    }
    char *filetowrite=argv[1];
    char *textstring=argv[2];
    int fd = open(filetowrite, O_WRONLY|O_CREAT,0666);
    if (fd == -1) {
        syslog (LOG_ERR, "Failed to open file");
        return 1;
    }
    if (write(fd,textstring,strlen(textstring)) == -1) {
        syslog (LOG_ERR, "Failed to write file");
        return 1;
    } else {
        syslog (LOG_DEBUG, "Writing %s to %s",textstring,filetowrite);
    }
    if (close(fd) == -1) {
       syslog(LOG_ERR,"file close failed");
       return 1;
    }
    return 0;
}
