Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEBD33BBCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jun 2026 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378903; cv=none; b=kI+DszR1zKg/S6hAgVnVfdISxe3Ls4OwyAsQV7C91W76aMDXuVlv5myYV9SNII97QFebMq7MTtTRc0w3ZeSbxKLxbX9SjkuL7pffgQwn3QY3yI/Z+dyI4sZ7LXnYcR4R/QqCpOfCPeg+vvzqdc4csTrVSozh2XFqYy7xrVytU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378903; c=relaxed/simple;
	bh=n7V2vfC1JbI4WrA583Y6PpTcqWcjqmKB0sQIXUnDtEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2AF+eMmhXC2bWsQdpGDN6p4+rjRKspo8JMFZMjSV6lfsJnDgYIZc+kosu2IV2inFoIAcn9t3MPa7LY3OmoXE6XhWnV2kxnkXthGbe3hfcYC4RMIx0GDuSKV2QvPVj1RsRAzI5IB/xwQw5rBDS0GbAbSf2PcEsESeoYsDV59+Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7rAdnlX; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7rAdnlX"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F247740A97
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jun 2026 05:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMf3Oqy_PiIM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Jun 2026 05:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37F7340A94
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F7340A94
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p7rAdnlX
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 37F7340A94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Jun 2026 05:41:40 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8423f53332aso768683b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Jun 2026 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780378900; x=1780983700; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b87cwHT2BrTigjVd+6bwq58aCoITji6mCL2XtGIvkXs=;
        b=p7rAdnlXKcmPs90uohzbzLN5c1l35SD8s6/mGUYWdkVS+N62tNwsAoDjyOzdgdrgpl
         G96xgUgRJl5m1M5zPo9lKv4pytJ0zeuQAbjn9MEaNSZg+OfSIcm48Frg6RrrbOANWnch
         N6QTNSNI+KScrfyPoepgT4twR5V17U0PCKw2yb9oMFJJzJnClMne8YVngexXgddWBFL8
         UEDJl7gxElyW+S8jOBVqVO1YimBSRwexJuK+otz7P17hUirVldrpKYO7Nul6+JTq3bHU
         XpXX6oWTvD8UdTP/wvW7Pek2b9pwWp7x3ANQMZiAlZeiLBjTsmR99TE1AwIdESdkjggx
         +yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780378900; x=1780983700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b87cwHT2BrTigjVd+6bwq58aCoITji6mCL2XtGIvkXs=;
        b=gV1b1Q3c4+Jn73/fUFFSd5At15y6fqX7CrDG1PrCpOij/TAtKA7m42oPKss/1Ve7gf
         DvqF7zHFTsdhH78k3QZEoi6Xaf1eq5RFg3e9IV5B5Rh4jbs+8b9j6z5TupwK0tTEP0MT
         u9YeNA1XLYiC7fdfy0ua97GyLZkEdACCMisNhM+pOiCcxuLRpLkmeA11SctNNdEM7YZW
         FuG11dB6MyrNa+ZqpxtQxj8AfX6w37aoxWgMsKlGO0zZGk0pnJKbEQwSDlIucbHpa0Id
         YFF6UO0yDfMzO8OSxWxG735Wkpyfg05bh4MykqgRI2xPM4140Z87bGHfie+RLr4Q60Td
         5yRw==
X-Forwarded-Encrypted: i=1; AFNElJ+vGL+2J9o3JZ57HrDWJb9qoXGSqTlfrElrs72tt3TTIjIBLPHLYin7IKprJyj+CK6rCbF7xykPHctxWwAiChmIru/nKA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQJCAXG5u8vJQCSlTifRrv5F/YaWNRjJBqzbTeyjQjb8K7xTEL
	M+im/EPS5D9cnufiSD3drNtN2Z6Rv0RJzZxMkg9Y45gGphk+dHPcadqU
X-Gm-Gg: Acq92OHSPhZ7hSO+yzcv3lKSEFI6bZsoaTvz9i74IjY3A0Nmj4AO2IpggoToR4Smt7c
	o6zpHRMOElkzcf8TrakZMvGNm7zJg4r/KVMpqAPwmWWVaOV1KOSlgwagCkG/oecuhRM0mW0BNiX
	omKz8LKVvgzHXOHw32RevjX4rJ9o5VmeaB+oYb4QRpJagrYbfsMNKaFryGBk1lUGSoSf6c1SkkH
	sVCpvU0onrPqEGy8SnNT41tJPE8wx3RfUbBa+XirE9STDmkl/9N4XpFknJCJT610brRWdNhlXqt
	C7rwLHYtbFVVhl7coxy7CEdJ5nWb7+0l7ZfG91RoTz2JRrPGQm3VXxjmmLPYRaBkoCIwrHAELVU
	1vhvNhS5TLZi+bX609XB7nhcewrDm3+/r0uimh7q2eTeIDVImDiLsh7VmtI/pXKr8BJ9O+DF3nb
	ivr2ZuCypqEk6GP58UbmCdcerXMa/n1LhXthvgdw==
X-Received: by 2002:a05:6a00:301c:b0:842:6fce:6171 with SMTP id d2e1a72fcca58-8426fce6cadmr1818446b3a.3.1780378900295;
        Mon, 01 Jun 2026 22:41:40 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:19a3:f977:6a92:60c9:fc08])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842596e63f4sm4020138b3a.29.2026.06.01.22.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:41:39 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] mac802154: Prevent overwrite return code in mac802154_perform_association()
Date: Tue,  2 Jun 2026 12:41:33 +0700
Message-ID: <20260602054133.470293-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL, the
return value assigned to either "-ERANGE" or "-EPERM" but this return
value will be overwritten to 0 after exiting the conditional scope.
So, jump to clear_assoc label to preserve the return value when
assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL.

This is reported by Coverity Scan as "Unused value".

Fixes: fefd19807fe9 ("mac802154: Handle associating")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I am still not sure how to test this change. I look around the function
and use the previous error handler as a guidance to make this change,
like error handler for "No ASSOC REQ ACK received" and "No ASSOC RESP
received".

Thank you.

 net/mac802154/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
index 0a31ac8d8415..300d4584533e 100644
--- a/net/mac802154/scan.c
+++ b/net/mac802154/scan.c
@@ -594,6 +594,7 @@ int mac802154_perform_association(struct ieee802154_sub_if_data *sdata,
 			 "Negative ASSOC RESP received from %8phC: %s\n", &ceaddr,
 			 local->assoc_status == IEEE802154_PAN_AT_CAPACITY ?
 			 "PAN at capacity" : "access denied");
+		goto clear_assoc;
 	}
 
 	ret = 0;

base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
-- 
2.54.0

