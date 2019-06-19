From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 19 Jun 2019 10:48:57 -0600
Subject: [Linux-kernel-mentees] [PATCH v4 2/3] lspci: Remove unnecessary
	!verbose check in show_range()
In-Reply-To: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
References: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
Message-ID: <20190619164858.84746-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove 'if (!verbose)' code in show_range() due to not being called.
show_range() will only be called when verbose is true. Additional call
to check for verbosity within show_range() is dead code.

!verbose was used so nothing would print if the range behind a bridge
had a base > limit and verbose == false. Since show_range() will not be
called when verbose == false, not printing bridge information is
still accomplished.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lspci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/lspci.c b/lspci.c
index 937c6e4..7418b07 100644
--- a/lspci.c
+++ b/lspci.c
@@ -376,17 +376,11 @@ show_size(u64 x)
 static void
 show_range(char *prefix, u64 base, u64 limit, int is_64bit)
 {
-  if (base > limit)
+  if (base > limit && verbose < 3)
     {
-      if (!verbose)
-	return;
-      else if (verbose < 3)
-	{
-	  printf("%s: None\n", prefix);
-	  return;
-	}
+      printf("%s: None\n", prefix);
+      return;
     }
-
   printf("%s: ", prefix);
   if (is_64bit)
     printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
-- 
2.20.1
