# compile with `sievec` when done
require "envelope";
require "fileinto";
require "imap4flags";
require "regex";

# I don't even want to see spam higher than level 10
if header :contains "X-Spam-Level" "**********" {
    discard;
    stop;
}

# File low-level spam and viruses in spam bucket
if anyof (header :contains "X-Spam-Level" "*****",
          header :contains "X-Virus-Status" "Infected" ) {
    fileinto "Junk";
    if header :contains "X-Spam-Level" "*****" {
        setflag "\\Seen";
    }
}
