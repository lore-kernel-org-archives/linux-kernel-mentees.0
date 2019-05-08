From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Tue,  7 May 2019 23:39:57 -0600
Subject: [Linux-kernel-mentees] [PATCH] lspci: Include -vvv option in help
Message-ID: <20190508053957.22076-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508053957.vcxb1_xUj_p0PtGNHXJ74TeBRji3GMxUdrzCN8YemQ8@z>

Listed -vvv within the help page so highest used level of verbose
in lspci is known

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lspci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lspci.c b/lspci.c
index 65cbde9..9ec46c3 100644
--- a/lspci.c
+++ b/lspci.c
@@ -41,7 +41,7 @@ static char help_msg[] =
 "-t\t\tShow bus tree\n"
 "\n"
 "Display options:\n"
-"-v\t\tBe verbose (-vv for very verbose)\n"
+"-v\t\tBe verbose (-vv or -vvv for higher verbosity)\n"
 #ifdef PCI_OS_LINUX
 "-k\t\tShow kernel drivers handling each device\n"
 #endif
-- 
2.20.1
