From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Wed, 19 Jun 2019 10:48:58 -0600
Subject: [Linux-kernel-mentees] [PATCH v4 3/3] lspci: Change output for
	bridge with empty range to "[disabled]"
In-Reply-To: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
References: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
Message-ID: <20190619164858.84746-4-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190619164858.PWf8jJc9rnmaEn1_ww_2NObo9FamXR0ZAIC_TmeqS88@z>

Change output displayed for memory behind bridge when the range is
empty to be consistent between each verbosity level. Replace "None" and
"[empty]" with "[disabled]". Old and new output examples listed below
for each verbosity level.

Show_range() is not called unless verbose == true. No output given
unless a verbose argument is provided.

OLD output for -v and -vv which uses "None" and -vvv uses "[empty]":

  Memory behind bridge: None                          # lspci -v
  Memory behind bridge: None                          # lspci -vv
  Memory behind bridge: 0000e000-0000efff [empty]     # lspci -vvv

NEW output for -v, -vv, and -vvv to use "[disabled]":

  Memory behind bridge: [disabled]                       # lspci -v
  Memory behind bridge: [disabled]                       # lspci -vv
  Memory behind bridge: 0000e000-0000efff [disabled]     # lspci -vvv

Advantage is consistent output regardless of verbosity level chosen and
to simplify the code.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lspci.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/lspci.c b/lspci.c
index 7418b07..525bb82 100644
--- a/lspci.c
+++ b/lspci.c
@@ -376,20 +376,18 @@ show_size(u64 x)
 static void
 show_range(char *prefix, u64 base, u64 limit, int is_64bit)
 {
-  if (base > limit && verbose < 3)
+  printf("%s:", prefix);
+  if (base <= limit || verbose > 2)
     {
-      printf("%s: None\n", prefix);
-      return;
+      if (is_64bit)
+        printf(" %016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
+      else
+        printf(" %08x-%08x", (unsigned) base, (unsigned) limit);
     }
-  printf("%s: ", prefix);
-  if (is_64bit)
-    printf("%016" PCI_U64_FMT_X "-%016" PCI_U64_FMT_X, base, limit);
-  else
-    printf("%08x-%08x", (unsigned) base, (unsigned) limit);
   if (base <= limit)
     show_size(limit - base + 1);
   else
-    printf(" [empty]");
+    printf(" [disabled]");
   putchar('\n');
 }
 
-- 
2.20.1
