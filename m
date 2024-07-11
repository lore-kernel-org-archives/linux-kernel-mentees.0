Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1516CD1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720715555; cv=none; b=gYZC0UML619j5CicffOXAwCTGxDUtClCbnyzvczNa9j3K1xShDxhWIT0D0akQ6cdpHF9CV4ENn3qdEwmfuA+19nDdwHFt5Y6JJlJuaIEGvcb6QkUSPGCK5JC+fbYY7LhqyGloc/yuTlT1XHe350tLYqDnOufwrSR6buK+jWsqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720715555; c=relaxed/simple;
	bh=26qL51uoahcNHPT1l9WKbg1Ih95sXbEPmhFJ69O7LU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hcGW9rSL3BFnEgnh+gJyXOVfRablzVnh/slnNoF7vq+rAhmIAJHP/z3wfiSk1yfIRyJQaH/ZXoPrRwT1+IDtn5twHEtAbHZhqLgytYuN5zs66TXzCwGZP97YCwb17pgDNdIb0AegZtJlBjDKBQ6NfJpCMtZhHDkLDVbdnKK9kzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AL/8Pgos; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AL/8Pgos"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26C260752
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 16:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrYJcNkzoNZf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 16:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1DD56064E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1DD56064E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AL/8Pgos
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E1DD56064E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 16:32:32 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ca489b4146so878518a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720715552; x=1721320352; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knRYc6x1wBrdcZgoYzGzvvoqSpAROkSsvaUc1PqkKTs=;
        b=AL/8Pgos6BS8RhcSpHGVeRcV+Fr/Ik9b1f4edcd83hC2BXtW5a5q2d7vCWA3EP9urA
         ym/uPX/wYmsyKgsgD3WMiEX2QZbqQvKu8AZcV3pUwE+vWdCjlqEbACfFDRu4Ft5ADMml
         kvBbs51oOAGqa7Ew6VaqpcqUe6pgXuGzx6gZDOVC4qyV0YQp0nkCNWOyKLq8YBPyshMp
         sBIImhkHWjUKyyswMDXr85+idmF/hfbtFBbtx8Fhhg4VtmuRPdoiQo3d31wXS3Y6ksnE
         Vjn6mlYggPthhrtxttVQSDxBrp8DY2kCKJjLCCylQiSzbSRfHT7nyYqJ5TzbCGQaq1XG
         lbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720715552; x=1721320352;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knRYc6x1wBrdcZgoYzGzvvoqSpAROkSsvaUc1PqkKTs=;
        b=oQY/U76QsEMngOGP0uHXuhUu2TyZxkldjQY8/s6LQr3gSkLwJ2MLbixQuecodxA2QI
         c1x1Q4VNXnYWVk363bdXWh3WRvPXmw46uvJ8jfWrNsAUHkTD1mD5fs6ddA0xW/N88o8z
         UCtBcmCKpsoXKRAIG5qcfpCbh7hJ4vK0vB7QBq8yu+VH+Q9D8pfb3h2BxFsxdwruj2Wh
         M2QBv7HfjFK4BJL96wDZT5AayYzQYzisXjlbS7zfjt6AuvZ18Gy4cisCfeGOjzPlFgSs
         EF9wdrJBRF6jeclLHXi86l+YPJJDOg5w8gMr1uldPvi0HsRWVOJdZbV8doFKtx50Du+B
         fFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA1qR6/6fKsrpiKklyBJsvrENBpUflvgBLX4uos7b/r3ycJXKqH6bRtdy+LHaWrEGLyOXeOpnlhDXIOzK+lONyQIeIUKEqizjtTBfz8LqYKQ36r7o9ssCMTNXPs/XS
X-Gm-Message-State: AOJu0YyQQQQLU2DnpMaiIZviy3kI+OtXb9UQyOgkAmuSsi0lmYO59bmr
	8qAmdm9RBnRLmnioAZo4cLXsYGHdCy9cnO5Ucnp1RCEhYeqJsuJw
