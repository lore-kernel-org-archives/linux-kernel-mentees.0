Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75151F1932
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Sep 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314899; cv=none; b=IqMcoaG6haNWo4c7WXNxHK6l2OVgE30hso6hxnF8QKHM/Xx9WGl71blZ8oiI+40BPglXnchSPSkVIOal3DdLDBM9J5JQ3TG7HqyCnYkUZWUwikQaHqxShdnVlbmNE96gUuXhf6lbqjVcAjfnMfo3BqGTqjNgRMmneCm0HEaFHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314899; c=relaxed/simple;
	bh=D4Ay7cjqW/QNpararKO4Lw+hA5bmuFK11O8/2Rv/vhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFafQ6oK9J3K5mw+eITJ+R+7jhey7y4YZu8Ggw6bnjo4kllf9wvL43uXwlJr0hviLoAJsg3nEYQlDrHV3MEPYYT/Ov62weA1GLM/qbHh/7CMZYhcZpVJfaFE+ge+MlyLM7lDFKgRPTcDDHN7cdkUtDC7o7kJmEaGysRhURZs/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vw/GbZoA; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vw/GbZoA"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b523af71683so135069a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 08 Sep 2025 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757314897; x=1757919697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbaEmYlV3AOzGtE83K4L4+Dz35fmJjUox3DLoNP1Lvk=;
        b=Vw/GbZoAPcq3wNYRjKyH+o79AYjMUjYlomn6I0GXN909iU/segePh3al8J89u3UtxB
         W04c1wc/WDGITbmqy3pCgveuAdlr0Nh+GV0o6dl8eij7hd/IOuJ1gk4fGB65aJhSYt21
         rYafXxwH8LTNfbw0tiWspJ7YJPbcP0sN7FXBl8zvgsFFA65lBBaCZ2vFvYggCCNthtLQ
         dPHok7exI264a9Hn8rq4AZOG8AQs4kYnv8Cz1WCALbe0qOgr+2jqkeibU0r4vRvbeYhi
         LlH6shgUqjvnNNULYlf/BQyuET/O6QXFwB7j29Sc+iuFd0bMuvNHtZJnGu74uKI6oNL4
         atzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757314897; x=1757919697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbaEmYlV3AOzGtE83K4L4+Dz35fmJjUox3DLoNP1Lvk=;
        b=Hu9H7XIncF/aHBTXDFKIT/AB7a8VXBriThiEDCL3k6dPkDJG1/n3fUKHqcvxlxMCIx
         g5hi10xtshrhIhhLN/1z4LIjH1IbTjFy87DX/v+sv4ahF77Id53f7QtTp5pYMoWTVzAN
         FRl8UHdIVGlm23kD0YPZyRM8RBXTWnukc54Ne3s+C5RzFoWnOYO6NydR15tcL+EWZwVO
         MGlNbqe3R7sBeYRD+Kf3D0zHdLatyJtdfu50pv/alVXAfmkXgU4mPvsY9ch2tnWIcXXF
         Kp0qzRMgONTapyS9lx9bMZasAy1o4oxh60OJ1WTaeixkdDLOHPFA8vrUAO6aYUrcg1n/
         9WQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIjDKQKv9VVZGiaE1CeK9GGtHJr+Q7rHwmfJeikqC5llXDKXzxbvR5ckKNHW6Ac5LTcWfDVZvas0+MBFhB4s4aZi+Cag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGbzJXHhM/hjGUl3RkkQVDAbRFQorqHlBh6BKaZaTs/GZLXmaq
	HV2V76p/2Dpk3TcTYb7AhYtpQJJp0G5iTmfyoMrSl0WH1lKAMOO0ndAX
X-Gm-Gg: ASbGnctO61XtVqiH+1+a/MPwZRHz5kPB+kjGvHBmQfkCb8gnldWxRRox5VmPXkvG7WW
	DLxcSoaF3GbjS7C0dmVSvYqN9hWdVgT//CS8O0SZXBljLVBaUA3rpgHtYo5djCqkZc3aNqEsd7Q
	SCFc8JVwMXJEmvYjJ9wuqN0QoxH3neUg35hpUZ4zU9qfg7FpEU6UdI6Pvrw26gdaClpxjHJGP66
	vhDEAnIlWfL4GhTazFpf3hsREXKQVMxFZu/aL5NOM+rIUm/roX9JcF0IayWy2w8FLsKdt9SEO9f
	jw5UZY+b1qcVAaONw7jSyYR5Jg0sGTj1CpT+mNu5HODpL9c1dpdE2pzTgxQ7QLe9rgGqXgUC9Pz
	aDfR+QJQjevJ53o0dwWS/P/4v2T6V2N4jAns+M8rGDV7JuZaZC/TZ0bsL+w==
X-Google-Smtp-Source: AGHT+IGc7TXpRM7rIBs/KpzQNu08oMaqlYYUm4E8f4HgHjSp2FZ4vFD+byutu6dJUmsCyMjNMiob/Q==
X-Received: by 2002:a17:90b:2d81:b0:32c:7693:1155 with SMTP id 98e67ed59e1d1-32d43f2f29amr8015933a91.1.1757314896992;
        Mon, 08 Sep 2025 00:01:36 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32d89f32ebfsm1705683a91.0.2025.09.08.00.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:01:36 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
Date: Mon,  8 Sep 2025 12:31:24 +0530
Message-ID: <20250908070124.2647038-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
terminator after the copy. Also update the return value to reflect the
extra byte written for the terminator. This aligns with current kernel
best practices as strncpy is deprecated for such use, as explained in
Documentation/process/deprecated.rst.

No functional change, only cleanup for consistency.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes in v1:
- Update return value to match the extra NUL written.
Link to v1: https://lore.kernel.org/all/mafs0ms7bvcd2.fsf@kernel.org/T/#t
---
 drivers/mtd/sm_ftl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index d28d4f1790f5..3c5d6d0c728f 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,8 +44,9 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
-	return sm_attr->len;
+	memcpy(buf, sm_attr->data, sm_attr->len);
+	buf[sm_attr->len] = '\0';
+	return sm_attr->len + 1;
 }
 
 
-- 
2.43.0

