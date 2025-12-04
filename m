Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB2A2ED844
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Dec 2025 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872012; cv=none; b=bkzAJj5+fLeOIsdRAw6WuasdNV7A2++kWJ1k8+Hj3INr9go0ccQUSW4SCkfQooOHqboIV2LYFZl6WVXCOMKgd+3CJEqMYh58GMuynUeGNIAwjJpONTbNIKr43A15gKaXrEXT5yVtR6DqXS/Ytjmv1Vld53bE0Hw9VK3Js+R2pPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872012; c=relaxed/simple;
	bh=2n8n/CrRkMQeGaIqTUKOtM84mqt2m1JWgo3BQ7O8D2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WZRJhfADQAU4UnbpmWb5ItFhhz/9UqdKH1jV9ow2WI/cIai3zJ/PeL1qDyMPs9Z29yAzjkLbOXulOZ2wHdNa7rpKaKwe/VBccT81/M+PfGx4pEfPkW/KN42zxy8z7eSd77MnNHj76/Cyw769pJN384j5ggifiv5err/6/5es0yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=B84RTCn/; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="B84RTCn/"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29555b384acso13072985ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Dec 2025 10:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764872007; x=1765476807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJvk/IXEAZzbwVmhdAwefI1fSD0T2f/TxkPdH+E3Fkc=;
        b=B84RTCn/Fg/5Ex3r3uOO5A4N1n+PYpftNh1LVLlro4EgvlZP+/rCDdC/8wEwwH8k4+
         Xh9ybswru4v5upxwGS63dZtfdETz+49mT5ugnJ02uCS5/DdrayXZqvm9Exi4VzFH2XQq
         7J+BdmOxZ8BEWHP99L7eTAsOTTo2ClKLQTOX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872007; x=1765476807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJvk/IXEAZzbwVmhdAwefI1fSD0T2f/TxkPdH+E3Fkc=;
        b=RClYqL0SxvXp/+PCy888NmM0yJya1gsr57YpPuq/tCBQjHE6iHDjJoWssU+CnlIURP
         9I7lvVWF/8eMTFlaOrQC+8XdbC+A906mL/Hb5bhEaQy4qoWr4nuYie5/yBtscVCSQxG5
         0ZULV2b68f8BcCyaIhClSfSWpx+FK+gfSiIG84+UNp7cUjrcuwNDcbj3bCa720hPAZjw
         LfMU2ohgxkE6CUkcpx2euyt/Ol9R0HuF73erNwNLGA1sQMxKRJmHVaeJfqr1vdtrucvb
         O8YkcRXSlj3i0jZUKqvVIJ7jaPq4xU0nJitthruKSOp3qI63EOTPUdQf5k3LrcnC9OeM
         yIsA==
X-Forwarded-Encrypted: i=1; AJvYcCWoxb3X1ckdyGbawLIJp+6NqajV28wdY1XZ0la0TPZBo+nhRMOH20AsSBtYp5iY05zWwbz288Zp4FVis46ixBXsyU3Zag==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb/4Omwvq8dnZM00Ej/vRTlxTwhJSF5e3dg/xnpf/2CUPZ29b1
	sn+HFt3p7ufPKMsggLPhoSKVDdsbNuFdDkz4Xs/83HXKC6a2/Q2+b+NV2HvAbs/H650=
X-Gm-Gg: ASbGncvSGG3YjwncN9Wtl6P91868CjaZnjmLZySB+k39Pwv7N6q+stjCz8/zHg/LdZr
	V6GRrcWcEThjW4rjmvoJAQPchdK+LnUlzA68J0Os4YdLPD5WGB6+3CskEl4Yb/2bgFg35Sfz7Ij
	a2vz0Jd/4kNK8FvcZE7ECThZiuq9+aVAPY1PXog4mmAK5Mqyy98Ngc2AH+qzzpKuiTNA4B5RV5u
	MXNuXX0ptoAPCXpdXPa+RvemiISBmB2+qEsRKwoyW44AED7KSmH05r5GxgCq4t9KW3cF6m2lOVO
	9ibHos9dW0T2Sx3d7adX9qDyXGYm7UDSbJCJljtVsIoGcH9qKq2MIoL0G8PFyN/9qlXnpy865Np
	feEmtrVklab+HQxZNUAA5dnx9xO9kICdb8IN10vp+noovhxmVW/hqCrvWFfx+jU5lGxrFKgHPvz
	rMRIguW3SSfzN81o9mFW8+bPE1hiaerYnLXeotYzg9218UiVZBYlA/8HcgmvFakSkz
X-Google-Smtp-Source: AGHT+IHW9Dzu/UH+wU35yc2U6yxRXsHH+wAiiYWkaNyB2KGKUs8KlgR+i4pk3Vixmtau8Xk1OhNnpA==
X-Received: by 2002:a17:903:245:b0:295:6c26:933b with SMTP id d9443c01a7336-29d682be6a7mr84675015ad.1.1764872006465;
        Thu, 04 Dec 2025 10:13:26 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2409:40c0:1055:766e:b9ed:27c1:5f4a:4f11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99effasm26060155ad.57.2025.12.04.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:13:25 -0800 (PST)
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: axboe@kernel.dk,
	martin.petersen@oracle.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+527a7e48a3d3d315d862@syzkaller.appspotmail.com,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH] block: fix memory leak in __blkdev_issue_zero_pages
Date: Thu,  4 Dec 2025 23:42:59 +0530
Message-Id: <20251204181259.23864-1-ssrane_b23@ee.vjti.ac.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the fatal signal check before bio_alloc() to prevent a memory
leak when BLKDEV_ZERO_KILLABLE is set and a fatal signal is pending.

Previously, the bio was allocated before checking for a fatal signal.
If a signal was pending, the code would break out of the loop without
freeing or chaining the just-allocated bio, causing a memory leak.

This matches the pattern already used in __blkdev_issue_write_zeroes()
where the signal check precedes the allocation.

Fixes: bf86bcdb4012 ("blk-lib: check for kill signal in ioctl BLKZEROOUT")
Reported-by: syzbot+527a7e48a3d3d315d862@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=527a7e48a3d3d315d862
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 block/blk-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 3030a772d3aa..352e3c0f8a7d 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -202,13 +202,13 @@ static void __blkdev_issue_zero_pages(struct block_device *bdev,
 		unsigned int nr_vecs = __blkdev_sectors_to_bio_pages(nr_sects);
 		struct bio *bio;
 
-		bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-
 		if ((flags & BLKDEV_ZERO_KILLABLE) &&
 		    fatal_signal_pending(current))
 			break;
 
+		bio = bio_alloc(bdev, nr_vecs, REQ_OP_WRITE, gfp_mask);
+		bio->bi_iter.bi_sector = sector;
+
 		do {
 			unsigned int len;
 
-- 
2.34.1

