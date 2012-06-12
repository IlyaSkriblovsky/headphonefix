#include <stdio.h>
#include <string.h>

#include <unistd.h>
#include <sys/types.h>
#include <sys/time.h>

#include <linux/input.h>



int usage() {
    fprintf(stderr, "Usage: switcher speaker|headphone|headset|videoout\n");
    return 1;
}


void dump(void* data, int len)
{
    unsigned char *cdata = (unsigned char*)data;
    for (int i = 0; i < len; i++)
        printf("%02x ", cdata[i]);
    printf("\n");
}

void sendEvents(
    FILE *f,
    unsigned int headphone,
    unsigned int mic,
    unsigned int lineout,
    unsigned int videoout
)
{
    struct input_event ev;
    gettimeofday(&ev.time, 0);
    ev.type = EV_SW;

    ev.code = SW_HEADPHONE_INSERT;
    ev.value = headphone;
    fwrite(&ev, sizeof(ev), 1, f);
    dump(&ev, sizeof(ev));

    ev.code = SW_MICROPHONE_INSERT;
    ev.value = mic;
    fwrite(&ev, sizeof(ev), 1, f);
    dump(&ev, sizeof(ev));

    ev.code = SW_LINEOUT_INSERT;
    ev.value = lineout;
    fwrite(&ev, sizeof(ev), 1, f);
    dump(&ev, sizeof(ev));

    ev.code = SW_VIDEOOUT_INSERT;
    ev.value = videoout;
    fwrite(&ev, sizeof(ev), 1, f);
    dump(&ev, sizeof(ev));

    ev.type = 0;
    ev.code = 0;
    ev.value = 0;
    fwrite(&ev, sizeof(ev), 1, f);
    dump(&ev, sizeof(ev));
}


int main(int argc, char *argv[])
{
    if (argc != 2)
        return usage();

    FILE *f = fopen("/dev/input/jack", "wb");

    if (f == 0) {
        fprintf(stderr, "Can't open device\n");
        return 2;
    }

    if (strcmp(argv[1], "speaker") == 0)
        sendEvents(f, 0, 0, 1, 0);
    else if (strcmp(argv[1], "headphone") == 0)
        sendEvents(f, 1, 0, 0, 0);
    else if (strcmp(argv[1], "headset") == 0)
        sendEvents(f, 1, 1, 0, 0);
    else if (strcmp(argv[1], "videoout") == 0)
        sendEvents(f, 0, 0, 1, 1);
    else
        usage();

    fclose(f);

    return 0;
}
