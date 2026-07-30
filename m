Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484C3BBFDE
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444495; cv=none; b=UmNOTBdCs+3I/Am7YEDvIubcYbgjfk/EIZ2BaUXcMWuhAOm0BpFN8TbyteCt7cpqiGmoTFtQWNxlfASuAr3BKv3w/XUj22kh5oaHybZoSHD+NsOyh/R72LdPD0SwxcGRPI7Q+oaP2bnZi+ZYkm1keI36jeaYVv8/3ojDNrqFtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444495; c=relaxed/simple;
	bh=SZUBalN3fJqY2DHoeYGQNW6Ni/i7A61VoThyuTT7XVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Im/giAEEejrP6+5ddCDxiPSBNFsJzBEbrDdPmfn7rISZz+k8YBxCs7R3/OVLlUUYgizwFntMuMoqk4CvbDGFYj3QdybgYdGo9DgMvj2x4b91vCFt+Nux/r8uWHPNnTlU9OoU5lCsDGgiTD7LyxuSOhb+9l9nOakY0Z8l4ItOQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fof/Q8hF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fof/Q8hF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so1060335e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785444493; x=1786049293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5BxE/t23ijz33IZ7iaZiV0IxU7JLoT1VOJQBQHoWO0=;
        b=fof/Q8hFv5C2xAKJWWFooIoh6IxGN0y8nH0hiOEBGLbMqPU8wxa4QWnjtXDrKm7h07
         mkUC70yqwBdl7H2MjZ5663MTg9n5gZe36fi4bf96DmoR4gyGflxrw54IikMqqqTy46/h
         PVvMENWhFnptuXfbuNlaqXgfbYqqKGutDysC7jtOJzW15lGkcPbpSd+ELgH56WqbJJNh
         9Pqe8HOAwymO4/O5+khQzJk9kK3OhXjs34Y2w4ENeI22/J0xF//P3ik3RqEIwU2B5mD5
         oHT5PPUccjLuQDFqqcrNTS2q7oZ2rmtpx8wg3NSoZdnEbTmnqxLFI+oX7eEqj7cyKUNS
         pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785444493; x=1786049293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5BxE/t23ijz33IZ7iaZiV0IxU7JLoT1VOJQBQHoWO0=;
        b=sVMJzOZttujCRMmd/jZZLcLXEqiOjHGDXvepny/m/UdpuGLC4g6+0H/oGebxwJiQv/
         GXLi3k5umrmNzHTLu6zAZakwZyqFsrMciiMN7YcV6N1OwJW/aclm7RuqqBl2vukk2afK
         nqxAbaotlUXixmvjFUqs441vuugSycxxrDdAkMiUYMxWX9DMwbj9qgtIpl2B2HKl6h3b
         pLa3HsyBob/7brG1jrfFbNRtpIqbO9IZu7WB01b6R0pkD99+56HlXcSFiTTvIRjs7eA8
         r3Svwo0DeyOp6OUhhuVKh07NDw6rOwdScfgXLCL+4dVzghH4oMeabYyfI8ok/8NnmRKW
         za/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp9JpJx79kcc/PS5pnuyruQRJRD3JbEfX9RDUy9rimAy+1NB2F2xLqOA+NN56VDzv4FbxebIqoZP2cZDQLpSYXeC/Rj/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJcIqUWqEfLWlm2fjPWNAP5kxsLz59cwQ95DesQAqhOCTD5kB1
	Uwpc5+esQ0AejMwPOWaS9Lyx/vRrU2SlSCChI2mhUJSVo9Ld7oIEAaI=
