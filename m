Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4151F2571A9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271659; cv=none; b=Koe4rEr0BlF9G+LcIPOEgOok4akEUH2P8oQJpjD2YgAErRFSRexrgFLoa/iJN9fuOQexLJTgsGrG/8wcAJ36gS/TvU40OYrouitQkm+dg+FEtvD03pmTDbPGK+t80aPitMiJ4tIoQpqPNaqn0TfyFkSE5lIxZ3GcoCoI3iZnWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271659; c=relaxed/simple;
	bh=/STkg7uoDqufNzb2rmU3N4ad0MB4TKC4hn487jY7dig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2VRlYrhK0pjOnW0EN26H1VVNd5u8ZM9eyEpyP27H/Pe4gRdUWl3FEG4yV/K6MfyR1LSnfVXWyis6O6G6IayXQtVsIys3U7R0jtjqDRgR/FCL93wSOiTXO7NjpHjaaB8iA1j9R9zIP+D+dz/C5Q/oG1+SN3yYZ3rQQHFvnbphBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpIRk/K0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpIRk/K0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1894885e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785271656; x=1785876456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytQPuk/Djc/IdfIxup0S/O4J+teQ2GhQjH2sKJeJZ5c=;
        b=rpIRk/K0D8t4FZjZCKN/eadXcHK4wGVniEgOyAjmKvl0zihjJsmgaIpvtOJS/0iurh
         f3e44js0iPZCxZIejkDztMYG2tvQNAJz1B1PWlNaBFkW2RojBtRlk2rpdqy/od7xZuCy
         3OnSQzyHbRR0TOZRe6GhjMkvoWA+qAHF2pmnMkUE1PtRgEQvYAhRbCBP9teC2HcSAzO8
         MDkz9NVlTTF/FwA1GO7NKZP3kKCwgpOnEy1sQASusbOMF8HXiwzhXHvHZihRSXXOnBll
         O7eFY13tDl4/PFKcKNgKeKx312NTMjat+ycr7j8aa8vNOrYoNXVcAV1qAKXR9mOllYlt
         ns3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785271656; x=1785876456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytQPuk/Djc/IdfIxup0S/O4J+teQ2GhQjH2sKJeJZ5c=;
        b=Ugnuc6HTh46kQaE7Xh11fudDZHC0vOE3hmNAg0k+Rwim5zcm9R8Z0PDrZkBMLVrx4r
         UICXIYLs4N0vPewf6QBZ09dBS3rZM/PBKTTscU3deNePasLJ0WGOBDoiEuwKmsABtNXN
         MCH3o7PRZKSNJr1dO98HHCDe37SSsOgAVNnwO3uiM3q/wrLV5H8Sydw4OFO7tIK92TPq
         nEaqlnzmfjwN8c+RforwSvq2geSG3gpXYxIrb23kkzEjMK4gnWN6NdNysJwMoqmxpbW1
         4CSTOX9uLgSc54XT10KMR+QMU/Xjk5qFXMJom7sZm73WCCmubbwUZZir5COUlk7McwoY
         NpYg==
X-Forwarded-Encrypted: i=1; AHgh+RqaQl+v995TvMCg2p5UGT5pNSdHp3k48LgbsZPiRufzkbJBtjDcUMIUabkGScf4tptl0SN6vWHS+cj8X4JBeQ6jI+zQGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP5RJoF5mfk2NujLeDh9eqajrc4jenMbzHM+ifXRKy6VfU5hlg
	1KKvo6wUUhjuLiDkfYXAKFcMw855NdNBaaqK8kBg1LbgdM/q1Tn4VTs=
X-Gm-Gg: AR+sD130N9n+YRw9f2ftYPF6oKelWuZ8fYzetMsrVeDXHGLBGGpCXMudn94JLIByMMe
	xZf4LQWJ/kAMJ591CNPuN6dc/kAajvS64PJosr8l6D6vl6Yb4Ypecwys8jaZoXYt1zlkcphZyVW
	YLcAfux/b0+h+ys/xW77VmC4rju5oEmHn4QawWHXuvvTU94vwGedzIFeAT063DEm9fNKpjKQ5cz
	wLtT05soGdTIHLikR+T5m9ppWJywIijvIm8sqg/m3eE38lhEMxgzib7bag/m8TR/9KvgDtWtP+P
	0304Db+dxxPbdniZOK6lTTZ0z5FIHfFs95Q6O/eGZDy/VKCIoqZ9OfMKO0vUtkQTx08vqEPbaRE
	jZIktphnUirzRZJIAj1XdHhQYiNYynmQ+HLqliWXVhbz+TASjLx9tfAeuStIYEXv94ZMFEWNgSz
	7lvjiKlgHq5IRZNETpGhL9d91SEJ5v2ALbrESq+PgYnUnrM9Lzlvu6d1DfxWGGYnAgaRfR73bVS
	52Gi8rveZuDIZGt10h9sYB4D888a2I0TxR0XfXJWa0HCDKMxOBkq2UH3eh3yaHbFOMb6iXlSK3b
	ByJWxgC4i/BhK3jCDZUxY/dtbA==
X-Received: by 2002:a05:600c:4fcc:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-496c643b124mr46776785e9.9.1785271656377;
        Tue, 28 Jul 2026 13:47:36 -0700 (PDT)
Received: from archtop.localdomain (92-242-249-25.broadband.mtnet.hr. [92.242.249.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b27435sm1709418f8f.35.2026.07.28.13.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:47:35 -0700 (PDT)
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
Subject: [PATCH v2] mm/khugepaged: replace mutex_lock/mutex_unlock usage with guard macro
Date: Tue, 28 Jul 2026 22:46:37 +0200
Message-ID: <20260728204636.20998-2-jakovnovak30@gmail.com>
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
---
v2:
  - Added #include <linux/cleanup.h> to the includes at the top of the file
  - Moved err declaration to the scope where it's used in
    start_stop_khugepaged
  - Made default case return 0 instead of err in start_stop_khugepaged

 mm/khugepaged.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 617bca76db49..7890bd3e2a9d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -23,6 +23,7 @@
 #include <linux/ksm.h>
 #include <linux/pgalloc.h>
 #include <linux/backing-dev.h>
+#include <linux/cleanup.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -3111,18 +3112,17 @@ void set_recommended_min_free_kbytes(void)
 
 int start_stop_khugepaged(void)
 {
-	int err = 0;
-
-	mutex_lock(&khugepaged_mutex);
+	guard(mutex)(&khugepaged_mutex);
 	if (hugepage_enabled()) {
 		if (!khugepaged_thread)
 			khugepaged_thread = kthread_run(khugepaged, NULL,
 							"khugepaged");
 		if (IS_ERR(khugepaged_thread)) {
+			int err;
 			pr_err("khugepaged: kthread_run(khugepaged) failed\n");
 			err = PTR_ERR(khugepaged_thread);
 			khugepaged_thread = NULL;
-			goto fail;
+			return err;
 		}
 
 		if (!list_empty(&khugepaged_scan.mm_head))
@@ -3132,17 +3132,14 @@ int start_stop_khugepaged(void)
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

