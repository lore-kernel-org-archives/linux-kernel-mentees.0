Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB5176236
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719333740; cv=none; b=BqAALKMxMOwhrriZ01SCYyb3CzRpevbjLe/JsORVhNkxFB559gnjyqZaXGYKSB4PaJG/Ojr4qDlKa49plQUM6VxJlHP34lQl75Q275paEocbaAV/sNmB5nOafU4/vGkHK/jexjT3XyK1pq8bL27jenPuilLhCr/wN+klKxO+Zdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719333740; c=relaxed/simple;
	bh=FyiCzW6XIb2gfdf8H6OEDN9PU6g+1OS/36+lF7aFa08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZyHiwKGqdjW8nyrTXHSii+9m7+rLYzTtW2G77/Zpg2tbLYy+pp1DQ8+TV71K8eSPVh0Il57djtm+r1PbqlAbdBKXFqHKnHGPgoYa46IHBNUAkcyxyP2QLkE67sd5kqViihlvRLQ3zU2ONH54Jum9aJWBj593Pl1hT8oyaKjt8as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dijwz0xO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dijwz0xO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDC061060
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 16:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fV5sUZeV7DWn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jun 2024 16:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E69F606C9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E69F606C9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dijwz0xO
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E69F606C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 16:42:17 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6454660553eso22267757b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719333737; x=1719938537; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJYda0ZTUkWw1q6d9Psi0GAgd/bxpCi7wNXv0O0kijw=;
        b=dijwz0xOjm0UaWkMBy2s/I+lTSanr4fwod19plbWZi3pgE7hEe39/g4ECwAt9ja/AW
         k5um8zlpvEdmVZTcRnJiISkYS5Ox8QQsQAh2XieAXAHQoiJG0KMTp7DvNDz1dhdlbyA6
         dObEZR7HsmHgbvSS4oVeUTUJdA0V8Gb9o4ZnjN37uI3Wfr7jix2hVHcRD1xf+euEKHT/
         j2OGOE8F3WJLfGZeBX/5uE+QljQ7R6aJIyRDgEueuexHxbvtJuoII/9x1ICt/yMTtpBk
         yZAnOhCvI2qF/NxWK0565Re7SlOtfVVnpMCHz+c7Sehod+51fnK+Pj0rBKYspAKvRvWo
         p0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719333737; x=1719938537;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJYda0ZTUkWw1q6d9Psi0GAgd/bxpCi7wNXv0O0kijw=;
        b=RycybZVpNjnkw3esJDGGov7L3QZCFEPMYrVxzOrb/tXu2NkYDjFh2Xr/OcUwEfbI++
         tPMHLUW8EH6Fxt4KAAWax/OByim3dSrQ471B5P5uJoKuJxJgwoY5ytFNhMNbK/SkM53k
         Lptk7kv4l9JYcmLZJcmNhm7w3rg1iXd2S4wmRtyMFr25HLMbYUBegviIAWpBeMuSPOyk
         dxEhyBSH/mYB5Hz2aPGqg5BZFCtgxWcorZ4OuchEqtUcp1mMRuG3KjFWtnXNPzx4+jHe
         9KMzxnAouwTWar1/9ZTnFZkfFWnKZRSBcWjM5bB8Nmue/Vgeqzrh+vqv8L3lnE1ENoko
         4Ltw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ifqjYMkOnYi20oRswkh2B7B/s4qVvpqpDWjCprpr1nIr51ngm+prJOT5j6Kc7rXo5diB2+MkV9q6LlXvIaYh+8p7rEf1W6ou3S7MQNIEBBRCx8U0ggQP59kFOZH/
X-Gm-Message-State: AOJu0YwaMo1hgFGsgfzCo+KIlVwrAVGZjM8UGw1i7nbm5LqhRjMxUJAD
	ZSujfanrDNMrWF2rAqUguNRs31ZCJr1fznPJlgrXZIXgR9e1jTdh
X-Google-Smtp-Source: AGHT+IHmv54640JtdzVgVBjNMW3oCfT6iQTauLr2MlR8ij38PaWAvmUXPYq6zM09d8NDYmlZcgoGLQ==
X-Received: by 2002:a05:690c:ed2:b0:643:9333:9836 with SMTP id 00721157ae682-64393339b44mr102451277b3.38.1719333736635;
        Tue, 25 Jun 2024 09:42:16 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14c265f7sm35548717b3.81.2024.06.25.09.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:42:16 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 25 Jun 2024 09:42:05 -0700
Subject: [PATCH] jfs: Fix shift-out-of-bounds in dbDiscardAG
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-bug0-v1-1-fcee34ac00a7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFzzemYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNT3aTSdANdQ8NUC0uDNBMTy8Q0JaDSgqLUtMwKsDHRsbW1AOG2xBt
 WAAAA
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com, skhan@linuxfoundation.org, 
 peili.dev@gmail.com, syzbot+61be3359d2ee3467e7e4@syzkaller.appspotmail.com
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719333735; l=1360;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=FyiCzW6XIb2gfdf8H6OEDN9PU6g+1OS/36+lF7aFa08=;
 b=RHhyssi0fbYov9jrA3a91QuJwBYuK5ttGQw7Q+tUA71JkjGPbQqu+8lbVfowuUcM9Av9AQw13
 NAh7gfVjZdTBfHeo1WTFpunsWiqiIUhGhod/tNPKklDpQROSelUGrG0
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

When searching for the next smaller log2 block, BLKSTOL2() returned 0,
causing shift exponent -1 to be negative.

This patch fixes the issue by exiting the loop directly when negative
shift is found.

Reported-by: syzbot+61be3359d2ee3467e7e4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=61be3359d2ee3467e7e4
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reported the following error:
UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:1629:18
shift exponent -1 is negative

If BLKSTOL2() returned 0, the shift exponent will be -1.

The solution is to check the exponent and if it is smaller than 0,
exit the loop directly.
---
 fs/jfs/jfs_dmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index cb3cda1390ad..5713994328cb 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1626,6 +1626,8 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
 		} else if (rc == -ENOSPC) {
 			/* search for next smaller log2 block */
 			l2nb = BLKSTOL2(nblocks) - 1;
+			if (unlikely(l2nb < 0))
+				break;
 			nblocks = 1LL << l2nb;
 		} else {
 			/* Trim any already allocated blocks */

---
base-commit: 2ccbdf43d5e758f8493a95252073cf9078a5fea5
change-id: 20240625-bug0-11e890f449af

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

