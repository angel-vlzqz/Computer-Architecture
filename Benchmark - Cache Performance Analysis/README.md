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
the program will run. The result will be displayed in the
console.

If the console does not show up, press Window->Console

The console will prompt you to enter a 1 word block percent miss
penalty rate. This is a percentage in decimal form.

The console will then prompt you to enter a 4 word block percent
miss penalty rate. This is also a percentage in decimal form

The console will display calculation results for one word block
miss penalty, four word block non-burst miss penalty, and four word
block burst miss penalty.