# TOP

https://www.transip.eu/knowledgebase/1979-using-the-top-command-linux

### Top commands

Once started, top has a number of commands / key combinations for use:

* Arrow keys & page up/down: Navigate through the displayed list in the Task area.
* q: Finish the top with the q-key.
* shift + p: Sort the processes by CPU usage.
* shift + m: Sort the processes by memory (%MEM) usage.
* shift + t: Sort the processes by running-time.
* shift + n: Sort the processes by process ID.
* t: Changes the display of the CPU usage in the summary section.
* m: Changes the display of memory usage in the summary section.
* shift + r: Sort the processes in ascending order instead of descending (default).
* c: By pressing c, the 'Command' column shows the entire path from which the processes were started.
* shift + v: Shows the parent / child process hierarchy.
* k: Prompts for a process ID and closes the specified process. By default, SIGTERM is used for a graceful shutdown of the process. For a forced shutdown, you use SIGKILL.
