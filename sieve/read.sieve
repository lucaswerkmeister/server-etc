# compile with `sievec` when done
require "fileinto";
require "imap4flags";

if anyof(header :is "X-Jenkins-Job" "ceylon-distribution-tests",
         header :is "X-Jenkins-Job" "ceylon-ide-eclipse") {
    addflag "\\Seen";
}
