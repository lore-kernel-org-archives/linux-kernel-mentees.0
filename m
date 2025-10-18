Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A72D879C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760819929; cv=none; b=Ab9Fk8qBDYuiWD7mPSGJCza2OXB7B9M75WbwsjNBUaMbM6ZpiT9Lqc5JcXXDMYxkkJlMWn8udqJp1wjRiOMtMtaVRMbKHfAqnD5iHPU9y9PfQ3yukoaE7GEIL1ESNJ3qehECHT2E0m+lenOAMgwqBR2YVntY0VNbxK2l4GXfPwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760819929; c=relaxed/simple;
	bh=gXiDaLZ91cP4YS9lUPTJFUZXlsCNeyjYE1dKNW2Lj2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVT9ujZHgCrbt2a5XI2F95XxH0ele0dbJJmt3XgYnxoF1MoAdNsk/v49846Uzgu/RjfqX60n15vOCec4Uchy7Xq73hq+iYaqBG6Bm+BFRJJfeIoo+J4K2MM9AqYGUR2T9d5kvV07RW0LDu3+kX4ps3htFMCknQ22n2Q9lYOf0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZdcOi3Q; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZdcOi3Q"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9FA60ED2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 20:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BzEUPJ4u3zq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Oct 2025 20:38:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE78E60ECD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE78E60ECD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LZdcOi3Q
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EE78E60ECD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 20:38:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-472cbd003feso20725e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760819924; x=1761424724; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9i40smiRcDxizYgBMawCBNl5T4msgfFadm8b+kPK2g=;
        b=LZdcOi3QUZmWcmUtVBmY8Q9pwYGQtf7AMBPdPZgB6e8cjnQePyl3qDGzWxlpry6YmY
         7iyunlGFjO3GZYjshnVfSxJ9inK+9V18Nf9trqlOLjTX3ldErhGbezX1elCKyBz9+uYB
         dqKYvCA5uLrQ/t5bINruRrty1MSBNYqVqWuqf76BnSoBOD0j2Sok44zQ0tyKOaARnC76
         KMBIrhFQ7dgDNmxkeK3EOoVgiEw4HmQIbvN1zJ9RypZzoPGuycTDjeIDNfrON7d4nSSL
         V6riEAZWTWpwHvXulmSkztwrTRU+pjDotLzFUlNTWS8ngsHPRqBXV5wBMq+fK6VtS/OE
         fo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760819924; x=1761424724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9i40smiRcDxizYgBMawCBNl5T4msgfFadm8b+kPK2g=;
        b=avjH3zOD4vgkVI3VEIQKbj2RdzoHP53FyvqclG2xvTZowTSRaBW+RxI8ZZFTx0kLIN
         ViG88ZSR5mT7XBjNq14VMDJrgbEXhIaNmxjQOTiM6iHcATyBzcTc9ITVg3RheOpbpqOz
         kY9fta5vStZLT1LX4xLVmh3VedSTdZaVihbZxWxa/iZOj7Mh7MKBleDSmyZhRIWc4LBZ
         SSQdthDhP/Oc3m1r1Hy16en2kKzkYjv16BrdW/Pavjb/N1qRw1I3e9idIHTr79UnIfLo
         un0Nj0YtLh3f6dDTbXlQBRRbqMucuhd9409k8h6XyCNe7YQjwShuu/mwr/gkDdjoSxtL
         BTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwYY1SB1pWJnZyZkExf3+XiQsJRqAOkkDLuu/hNJlP3STa3ni/JzsW2z+2w6MJHDR0R4X4hYqAKLZ3iMXWmV9p5E0cvQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxKM34j8QDmFzrf78yzHeBYoDtNbsJEGsGJsnn8mHMg5qWuchv6
	RqPu2I8eQnAZ7tMq7ASEADAtaZJYAu/PDAxyjX9kWtuXHTHW8j9STiXU
X-Gm-Gg: ASbGncuxAcVrLjquCAX1RMgxlR5B5JqjXl1urRJP3EmvHZ4EUHUTZ1g5fAkKz6N69K1
	iFHQHztRYX3oMDVmJBGYV3PqbtpvsFrht/T2qFeGUnfdEDCeYISrSA1MmYVQDM8B6aDDlaPSQ2f
	nggjrBpB7SgDI+pomPgDpBXoyWCWDAi+g/XrEwl+3HrSjq9fsiYzxEaZAW0Ipw/lTyB0Gw/vjtV
	uFDWxfgVEHAGC1amj5vfp6ai6ldEZYrHe7OiTB4w0UzDPQfXtJp6xKkvvke/rUkkAWrYxX6Ejbw
	Gi4EXac6a6mgNi9Bb/BxaDOpUh5c5X5UmHVsh0RSAc13BLXAdEJumABRkzTRH46wFKFj7Lpvi2B
	HnR1/5FfhIC6P85Wn9wEZHOcjhALkqGdy8KtOqFerf2m5+9BztkbO5jKFF+R/SyqE68wpxaI2/Q
	mVKtRDQyPYY8ZxCw4=
X-Google-Smtp-Source: AGHT+IHI0fmt4JmUe22K1u4pN/SrFRoF9/x8jnxN9nc1hal9Xk8KmftD9LhBWGubiIcbdw640e+xFw==
X-Received: by 2002:a05:600c:3149:b0:471:161b:4244 with SMTP id 5b1f17b1804b1-4711792a696mr32181475e9.5.1760819923502;
        Sat, 18 Oct 2025 13:38:43 -0700 (PDT)
Received: from bhk ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm80372765e9.2.2025.10.18.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 13:38:43 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] blk-mq: use struct_size() in kmalloc()
Date: Sat, 18 Oct 2025 22:38:13 +0100
Message-ID: <20251018213831.260055-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change struct size calculation to use struct_size()
to align with new recommended practices[1] which quotes:
"Another common case to avoid is calculating the size of a structure with
a trailing array of others structures, as in:

header = kzalloc(sizeof(*header) + count * sizeof(*header->item),
                 GFP_KERNEL);

Instead, use the helper:

header = kzalloc(struct_size(header, item, count), GFP_KERNEL);"

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 block/blk-mq-sched.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/blk-mq-sched.c b/block/blk-mq-sched.c
index e0bed16485c3..97b69fbe26f6 100644
--- a/block/blk-mq-sched.c
+++ b/block/blk-mq-sched.c
@@ -466,8 +466,7 @@ struct elevator_tags *blk_mq_alloc_sched_tags(struct blk_mq_tag_set *set,
 	else
 		nr_tags = nr_hw_queues;
 
-	et = kmalloc(sizeof(struct elevator_tags) +
-			nr_tags * sizeof(struct blk_mq_tags *), gfp);
+	et = kmalloc(struct_size(et, tags, nr_tags), gfp);
 	if (!et)
 		return NULL;
 
-- 
2.51.1.dirty

