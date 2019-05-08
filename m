From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Tue,  7 May 2019 23:21:18 -0600
Subject: [Linux-kernel-mentees] [PATCH] lspci: Make output for empty range
	behind a bridge consistent
Message-ID: <20190508052118.21796-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508052118.y3BA06wuyrVTune2oCNLTA26NBx7hcRa0kAmb9n7czE@z>

When a range behind a bridge is empty, '[empty]' will be displayed
after the prefix. Removing option to display 'None' for consistency.

Using -vvv will include full range addresses between prefix and '[empty]'.

show_range() is only called when verbose (-v). Code checking for
'not verbose' is not needed.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lspci.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/lspci.c b/lspci.c
index d63b6d0..65cbde9 100644
--- a/lspci.c
+++ b/lspci.c
@@ -375,23 +375,15 @@ show_size(u64 x)
 
 static void
 show_range(char *prefix, u64 base, u64 limit, int is_64bit)
-{
-  if (base > limit)
+{ 
+  printf("%s:", prefix);
+  if (base <= limit || verbose > 2)
     {
-      if (!verbose)
-	return;
-      else if (verbose < 3)
-	{
-	  printf("%s: None\n", prefix);
-	  return;
-	}
+      if (is_64bit)
+        printf(" %016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
+      else
+        printf(" %08x-%08x", (unsigned) base, (unsigned) limit);
     }
-
-  printf("%s: ", prefix);
-  if (is_64bit)
-    printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
-  else
-    printf("%08x-%08x", (unsigned) base, (unsigned) limit);
   if (base <= limit)
     show_size(limit - base + 1);
   else
-- 
2.20.1
