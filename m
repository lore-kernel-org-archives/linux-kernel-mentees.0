Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AC5473E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 05:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720674803; cv=none; b=gGHZJF9FUZqCIHqYB+poLDt0aoPqcuzh8ctxCjcJbd/1VmFqPZ4Q12hvmtsqiAS1ZJC1nEn8Fxl2y8TW25YiHQ7MfSCTTrAD0fKIMsFh0VR9Fh690Z+9IMdOFrSyuiIHvrEMhhjpYVvGSdFLdV7WnDGVln9zGAFEiQi2nSJ1Bw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720674803; c=relaxed/simple;
	bh=3ICe51SaAt5djViV4CNOeZvsuOCXxxCiY5DHVoQXx74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oqpNXLXduF26QX5GBBKPg5+46mSgsFVxecIsm0b9fgTdHvhJu30z0Q5gjhWBbM7tgeei87SHlDCbM41A9HUIonMfI6O44/2X0wwImfUmJFjNm+cJ9PxgSTIAkgV/V65kXUBmJ9Mm3qfxjwXLnbAkMFm4HmOeSpNNaIEeE70HcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Ht63rf; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Ht63rf"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CDF83F2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 05:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMqYP02qjN_y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 05:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AC5E83F28
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC5E83F28
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d1Ht63rf
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2AC5E83F28
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 05:13:20 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6519528f44fso4497577b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 22:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720674799; x=1721279599; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQXtYB9XCir9GCdKuowEuKTyQp208kpzJxxFmEuVXk4=;
        b=d1Ht63rflmbxuetw6fPyERdlXeToFatCxeaRJbn6NDDjc2UF9xbIoox2FHaVbBQ1uy
         gUMALA4qJZs1cEn4WiFIh6oUxFDl69uGbQGqE1lIHJs+2C+v5lVLE8fx1D++cFaOF9mA
         ysLtLvJPJZUi+V+Y2ybrGmgzHmp6nOKL4stGmiXi5tVfk+EaKBvvCOCi6Osu/fxXH6FU
         Dh8oq7KcTWEnY0ohMPN6V0qdKra+0E5uAPFqiERtgJb4NifEzWwS2rE6I6SHtADSmp+w
         7GBr70XOz8xyyxP7N9hxTCitTxpkn+uwz64mHAu6lItu2Ia+WY267KMyEmM/jyl6tw6i
         451g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720674799; x=1721279599;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQXtYB9XCir9GCdKuowEuKTyQp208kpzJxxFmEuVXk4=;
        b=fnycyeY9BS78Dai96jSXht95RKDVseVN1uCbVqcov9PN8//fnt9x14LBYVvqTmSovJ
         IBv0oDcNo39PD+XF2n21fF0DyfmnwtOJzLsFiW0/fDeVX1Tqqt+X2B7+J+V9pcIdsnZ1
         SWUgIA73H6Jc61ff2d/RAhOPf0ELTmgGkB459eL35edbPeUjPTdyb6h2iXaUPno37Sc8
         cu0ntmo82VQ7bN9fon7sjR9+QcU/0FB5Y16mG4WhFcBNGztDbZqovU/2UK8Agh1YkHpr
         0gYl8qmjleYtxT+z50n6KwL00wMWhIDSjrnhb40Mfwa1q2eU4pp0gGpM11ysknmOvDSj
         F09g==
X-Forwarded-Encrypted: i=1; AJvYcCWmLZWefYkNZkEOChlsykrqx4mXIrjtAbsgWM+AE5gIL2cMHdEfwwEWitZsdiA7EBGIi7rrmNJrzxq1dkWc1zIXwsCmxbRmRZ5B/PBcbbQLtLf3xrplLEiGky9IKxH/
X-Gm-Message-State: AOJu0YzHFdGVQ4RP/y+YUQkkEpLJN8GJNi6qJfCq0erFhTqipzmDviYl
	EUqD0rOnLW2q2JOEEC57XdgVKyiWIp3cJ4on6r5XZIUkoq8MjKHWOZSKNg==
