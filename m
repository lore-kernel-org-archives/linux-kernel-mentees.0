Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53217201035
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739396107; cv=none; b=NIq1y9vXH/bBOmE1Nq0dfr1EE/Jsz+fsD1iXe90QYqY3GW5SyDPfsGBNjzBdUQv7NN5f9j1nrAqrQG/xLV+5sqZxbPOqQdVLvcwGmh9N3lIQ04cJbddk6xxzXd7mPugqpw2xL+J89fObZrsPoNXll4d/xuE7hEJ/CexQrwWUzOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739396107; c=relaxed/simple;
	bh=PBnZSh6PCZ350j/taof5IXtvvd/aFcfq4xH8+XQUKlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rp0LndRcbtIFnq8HDPY1u18abbcF19pBCG13Oa3VgAA3IuA3E376By3SMrRwhVesELk3bvXhdjJcRbxgnIR9DViE2Wh3tpqlT1gU41bwruHl90unrRjqL318YaxrNNhn/migP/fHzvm+bWAPYqpJdyNhXZgoEGcaeZl6wj7fXB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDoypB1M; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDoypB1M"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D029B804AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ842srJwq_C for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 21:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1382E80E31
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1382E80E31
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDoypB1M
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1382E80E31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 21:35:04 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e1b11859a7so1768116d6.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 13:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739396103; x=1740000903; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+eRJBDBJgxMK33j+t8sy/OlD2b7/6fbgIKbknlyZ5o=;
        b=BDoypB1M4UGSb210LjAMt2oa/unPJm0HRPOhWZtNoQTCEl6kVwDyHZMe38EQdUF9x5
         HxBOga/Iq8eJyefq/JwzWZ/uyFKZ0EYVkS2DMv/+NrIUdHaN4YDZw5X6MS8Wc0iTSyh1
         PBLDSWvt6M3hUDPGamNpRgqyIbW0en+aJx74m6XZnXAi66Mri9ygqhp8b8duQxHU66oU
         X7eECyfl9D9CVfmZ5LkWwd5nQGx0j+6Isfa3ZPNpQJDNwVLxFCQ8bnvYGfbBHpzIdg2X
         6OdtT19rhqi0FjLpNkC12jY2P1cQ9ValM59B/ZtmgiUSYXURfxRjPP3m6fmt6ev2p0ru
         bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739396103; x=1740000903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+eRJBDBJgxMK33j+t8sy/OlD2b7/6fbgIKbknlyZ5o=;
        b=ipKODRcRDIEuROS3Zc64gqzGrV7/wZIrMheqmtCJsy4mkYpk+xzy39nVh5vdtFHAAh
         nHrbz1YlAOwinr4zvPAgBEPcBQwW6iL+vOHqb65txLycpn/8Kkm3tOSf6xJfrOrHQYa+
         AZ4ACRclOfjT4MjDlKByKk1AxizTlQAp5BwkO2b4Ujv9YT5o7JehpPkVBAgmzta/0SHh
         IRZqduZ0ciU1Bc+qcZvXcfvq4DB1rOl/ENrn0g1iRO4zD/VfWcjxcyEEf4ICIij5JKFw
         Qq6QNcHymOyp8tUX0JWoYkuCSk8BVFyeYT2GvpzRVVS6aq4g/ptG/WSXjbjooSTf2+Rj
         +sTg==
X-Forwarded-Encrypted: i=1; AJvYcCWhNVSjfGguKc2kCcpe7cVbnh5ll5ey3rDHMT8YM62EwM0CLRWJ+33TwJ0z5p0ny3Uq4v36zOlNVnAPuw9UN/j25NLXmw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyUuIE5St1/JWFWt8g/KBqHvXhk/2ruLe2q9V/qRiFrq4FJ0Qt7
	ldZ+G/vfNRxQAMN25Tk5Kv6Z8Sq6GTNDiJcyshNyE24l3IZOgGAO
X-Gm-Gg: ASbGncspVgiTP52jwWIKrgcYO2eWr9c1swj6ZwaAN5UBhL03m8rIzlMfs8DEbZCRPNg
	ofLNngfKuxCI9Kjfxg1dJsj0oXDLeF8Gr3S0GnB/yvqcMCdHBTvBgT3XIeNbImu/KJSQ+7c00Aq
	zzZWPC2GHZNUBGtY5xAn+UOkxhWrOOLRvhydWqNwWevBNzetkTMpdJSV9Ex3MRWt/WUhF5cRxDG
	3s17DzYJ5revoWfZNT+QspL4Y2KThexkKzdYE8chhcD4BJ0d9gtnw04ki+k/X/SX2zBkQvEGdUm
	eJV9leDjAMf3ZDl+lAkMNk63D4eWKiOPmEgg0YmRk801Rv7QjBgkbbd/WO/xi0PlTlYfLz9Iemw
	3Eg==
X-Google-Smtp-Source: AGHT+IHxeQ2ATxhbo01qm6t4agUVaVKGbsfvvCZSkJjoiFcbkpfgkBZdH0I0nLo51kyPk50CPNyTIg==
X-Received: by 2002:a05:6214:212c:b0:6d8:99cf:d2eb with SMTP id 6a1803df08f44-6e46ed8a41cmr83004966d6.21.1739396103432;
        Wed, 12 Feb 2025 13:35:03 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43ba387afsm82937496d6.47.2025.02.12.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 13:35:03 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation,
	Sumya Hoque <sumyahoque2012@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Added Panic to Hello Module
Date: Wed, 12 Feb 2025 21:34:46 +0000
Message-Id: <20250212213446.5039-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[  333.971507] ---[ end Kernel panic - not syncing: 6Nooooooo!!!!! the module is Panincking ]--- 

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 linux_custom_modules/hello.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux_custom_modules/hello.c b/linux_custom_modules/hello.c
index b60c7b5f6ee9..5a5b7a3dbd54 100644
--- a/linux_custom_modules/hello.c
+++ b/linux_custom_modules/hello.c
@@ -1,11 +1,13 @@
 #include <linux/module.h>
 #include <linux/printk.h>
 #include <linux/kernel.h>
+#include <linux/panic.h>
 char *my_name = "World";
 module_param(my_name, charp, 0000);
 int hello(void)
 {
 	printk(KERN_INFO "Loading module... Hello %s\n", my_name);
+	panic(KERN_INFO "Nooooooo!!!!! the module is Panincking\n");
 	return 0;
 }
 
-- 
2.34.1

