Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA84F0524
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369696; cv=none; b=Gnh4hMnowo0UANqwyUeZr8iXJxBXcR+jyX34EsEUPW1XUrWDNI/Z7AnMYVK/WKO4XKjfUQNrOBRwC4SmEzGJhWk6n6YFonMvOPCiwdsF53VkfL5pUiqU4g17vfHkl8POM0CLzCh273nKQRA2H80j/TtpcxG/ptn4PexOGyoRFkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369696; c=relaxed/simple;
	bh=OiejDtG9zLMOh2+zq3oT2ujqhwJM/kV3ns0Lm8hZGDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nqPLfZAo1V+Ex3s3MVVS+lnPgRymK3r/jsKCRXrvr9eiX7XkdtPtQxmRk94fIjVhTzPBMA7b81jfP5CKpPwuFUAbdBrikgrQ9Sx4EnDGassCUWst0ASE2S/bN69pYdSofnCPHTLD+TXg1MEcQCeUY0Ln07+VP/pVVSQZ3qjZuVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtM/DwBl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtM/DwBl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1050911f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369693; x=1790974493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkJN4xCRSU+PqlIsdfJnZSqQwzMkeBYjwbAco/SlXBw=;
        b=QtM/DwBl0FDdYMcePCnXDQ6hud7V7XMI9VNGTZy7ZDF5B9zfQ2tYu/orvuqIRqQaU7
         gAwxmPru1/HHOlVB9JcoJD/c+vfTy4LalNdkVX8CB2KPxBav8ieqP3AYTc6eZymkXvT5
         rSrD666O5U9n5B3bMy0SYm5PPENK62LVCdRq/l54g9zU08T6cIZzIBXoaSrYcllbwl0n
         WIJ0aL4fJMVOnnHS6C1f/gFt05Ud6SedxH7JWcyBlg2iVlYsyJoFWKzMgTFcc/jFRRLB
         5PqklOswxrO6HinygRn6dSCqgbuQAbrAzL5FVoWBW0bv6XE+8V2GM9pNKdzNPE0os7Mx
         eFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369693; x=1790974493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkJN4xCRSU+PqlIsdfJnZSqQwzMkeBYjwbAco/SlXBw=;
        b=dtkP4AG1aOttNuwm9UieYtDsiPliW7yUz1Z4IjpepeMjyV8gOw2FdbpyCANfxD3zWO
         QYvRH5BAHJLmZFjKQmuAOC3oznPyYqOcZMXQG6s7KItnsmMgp2vn0Xm9XEbcu3nFSLHH
         7/D5fGzfBLhMePGtWF1suQ7lfi+IfQIngZSz2COAAX6u8JOiQXSEe8IxA70YI+QpiDUz
         UCpdCyBh0AZ+FepfNLhnrGFyBd/aeW8quq08+zEfsgxS9rCSuzXyxxk81uAsxBAW0wUv
         ZIWjEBNt07sC/bZFgs+7mhAd6Zxz81gU6qGAkC9aKAABkF9VasurNZVtl0n/T0vfoVUn
         7jbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRLAVJm7108JZkTQLdk6rX8FHV5mPfjCWjp5cPhXvQfMyOcG/82jAVEb0V4tFP5VvfkH1zOe2CTqGCJ9mPtTjDHUYjRw==@lists.linux.dev
X-Gm-Message-State: AFuF++l/3ybIrJizEtzHh442HE31DbnjSvmvOngQ4oihfYoHSOrYgJDO
	PxfSwV1g5Y1c4XWfn8DMVooIXdTX9/KLS1j4sjU34Jdq9Slf1nrQJfJw
X-Gm-Gg: AYBFou3MUjooqF78Gnz0NeZOsyQBdkBSMHEQ5NgDmEFJD5KlUOqgB8NddcqnCQAMXdA
	J/i1jOrqDhWkuplW2wttXhcxqQ/kzAqkvywLmqYBgdw2YijokfuQEcVdT8P/myJjGZv84T8xCqz
	Y/IznHpxBH/aYNlKPN9ilv3vxLE92Yh4IGNbqw9foYj0W3b35YjHstWmG339ZQfqHk8XQcJZ6gI
	bv/ZTsNx22nOM4Bhs23ldtugNJ62s8ZYLKrn49nzs1YlGweSI2NEWHs58ysVNwx+PCBAqBjiJgY
	Eko73tJOZ5WQoxPo227hlM6ARpbCiuXMngnwGXMifPSuhDKVORYBzQVzL7SzhAi2+eO35ALWBQI
	KyxauwSxL4mog/hJPOCNjmlaWBS0Q8PXINPa4bD0/yM/5rId8zM4jjPeBTDb9XJUp4BgHcaMLHF
	vxmv3g+6QmJcXMXmohqfvVODHR8Ct3031T7txCZqNQyN6awOpkUvQBX9jfryNzytXyH4dqSsH1X
	hJH+10yOyIj69FE6UvjgM4Vza3biCc7oT6CV1LFNIazUpWy9nYN1gbtcnTrU+RJUG9Y
X-Received: by 2002:a05:6000:2302:b0:487:27f9:835 with SMTP id ffacd0b85a97d-4887170d4f6mr13089116f8f.42.1790369692647;
        Fri, 25 Sep 2026 13:54:52 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm9790136f8f.30.2026.09.25.13.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:54:52 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+442828bb356b10813a47@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	linux-mm@kvack.org
Subject: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in pcpu_get_vm_areas()
Date: Fri, 25 Sep 2026 21:54:49 +0100
Message-Id: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pcpu_get_vm_areas() has to split a free vmap_area in the middle
(NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
per-cpu ne_fit_preload_node if one is there, and otherwise falls back
to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
pcpu_get_vm_areas() never preloads, and a single call can do more than
one such split: on a NUMA system it places one area per node group, so
the first split consumes the preloaded object and the next one depends
on the GFP_NOWAIT allocation.

That failure is expected and already handled: the recovery path returns
the areas clipped so far to the free tree, purges lazily freed areas and
retries. But the error is checked with WARN_ON_ONCE(), so a transient
allocation failure under memory pressure or fault injection triggers a
kernel warning, and a panic with panic_on_warn. syzbot hit this on a
two-node VM while creating a per-cpu BPF array map.

Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
a bug, and take the recovery path either way. This matches what commit
b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
for the other va_clip() caller.

Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 mm/vmalloc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..24c7d0a5472e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
 		ret = va_clip(&free_vmap_area_root,
 			&free_vmap_area_list, va, start, size);
-		if (WARN_ON_ONCE(unlikely(ret)))
-			/* It is a BUG(), but trigger recovery instead. */
+		if (unlikely(ret)) {
+			/*
+			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
+			 * Anything else is a BUG(), but trigger recovery instead.
+			 */
+			WARN_ON_ONCE(ret != -ENOMEM);
 			goto recovery;
+		}
 
 		/* Allocated area. */
 		va = vas[area];
-- 
2.34.1

