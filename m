From: madhuparnabhowmik04 at gmail.com (Madhuparna Bhowmik)
Date: Sat, 28 Sep 2019 00:31:27 +0530
Subject: [Linux-kernel-mentees] [PATCH] Staging: media: ipu3: Changed
 unsigned long int to unsigned long
Message-ID: <20190927190123.GA9230@madhuparna-HP-Notebook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes the following warning:
WARNING: Prefer 'unsigned long' over 'unsigned long int' as the int is unnecessary

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index 3d969b0522ab..5f3ff964f3e7 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -130,7 +130,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
 	for (pte = 0; pte < IPU3_PT_PTES; pte++)
 		pt[pte] = pteval;

-	set_memory_uc((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_uc((unsigned long)pt, IPU3_PT_ORDER);

 	return pt;
 }
@@ -141,7 +141,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
  */
 static void imgu_mmu_free_page_table(u32 *pt)
 {
-	set_memory_wb((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_wb((unsigned long)pt, IPU3_PT_ORDER);
 	free_page((unsigned long)pt);
 }

--
2.17.1
