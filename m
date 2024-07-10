Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7F13AD07
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720625610; cv=none; b=KQPepYlJRjNfXWHpcxIyUzKkZ1/+pDGrRwlj53d3+Y1ST7JUJRf65LfCUvNDhae7oJGHdUmcwamCZ8Xq2uhSdQYVsSCkgTmqXfQa+/UBGr261uoMeuLZORU93MYUAGt38tPeZpc53jaMz4JsvW9IeK+GDraS/80KejESfNUjTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720625610; c=relaxed/simple;
	bh=aTVeWmvuai/R1U1FoOT+kwJPiR7ddJ+S95lzMnEtAgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c1y5Y4VykaE9keo5nEiRsQrDm5y/MQ1y2+sLiBNJztgxFCQKTSRnx8JvN4pzLgd9Gn1+7TGxoZcPZqr/9OXkLnDShO8Eeom6IPPWZHke9/J8XXybTSkuGdnjt7bkLuu1Dasrz9eptbc4tfOoQP3FP6FjpOCe4PPDRL1bQNRw7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpE7WkCc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpE7WkCc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0454155C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 15:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JTKvmvXIQIq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jul 2024 15:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EA904156C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA904156C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TpE7WkCc
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5EA904156C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 15:33:27 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-654ce021660so44786777b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jul 2024 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720625606; x=1721230406; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gr5uYzcvQrUbhANpY2co45rv/Wb7vmR13XKq1IXwwI=;
        b=TpE7WkCcMTTk8Njo4KRoqDKm4LeQu+AivUemX6cem4PtQu0/GimmEu3twuM0er5L4z
         MRUpGM9rSaH1sPxM5rKyC5wHnGFVVldvwhihxwhO2w/U7BkM5hx4DRaiToFfTlJEJCnR
         TTgRNd/glH74dcS1lJcPQ9IsCKQJQvH0ZabkpdDJ2HjB/RFb8/XkQ5HG4YgT5SSc6Vd8
         if1KXV7BwMlCe4+sdqQfG+dOtFwdKlsW6nnwMKpyQjQ/C/wadIKBMR0mimzA4N6K+Yif
         TaoSSw75/VsGS1yIHWYSY79DOW1mb1QuHCOq0CSRt/XZCe2B89Rn5zxSrD2uw15mzikd
         bo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720625606; x=1721230406;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gr5uYzcvQrUbhANpY2co45rv/Wb7vmR13XKq1IXwwI=;
        b=wKcJGIBfdIlqD/8zbXvQI72zSDYsF+S2SOC000oF2rr7tb17mtTAjLdoRFOQcc/vMR
         Hify/Fl+eirodjJSFEUdcD1EEqfWobHaIE81DWmrR9F0VK/Ygmu0BgrTSoTP/i7D9iFz
         P1t95bKKxhV02ESF5VDbsZCTMI5zhPQ80Ht2hfZQfDf2Gc40eJuVNzkZdKH3SUuHOx+e
         Znu8jBc/XIYefMLRveAD0llZXSxWnb4xOuR7JSSpXt6f/NWgL3G9VMuq2xJSKdlXUCW0
         r2Tw333HBFCkTxI7llE1E7MuoQqxFrNV15quxb/VqcPyhgjFUzgaQM0cGgO5yjYMQJt+
         jILg==
X-Forwarded-Encrypted: i=1; AJvYcCWkyxNgMEdw1OLvKAcm9T+NRv25wTaADlhOzl40pcgHkTvac/va8bqLYnQ7XH8R0GGG0nc36IaMgBGc9E+MX83l6B3ed5UzVL45WBBqRbGpETCj2bi/aSbQEiaFOetB
X-Gm-Message-State: AOJu0Yya+E3q3i9WgWHZT0hKmF/SQbY1zJWCsK3j6T40EDnQ/icFxMp6
	N/wTKvqZhfXpyZiFQHwm89M2S8rMCFIFkZifmtzzqnsrcaUR6MHD
X-Google-Smtp-Source: AGHT+IEu3Ni5t8+SMTgaHEnlIoC/Vuf6JBd1nltHcz3U4Kd98F2p5GBHknD+xkNMn1UIAlk8SSKFfQ==
X-Received: by 2002:a05:690c:6612:b0:64a:69c2:b6e4 with SMTP id 00721157ae682-658ef34145cmr79626997b3.28.1720625606006;
        Wed, 10 Jul 2024 08:33:26 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4d2a7d1sm7620967b3.31.2024.07.10.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:33:25 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Wed, 10 Jul 2024 08:33:24 -0700
Subject: [PATCH] Fix WARNING: suspicious RCU usage in
 bch2_bucket_ref_update
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-bug10-v1-1-f1f8cf98f7c0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMOpjmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNL3aTSdEMDXbMkY1OTFENL4zQjAyWg2oKi1LTMCrA50bG1tQD9yXo
 mVwAAAA==
To: Kent Overstreet <kent.overstreet@linux.dev>, 
 Brian Foster <bfoster@redhat.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+e74fea078710bbca6f4b@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720625604; l=2446;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=aTVeWmvuai/R1U1FoOT+kwJPiR7ddJ+S95lzMnEtAgA=;
 b=lNEuCBby2LIHOBFQJWiBICH9AZBveXtH9UVkQmYRmAgWXhsoMvc+l6pVvk2oNBW8QcqFuPWJ0
 C6IMhyvlU+bCVZj0CNaulb1njfIn2W+HQzDS5UqsiFh1sRrCnbZesYL
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

When dereference ca->bucket_gens, we are expecting one of the three
locks to be hold if ca->fs is not NULL.

This patch acquires mark_lock before entering __mark_pointer()

Note: testing is done by a robot and is best-effort only.

To: Kent Overstreet <kent.overstreet@linux.dev>
To: Brian Foster <bfoster@redhat.com>
Cc: linux-bcachefs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Cc: syzkaller-bugs@googlegroups.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Reported-by: syzbot+e74fea078710bbca6f4b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e74fea078710bbca6f4b
Tested-by: syzbot+e74fea078710bbca6f4b@syzkaller.appspotmail.com
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following warning:

fs/bcachefs/buckets.h:107 suspicious rcu_dereference_check() usage!

When dereference ca->bucket_gens, we are expecting one of the three
locks to be hold if ca->fs is not NULL.

This patch acquires mark_lock before entering __mark_pointer()

Tested on:

commit:         34afb82a Merge tag '6.10-rc6-smb3-server-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1492e87e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=42a432cfd0e579e0
dashboard link: https://syzkaller.appspot.com/bug?extid=e74fea078710bbca6f4b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e2e87e980000

Note: testing is done by a robot and is best-effort only.
---
 fs/bcachefs/buckets.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/bcachefs/buckets.c b/fs/bcachefs/buckets.c
index 743d57eba760..03147e46dc47 100644
--- a/fs/bcachefs/buckets.c
+++ b/fs/bcachefs/buckets.c
@@ -1033,8 +1033,14 @@ static int bch2_trigger_pointer(struct btree_trans *trans,
 
 	if (flags & BTREE_TRIGGER_transactional) {
 		struct bkey_i_alloc_v4 *a = bch2_trans_start_alloc_update(trans, bucket);
+
+		percpu_down_read(&c->mark_lock);
+
 		ret = PTR_ERR_OR_ZERO(a) ?:
 			__mark_pointer(trans, ca, k, &p.ptr, *sectors, bp.data_type, &a->v);
+
+		percpu_up_read(&c->mark_lock);
+
 		if (ret)
 			goto err;
 

---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240709-bug10-6b354d193f20

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

