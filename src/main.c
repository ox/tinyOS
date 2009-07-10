// main.c -- Defines the C-code kernel entry point, calls initialisation routines.
//           Made for JamesM's tutorials <www.jamesmolloy.co.uk>

//main!
#include "monitor.h"

int main(struct multiboot *mboot_ptr)
{
    // All our initialisation calls will go in here.
    
    // Initialise the screen (by clearing it)
    monitor_clear();
    // Write out a sample string
    monitor_write("tinyOS!");
    
    return 0;
}
