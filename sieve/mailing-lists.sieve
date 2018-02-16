# compile with `sievec` when done
require "fileinto";
require "imap4flags";

if header :is "List-Id" "Discussion list for the Wikidata project <wikidata.lists.wikimedia.org>" {
    fileinto "Wikimedia/Wikidata";
}
if header :is "List-Id" "Wikidata technical discussion <wikidata-tech.lists.wikimedia.org>" {
    fileinto "Wikimedia/Wikidata-Tech";
}
if header :is "List-Id" "Pywikibot discussion list <pywikibot.lists.wikimedia.org>" {
    fileinto "Wikimedia/Pywikibot";
}
if header :is "List-Id" "<wikicite-discuss.wikimedia.org>" {
    fileinto "Wikimedia/WikiCite";
}
if header :is "List-Id" "Mailing-list of the attendees of WikidataCon 2017 <2017_wikidatacon.org.ml06.ispgateway.de>" {
    fileinto "Wikimedia/WikidataCon/2017";
}

if header :is "List-Id" "<git.vger.kernel.org>" {
    if allof(not header :is "To" "Lucas Werkmeister <mail@lucaswerkmeister.de>",
             not header :is "Cc" "Lucas Werkmeister <mail@lucaswerkmeister.de>",
             not header :matches "Subject" "What's cooking in git.git *",
             not header :matches "Subject" "[ANNOUNCE] *") {
        addflag "\\Seen";
    }
    fileinto "git";
}

if anyof(address "To" "tor-relays@lists.torproject.org", address "Cc" "tor-relays@lists.torproject.org") {
    fileinto "tor/relays";
}
if anyof(address "To" "tor-announce@lists.torproject.org", address "Cc" "tor-announce@lists.torproject.org") {
    fileinto "tor/announce";
}

if header :is "List-Id" "Secure Desktops <desktops.secure-os.org>" {
    fileinto "secure-desktops";
}

if header :is "List-Id" "<cacert.lists.cacert.org>" {
    fileinto "cacert";
}
if header :is "List-Id" "<cacert-policy.lists.cacert.org>" {
    fileinto "cacert/policy";
}
if header :is "List-Id" "<cacert-de.lists.cacert.org>" {
    fileinto "cacert/de";
}
if header :is "List-Id" "<cacert-members.lists.cacert.org>" {
    fileinto "cacert/members";
}
if header :is "List-Id" "<cacert-board.lists.cacert.org>" {
    fileinto "cacert/board";
}
if header :is "List-Id" "<phoenix.lists.cacert-phoenix.org>" {
    fileinto "cacert/phoenix";
}
if header :is "List-Id" "<cacert-support.lists.cacert.org>" {
    fileinto "cacert/support";
}
