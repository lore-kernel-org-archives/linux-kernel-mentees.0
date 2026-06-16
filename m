Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910647CC69
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Jun 2026 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631688; cv=none; b=tG5nYeYLYl1sSMX+gPTnYF+BHy81bkWUxcgdrCM2bwOLgC9GKaUKkKahIJ5o+iw2m/pq7k4Z0RdxBEwR0mxWD8brxxUo2p6HJRT1xoDA4jBJUZflmg2gulctnriJUqSkRhSukGcLxshNUCZ0fMQY59mEpPo7pYysdIEhxROf1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631688; c=relaxed/simple;
	bh=56iPGefvrDIOQ0kYSPHWkBcVy4fG83iGF+E4yp8AZ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HeW+uXPURXKD86s0y/BzuR+OMtjB9wnl1FPUKQSGUoG+snDUbJFiM7tq2y+eZswYTfV6KVERFU2B7TgOrwL1AotDmzVeDpQrgRrSHqjMCIAIJ4jSOgm9+Ut2Wz6Ae0rrsQolAisOmscCiByk4Ug3yoA+JBaWYDXw3zUvBrGLM8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdZIclam; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdZIclam"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3676126f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Jun 2026 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631683; x=1782236483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKy4647HVZtA5TmBvoQR4FjcGycfij8utQ+A9hIT6Tg=;
        b=WdZIclam20jPXh2rPPulk5EEe2qMk3sCA/PzmVjOz8jYUT1sQuXps8qnFG8nuM/PKk
         lG3+YLFV35wF8mMmlmSSOEI7/aeH4mFo+s4ny+qFKw7u/i5ZGKoH0KCRXo5Rc68Oybiz
         tYI5eASO6y3u0V57jxrTpckig7yFVf8rbcomfPRPLm3Zm7fpBgv1KfVNle+mUiSrvo8s
         ta1dZb8o6EDqLWLOLGhSF+h+/7Xc2+Mggx54NP3zd49DvpqxwFhovMi8F8Uj8juxKD+z
         Yzv/jQBiahrSlq/vHlc7Xdn6h8zsZOJIhfBuS8ka6Ji7w1hU2aPeV9PDKRV9vuyZYQKv
         vV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631683; x=1782236483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKy4647HVZtA5TmBvoQR4FjcGycfij8utQ+A9hIT6Tg=;
        b=K/PQZk9fkDIKoCVKTzBBpB4vYaq68O/fc119+agkfNxRUfMwtKKK/NpNdIwbXARfV2
         X1vEJUIPp0y5G6TVRckiZzWtxZlk5MILJbBtFJ04+AM0E1UTQIhs6ScfoKXuwpWup75E
         p/4rMGKpJzfbeKd0k0jHyLJpQR8rWVn34F3cOnhYaV+A5m69NaIaOKgIQG6g508epgKP
         fy5ffrYZIyFwePXTkfOAxvnq6rv9HFNFlwSyucOIJuLD3JpIGrTPh00iagjjh/adoWUr
         ULkJtk5ZhTHyD9ViTcAiV1MbQV4NcA/BNJUMUKi9xM+nFyaXhqHxKDl/LRnmGrttGxJv
         cufA==
X-Forwarded-Encrypted: i=1; AFNElJ9xXm9E6PvQsin58dtlFj4C+rl6Lmg/lIb7GmXy7fCamHZ7H5SD1dtzTa+CtLgWcS7CNsADmWEQW6Jjxnfo5G4eAYu0tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRA6L1epPiFDiFqypRBM+XAdlo3B4NWy1cJR0TT84j46ODwLI3
	l7XbcL4VJZOOTG8Sm98WzkbusKz6yjT8EJ6kgadWFcAHsIyhCgR3e30=
X-Gm-Gg: Acq92OFAf5CBBSsVM12zTyCAO1qA5pPHkIsLSds2CnevA9kgXnjIW+UiCftuwwdiDIU
	qC5RHc9VzUE0zuiMjfx+x1MO36dfRfn7R5ecrszP9Kdb6bFpz5UouSR3brWHYzMJqX63rcma3Sf
	TuetGgXkIURfRvRSSGGque709guAYKjJBa6PivjwMo5JmK3XA+vxS24uphf1aftvBLJmAT5t5SP
	PQ0Gkzqhrwj4DbsjCHN64Rglqd4P44gxukTMBDPlSy5xv/VsFNrsnVlJP9Rg4tQeHuyITrLU02G
	hH+UKt/FhfG2Yeumvespeo0EOawBt9ZcL6mN3WGt8Cr9trbLt4YrL6GbEGiEIt3XEqIl4JN3flg
	XXgk/ykj5tTDBssF6Ztli2rnuj8DRswsZc0HNqp1TaiVYfYlbTxLRfi5hy3wcB1McEH/d4qWMu+
	wAGFkHuWGvilF5XwfZRQEURJ/wsoIr6ravPdtQaqX7i8/1Pwnm+lbVRyAwvFzRMwM0lhZu+Wm/9
	oS5YbYLifpC29KqzrKTJM7q4WFZ4jmtpsOkP8jBwaxy10g71LBP9w==