X-Google-Smtp-Source: AGHT+IEyAVKw5Vd18ENIlHU5gmCTPX/H+yQcQCMZso6vu9YM82xH6jarDD3R68xOoUe+H2XjSgqjhA==
X-Received: by 2002:a81:b101:0:b0:62c:fcba:cfeb with SMTP id 00721157ae682-65c0703a2d2mr34072307b3.34.1720674798840;
        Wed, 10 Jul 2024 22:13:18 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4f18ac1sm9812667b3.47.2024.07.10.22.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 22:13:18 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Wed, 10 Jul 2024 22:13:17 -0700
Subject: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-bug12-v1-1-0e5440f9b8d3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOxpj2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MD3aTSdEMj3bTU5LRUk6Qkg5TkJCWg2oKi1LTMCrA50bG1tQDwdHD
 9VwAAAA==
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720674797; l=3183;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=3ICe51SaAt5djViV4CNOeZvsuOCXxxCiY5DHVoQXx74=;
 b=7v20EAV87UFY21GDUltDd4EeyRABLCZfR+Cx3h6CHtW1mZm9ikaQaBEWHqW7Ox4T5/FK+bSVJ
 xDafQfayV5QC0fjJZNKTyya6vp2sAYnNbj6lBbTTsxareJMGLm1ZNUA
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

This patch fixes this warning by acquiring read lock before entering
untrack_pfn() while write lock is not held.

syzbot has tested the proposed patch and the reproducer did not
trigger any issue.

Reported-by: syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=35a4414f6e247f515443
Tested-by: syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following warning in follow_pte():

WARNING: CPU: 3 PID: 5192 at include/linux/rwsem.h:195 rwsem_assert_held include/linux/rwsem.h:195 [inline]
WARNING: CPU: 3 PID: 5192 at include/linux/rwsem.h:195 mmap_assert_locked include/linux/mmap_lock.h:65 [inline]
WARNING: CPU: 3 PID: 5192 at include/linux/rwsem.h:195 follow_pte+0x414/0x4c0 mm/memory.c:5980

This is because we are assuming that mm->mmap_lock should be held when
entering follow_pte(). This is added in commit c5541ba378e3 (mm:
follow_pte() improvements).

However, in the following call stack, we are not acquring the lock:
 follow_phys arch/x86/mm/pat/memtype.c:957 [inline]
 get_pat_info+0xf2/0x510 arch/x86/mm/pat/memtype.c:991
 untrack_pfn+0xf7/0x4d0 arch/x86/mm/pat/memtype.c:1104
 unmap_single_vma+0x1bd/0x2b0 mm/memory.c:1819
 zap_page_range_single+0x326/0x560 mm/memory.c:1920

In zap_page_range_single(), we passed mm_wr_locked as false, as we do
not expect write lock to be held.
In the special case where vma->vm_flags is set as VM_PFNMAP, we are
hitting untrack_pfn() which eventually calls into follow_phys.

This patch fixes this warning by acquiring read lock before entering
untrack_pfn() while write lock is not held. 

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Tested on:

commit:         9d9a2f29 Merge tag 'mm-hotfixes-stable-2024-07-10-13-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13be8021980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3456bae478301dc8
dashboard link: https://syzkaller.appspot.com/bug?extid=35a4414f6e247f515443
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=145e3441980000

Note: testing is done by a robot and is best-effort only.
---
 mm/memory.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index d10e616d7389..75d7959b835b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1815,9 +1815,16 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 	if (vma->vm_file)
 		uprobe_munmap(vma, start, end);
 
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
+	if (unlikely(vma->vm_flags & VM_PFNMAP)) {
+		if (!mm_wr_locked)
+			mmap_read_lock(vma->vm_mm);
+
 		untrack_pfn(vma, 0, 0, mm_wr_locked);
 
+		if (!mm_wr_locked)
+			mmap_read_unlock(vma->vm_mm);
+	}
+
 	if (start != end) {
 		if (unlikely(is_vm_hugetlb_page(vma))) {
 			/*

---
base-commit: 734610514cb0234763cc97ddbd235b7981889445
change-id: 20240710-bug12-fecfe4bb0dcb

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