X-Google-Smtp-Source: AGHT+IFu3WuoWkraVD3aRrqr4yqWat1WaGyvP6d5wxA4VielGLmxMh0DYuQBeX1wCHjB5GPgPyO0lg==
X-Received: by 2002:a17:90b:1090:b0:2c9:7e98:a4b8 with SMTP id 98e67ed59e1d1-2ca35c71f09mr6707140a91.24.1720715552086;
        Thu, 11 Jul 2024 09:32:32 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca352bfeb9sm5826887a91.39.2024.07.11.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:32:31 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Thu, 11 Jul 2024 09:32:30 -0700
Subject: [PATCH] mm: Ignore data-race in __swap_writepage
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-bug13-v1-1-cea2b8ae8d76@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB0JkGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0ND3aTSdENjXTNjk7Q0E0OLFEMzAyWg2oKi1LTMCrA50bG1tQB8N92
 xVwAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+da25887cc13da6bf3b8c@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720715551; l=2466;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=26qL51uoahcNHPT1l9WKbg1Ih95sXbEPmhFJ69O7LU0=;
 b=mqg3Pk5oOKGaaZAmXmQ6yjUdtca4/MspG+hW0X7NiQM7UtzPLAcZL8qPv13l7iGKmtN63j+dY
 Vu5oBst0sshAVUgF9pd4oT32V2irgSgxku0uFky7yP2AYfJAfqsRB9z
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Syzbot reported a possible data race:

BUG: KCSAN: data-race in __swap_writepage / scan_swap_map_slots

read-write to 0xffff888102fca610 of 8 bytes by task 7106 on cpu 1.
read to 0xffff888102fca610 of 8 bytes by task 7080 on cpu 0.

While we are in __swap_writepage to read sis->flags, scan_swap_map_slots
is trying to update it with SWP_SCANNING.

value changed: 0x0000000000008083 -> 0x0000000000004083.

While this can be updated non-atomicially, this won't affect
SWP_SYNCHRONOUS_IO, so we consider this data-race safe.

This is possibly introduced by commit 3222d8c2a7f8 ("block: remove
->rw_page"), where this if branch is introduced.

Reported-by: syzbot+da25887cc13da6bf3b8c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=da25887cc13da6bf3b8c
Fixes: 3222d8c2a7f8 ("block: remove ->rw_page")
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported a possible data race:

BUG: KCSAN: data-race in __swap_writepage / scan_swap_map_slots

read-write to 0xffff888102fca610 of 8 bytes by task 7106 on cpu 1.
read to 0xffff888102fca610 of 8 bytes by task 7080 on cpu 0.

While we are in __swap_writepage to read sis->flags, scan_swap_map_slots
is trying to update it with SWP_SCANNING.

value changed: 0x0000000000008083 -> 0x0000000000004083.

While this can be updated non-atomicially, this won't affect
SWP_SYNCHRONOUS_IO, so we consider this data-race safe.

This is possibly introduced by commit 3222d8c2a7f8 ("block: remove
->rw_page"), where this if branch is introduced.
---
 mm/page_io.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 0a150c240bf4..15be678259a5 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -384,7 +384,12 @@ void __swap_writepage(struct folio *folio, struct writeback_control *wbc)
 	 */
 	if (data_race(sis->flags & SWP_FS_OPS))
 		swap_writepage_fs(folio, wbc);
-	else if (sis->flags & SWP_SYNCHRONOUS_IO)
+	/*
+	 * ->flags can be updated non-atomicially (scan_swap_map_slots),
+	 * but that will never affect SWP_SYNCHRONOUS_IO, so the data_race
+	 * is safe.
+	 */
+	else if (data_race(sis->flags & SWP_SYNCHRONOUS_IO))
 		swap_writepage_bdev_sync(folio, wbc, sis);
 	else
 		swap_writepage_bdev_async(folio, wbc, sis);

---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240711-bug13-634ff418d160

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

