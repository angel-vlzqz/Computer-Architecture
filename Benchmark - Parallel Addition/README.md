Running .asm files

To run a .asm file, the QtSPIM application needs to be
downloaded

You can simply search up SPIM MIPS Simulator and the first link
will direct you the download.

Follow the download instructions to get QtSPim installed on
your system.

If using MacOS, the default security settings will prevent you
from opening an app from an "untrusted developer". You will need
to override this option.

Once downloaded, you should be able to open up the app and see
a display showing you the system's registers and data.

To run a file, you will need to click the button in the header
that looks like a folder with a screen coming out of it.

Or, you can click on File->Reinitialize and Load File

Once loaded, you may press the play button in the header and
the program will run.

This program does not utilize the console for input or output.
All calculations are to be checked by manually inspecting the
registers.

In the program, two arrays are created with a length of 4 indexes.
Through this, they are divided into 4 words per core. The arrays
are parsed, and each element is added by itself and placed back into
the array. In this execution, a total of four hypothetical cores execute
instructions in parallel.
