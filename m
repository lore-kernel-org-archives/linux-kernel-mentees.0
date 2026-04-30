Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D691D238D27
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Apr 2026 04:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521926; cv=none; b=gXa20VF7l8/UpUWR+hXblKQcryasDu9BS2gLIa+paf8j3d5o4/SVLuFbaxndaIcXNDOOudR8Ehk1p8qwqGn7fF6Df20JMwvB5JytLEqQjEjpVyLJtEYeZvi5LY+6P3korjJZnqDzAI/GrWuTmPrGA8d/O8C5R5CCLF6yMFOFFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521926; c=relaxed/simple;
	bh=Pz1lBBVHgNHxzgHQuvaf765l8g2Vci0J0xiHJ7n510c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzVQt2YNN715jJZmWSh7hNzrEEcQ9M63VA8bGc9NmjOaWc4uKja20Vk+z3604GJIX0UbadKWa2xA55RF5dh9vddr5FigS9Fcdgzv8cN4vWBZrI+MwLU7GeB/kOMRdVpDGjg5UhiZ27BVEXz9DtoOfovdKXB2RcPxR9DkGM9AP4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkqlhWNB; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkqlhWNB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93FC5846AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Apr 2026 04:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJrI5uDfHu0j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2026 04:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1334; helo=mail-dy1-x1334.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1A3A846AC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A3A846AC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jkqlhWNB
Received: from mail-dy1-x1334.google.com (mail-dy1-x1334.google.com [IPv6:2607:f8b0:4864:20::1334])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E1A3A846AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Apr 2026 04:05:24 +0000 (UTC)
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2d832f2f44cso496336eec.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Apr 2026 21:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777521924; x=1778126724; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kL/durcApuyyvG/J8kYo2FRmpv1/5uzdjUy9U58qkLw=;
        b=jkqlhWNBoVlBBSEbpOHWW4sZCJlf1PJvp/zGUP1ZEmJBgjFIaKZBuqu7rcx1uaCoGy
         UmcWnhMU629KjpFU9qc9ZdfLBZB+Kg9rcHYM4ZwkxrudWSKIrNzG2zV5p2zYMXQPoxYb
         16jHJ2n80tMOmGv8YjMkEm4cIMY4SpNYdwa5WOJtcUrlmpzRFHwuxsRr8kDrcjVKBShE
         7Dbq6l1PlEm3fVGHueFhko99FxD+cOMraLK/j/U2J+IQbJfV5iWCeZFgm5tavGNu76L3
         XbQKRZ5rBPY+AfGAEAILiZBmiPWnCf/5MHLdZ2mlqG/etVxYPcM543/SZzxeO+NG/2pC
         XKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777521924; x=1778126724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL/durcApuyyvG/J8kYo2FRmpv1/5uzdjUy9U58qkLw=;
        b=JKogFKFQOmpM2iEST8Z3ywcTvsqTrkpuz38IfFi59D76yjhVPz7hBxLn/9qyNfqkRR
         4NF6f1TcArE52r+1mypp/jVZiHab1oFqkWgdgkc7dAsrESqoWnOFwFJYwsmj87QsTpV0
         eiw7BhJg+mKwn6lX7CbakUAFn/mJJkmey/AaVU4DjfQNXA2os4yTjsWbxPYGlBtxGo+c
         tWdV8HtbxZn+5AUuUdnrpCzttQCRiWmoUa77z994BVLDfY/A9CnkNtXT2moEksBpUrSW
         PeYShblp7Jq9r2ocpUFv5fiQS5mFoR+qLGgewkdc0FiMT2ARBkKmA5QyI12j3WIi4nqF
         U+Ug==
X-Forwarded-Encrypted: i=1; AFNElJ+VJzLP3tl9Uz/uaQJ9CpBF4OBFwNZVbMZSg8PUThwULFyKhKOZxfHGcXPXcgBkmenOfMcQmceWj3BtnCr3IFDjW5IpjA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyuRx/MH5QFn7wFt5RUHjMHhHMSOKxR9WzvG9qfsBebQI0fG3RL
	7aGtQBfcX8WnVhGNSxTPx+27yNEQVsCQePdulfkq+mu9kb0oMLNCyLLh
X-Gm-Gg: AeBDieuxKaSnWCwCsWLW0NsmmACuWYp2gp8JAfE9oTC1zCqxiyaQZF0XlQNtU3405wy
	sfFL7H5eX6cFjBPoFtnlSijp8F0fLpMp3mWTubt++Z4zHLG9GCbz4H/4/fVYWH1sluI6E+GXq8s
	gZv8km5C54cdV69yBbFXlAVbU3U83pNgwyExKWmUR/U9VBbHnuMkF8aqi/d4WTHKR97oWjzVPqZ
	qqRlxVxjKeg/hHLRLuf8q86D8f9kK7ofkLyPdKmDFpAH708L9jnrQwps2LH2YF3Wz2TDHBjaoOV
	0mwSj4P/gkEfnmiHnuCKfaIZWeZgh0wBta/rNEg9luZ9UXus7XY7E7kUxT6oQSiSvcbvXaIEneY
	M5LG2wJ4iW4dNhkSVJGlqdY3Kfyy5Qk8ayP5n9Jcleub+a3ivseUithNdWGBDERWi2KQsGNsCXq
	g+8+WoueLnuR1A1Q0oj/KYDYvUA1ibaOnZqnkP
X-Received: by 2002:a05:7300:fd03:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2ed3dea5710mr479771eec.26.1777521923549;
        Wed, 29 Apr 2026 21:05:23 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c0e9a89sm7474669eec.31.2026.04.29.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:05:23 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] Bluetooth: btintel_pcie: Remove unused ret in btintel_pcie_submit_rx_work()
Date: Thu, 30 Apr 2026 11:05:18 +0700
Message-ID: <20260430040518.163212-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable ret assigned to -EINVAL, however, this value is never read
and re-assigned a new value when the code jumps to label resubmit.
The assignment is redundant and can be removed.

This is reported by Coverity Scan with CID 1598882 as UNUSED_VALUE.

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
 drivers/bluetooth/btintel_pcie.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 2f59c0d6f9ec..ac4f5b45a6af 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -1376,10 +1376,8 @@ static int btintel_pcie_submit_rx_work(struct btintel_pcie_data *data, u8 status
 	rfh_hdr = buf;
 
 	len = rfh_hdr->packet_len;
-	if (len <= 0) {
-		ret = -EINVAL;
+	if (len <= 0)
 		goto resubmit;
-	}
 
 	/* Remove RFH header */
 	buf += sizeof(*rfh_hdr);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0