X-Received: by 2002:a5d:5a02:0:b0:45e:e509:d2fa with SMTP id ffacd0b85a97d-46236275eb2mr616305f8f.3.1781631683244;
        Tue, 16 Jun 2026 10:41:23 -0700 (PDT)
Received: from archtop.localdomain (92-242-249-94.broadband.mtnet.hr. [92.242.249.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d70sm46775690f8f.19.2026.06.16.10.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:41:22 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Hsin-Wei Hung <hsinweih@uci.edu>,
	Florian Lehner <dev@der-flo.net>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH 5.15.y] mm: Fix copy_from_user_nofault().
Date: Tue, 16 Jun 2026 19:40:10 +0200
Message-ID: <20260616174009.9906-2-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

[ Upstream commit d319f344561de23e810515d109c7278919bff7b0 ]

There are several issues with copy_from_user_nofault():

- access_ok() is designed for user context only and for that reason
it has WARN_ON_IN_IRQ() which triggers when bpf, kprobe, eprobe
and perf on ppc are calling it from irq.

- it's missing nmi_uaccess_okay() which is a nop on all architectures
except x86 where it's required.
The comment in arch/x86/mm/tlb.c explains the details why it's necessary.
Calling copy_from_user_nofault() from bpf, [ke]probe without this check is not safe.

- __copy_from_user_inatomic() under CONFIG_HARDENED_USERCOPY is calling
check_object_size()->__check_object_size()->check_heap_object()->find_vmap_area()->spin_lock()
which is not safe to do from bpf, [ke]probe and perf due to potential deadlock.

Fix all three issues. At the end the copy_from_user_nofault() becomes
equivalent to copy_from_user_nmi() from safety point of view with
a difference in the return value.

Reported-by: Hsin-Wei Hung <hsinweih@uci.edu>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Florian Lehner <dev@der-flo.net>
Tested-by: Hsin-Wei Hung <hsinweih@uci.edu>
Tested-by: Florian Lehner <dev@der-flo.net>
Link: https://lore.kernel.org/r/20230410174345.4376-2-dev@der-flo.net
[ merge conflicts 

  copy_from_user_nofault: caused by force_uaccess_begin and
  force_uaccess_end functions. moved the code around to call those
  functions in the same way after the additional checks.

  check_heap_object: completely different implementation in 5.15.y.
  removed any changes from this commit as the current implementation
  doesn't call the same lock which caused problems. ]
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
Note: I have checked all syzbot issues linked with this backport and
verified that they work locally (the ones with repros) and on the
syzbot servers and I ran KUnit tests to make sure this doesn't break anything.
This is my first time sending a patch to the stable repo, so I am a bit
unsure if there is more to be done for testing, apart from inspecting the
code and running those mentioned tests.

 mm/maccess.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/mm/maccess.c b/mm/maccess.c
index ded4bfaba7f3..2b186ce822c9 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -5,6 +5,7 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
+#include <asm/tlb.h>
 
 bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
 		size_t size)
@@ -221,13 +222,18 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 long copy_from_user_nofault(void *dst, const void __user *src, size_t size)
 {
 	long ret = -EFAULT;
-	mm_segment_t old_fs = force_uaccess_begin();
+	mm_segment_t old_fs;
 
-	if (access_ok(src, size)) {
-		pagefault_disable();
-		ret = __copy_from_user_inatomic(dst, src, size);
-		pagefault_enable();
-	}
+	if (!__access_ok(src, size))
+		return ret;
+
+	if (!nmi_uaccess_okay())
+		return ret;
+
+	old_fs = force_uaccess_begin();
+	pagefault_disable();
+	ret = __copy_from_user_inatomic(dst, src, size);
+	pagefault_enable();
 	force_uaccess_end(old_fs);
 
 	if (ret)
-- 
2.54.0