X-Gm-Gg: AR+sD12D4HZDYksMbkJ1eT2rkbhOzu0uUR64wcmnUwqNsqgccKjcf6UxRlQPedTMfNI
	eMJxoBmMNUn7X+VLeO3fz0+vV4F4SLrQAuHGiSgtGzxE2ct9SUOvyJFUmkofQV4FxsojYuR1gxR
	8O4Gd7lTcIGSu58VZFIrNOLRw2JUTJAv1juo6OFmTQNKstoXSG+7be+wschjQGg/dqS9n0cpZJi
	EqlFoXXYQD6ZnXLPt3sXLjndKue7A7DKROQuCyhAGSMMKUUc7UloNwHwFfc+wtTltEB5edGvReE
	iIHVbxNRdBjV8D5sb9199Tu3g1mOX+klMuOoYCvyaFfhW8sol5BJy0EVJ0GY/EwsP7nyzyNbBsz
	puIflaPm3pIaydQYS+78TYtQsY1A0v53x7WUVKSwwsR3kyHkGAvDIAQdru72FJ1Do+CabanOU36
	CuFGxqe/f6h6hKawnV+xO+YlntiDY3SNz7MtNFqYJMPSEo7Y+mAqJiYrZf0n/XmZmyV2Gqyp2GD
	4+yWiL/PQ7IJRYl8tLrkn6Nc8i9IwIe8DUd7eV0CRCyjLMwmkhZbizvaJ5LJSAeX8WvA6QlqkBr
	PXI0hcgDa02P2EE=
X-Received: by 2002:a05:600c:19cc:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-49800e93cbfmr57370965e9.10.1785444492686;
        Thu, 30 Jul 2026 13:48:12 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-69.broadband.mtnet.hr. [92.242.248.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aaceasm85398185e9.12.2026.07.30.13.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 13:48:12 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"\\  Liam R . Howlett \\ " <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH v3] mm/khugepaged: replace mutex_lock/mutex_unlock usage with guard macro
Date: Thu, 30 Jul 2026 22:47:24 +0200
Message-ID: <20260730204724.16912-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, khugepaged locks the khugepaged_mutex in two functions:
start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
mutex_lock/mutex_unlock usage in these functions and replace it with the
guard macro. This makes the code more readable (removing a goto statement)
and makes it harder to introduce bugs in the future.
No functional changes introduced.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
v2:
  - Added #include <linux/cleanup.h> to the includes at the top of the file
  - Moved err declaration to the scope where it's used in
    start_stop_khugepaged
  - Made default case return 0 instead of err in start_stop_khugepaged
v3:
  - Moved new thread creation logic inside if (!khugepaged_thread) block
    in start_stop_khugepaged
  - Removed suboptimal err variable

 mm/khugepaged.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 617bca76db49..97f61a050f7c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -23,6 +23,7 @@
 #include <linux/ksm.h>
 #include <linux/pgalloc.h>
 #include <linux/backing-dev.h>
+#include <linux/cleanup.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -3111,18 +3112,19 @@ void set_recommended_min_free_kbytes(void)
 
 int start_stop_khugepaged(void)
 {
-	int err = 0;
-
-	mutex_lock(&khugepaged_mutex);
+	guard(mutex)(&khugepaged_mutex);
 	if (hugepage_enabled()) {
-		if (!khugepaged_thread)
-			khugepaged_thread = kthread_run(khugepaged, NULL,
-							"khugepaged");
-		if (IS_ERR(khugepaged_thread)) {
-			pr_err("khugepaged: kthread_run(khugepaged) failed\n");
-			err = PTR_ERR(khugepaged_thread);
-			khugepaged_thread = NULL;
-			goto fail;
+		if (!khugepaged_thread) {
+			struct task_struct *new_thread = kthread_run(khugepaged,
+								     NULL,
+								     "khugepaged");
+
+			if (IS_ERR(new_thread)) {
+				pr_err("khugepaged: kthread_run(khugepaged) failed\n");
+				return PTR_ERR(new_thread);
+			}
+
+			khugepaged_thread = new_thread;
 		}
 
 		if (!list_empty(&khugepaged_scan.mm_head))
@@ -3132,17 +3134,14 @@ int start_stop_khugepaged(void)
 		khugepaged_thread = NULL;
 	}
 	set_recommended_min_free_kbytes();
-fail:
-	mutex_unlock(&khugepaged_mutex);
-	return err;
+	return 0;
 }
 
 void khugepaged_min_free_kbytes_update(void)
 {
-	mutex_lock(&khugepaged_mutex);
+	guard(mutex)(&khugepaged_mutex);
 	if (hugepage_enabled() && khugepaged_thread)
 		set_recommended_min_free_kbytes();
-	mutex_unlock(&khugepaged_mutex);
 }
 
 bool current_is_khugepaged(void)
-- 
2.55.0

