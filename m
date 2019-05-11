From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 17:03:08 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] lspci: Include -vvv option in
	help
In-Reply-To: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
References: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
Message-ID: <20190511230310.4438-2-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Listed -vvv within the help page so highest used level of verbose
in lspci is known

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lspci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lspci.c b/lspci.c
index d63b6d0..937c6e4 100644
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
