Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3251D1315
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339789; cv=none; b=jmYvJGW9fhLbIDqtbahTvvi5J6qppWqBzrtgiURlY740tfM5Xjh5XMeIMnlwz4LLyzL3k3cTtmzWWTX1iKnYa75lTw88rt6yiTkN7SxuljWY9IYn4hars1Hm+Utk/jUCmkKXPtPcMIockX7I0VbtFZ7qdK+5Y0eJK0Sr1Ev8UCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339789; c=relaxed/simple;
	bh=e70E5Y91Jsny0whAyhew+r/g5VGp2qLMl59bQCj571w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZRZYeum2ZFjsrhkBxiUobuUfRMKtGb/ciH0eUuqTdsFPkAgHCVCqt+a+w9vNndJwvygGhmqUS9zeRtpGUpQZ9vVa1ZzuNUKCo6EVdWnM0B4rNwlPsyZqJazrttjaxFj2OlMfdRdr+3hp+E0WT1jwpBfmYBrJFcnrC8hE53jRfPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3CyuIbs; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3CyuIbs"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE6B40600
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6KSbWd4m8Dl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Sep 2024 18:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0947C405FD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0947C405FD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O3CyuIbs
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0947C405FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 18:49:46 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d8b68bddeaso1748561a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 11:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726339786; x=1726944586; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=O3CyuIbsWE3PDl3QgzCuyRsvdEKfFME+ZssTwSSaXVNYf8nQEoEk3DXusvPkE8KG4s
         WO20J+CEVm8MStbU561byKOxzh+UsAT22WKaflV/9gJorNGl7mWtNC0Bb8AEzcHJrUhs
         vQvFXCvwTqbqPyV39iuZLEdONOWU0R2EmYIAPWhkyn+vHeHAcix1rSJlTHxII+DBYzrg
         D5KGjS2nOUkh2n/91YGO3P7uVU6j498BjjNM7wmrsfdZfwLfPFR8Nc9RlW/yzFebTSXv
         D04OU8WDp3WTZMFWIuS7p9TsAlg2DpYHFoHbtxKZDQ2cOldaXDIC0yQy8efCcWit9/Ll
         0CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726339786; x=1726944586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=QaGChIeU7dCWaYkSgjyH7rIocZkRjyaGRWh6AKhlAukKiPPmYQbouUu8Pl9br48pP3
         HZNkJLQIuvilsMDq7RRVUTor6jKfggdm+UFubf7FoNK+SAj1b02p1REAHM3PmbsyQKua
         GKSuKJ9qdF6AzR6QNfPVbfOc9R68zdFiRRm3JYxNLEgeqOrPu4LfhbyeMKUETnZSURpC
         +Qj01L0WwhtOPKoCzTKeTVbYlME3UECSlcjE32c9Rgg75CdPXqTNWBYrsa1eb0M6LFCS
         Z+ess8Fg4Nne48/vr2FCfcypBYHdZj925NGn7kktw0h4nwtOtuRvjDjxEbeibGN5hjpy
         ANhw==
X-Forwarded-Encrypted: i=1; AJvYcCWa1qNiFoNkVNOGvBSsrdJir/KwXKLbyMvhkKe1qoCI6z+f6OahgEv6+1s7LN5hnRN59Y51INzOU92cThYRJqt44i9fkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4Go3efjWiQaVFMTsRem7ZzZHAOm8XiDfxStyZ5CLUFr29ce9T
	Pm1hQnmKxK287buwTsMlMM6YW0IN6Y77FR0xv06X5jnxhSXnQUtg
X-Google-Smtp-Source: AGHT+IGG089sKirYuMOIPyg9jQWpJLf2jAJ1DKymjs53A5OLIf65r9pHbmzVbYI/wDkgKwg6PEo74A==
X-Received: by 2002:a17:90b:1c06:b0:2c9:1012:b323 with SMTP id 98e67ed59e1d1-2dbb9f3c96amr8589484a91.27.1726339786061;
        Sat, 14 Sep 2024 11:49:46 -0700 (PDT)
Received: from embed-PC.. ([106.222.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9d5c9dcsm3998170a91.43.2024.09.14.11.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 11:49:45 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] staging: octeon: Use new initialization api for tasklet
Date: Sun, 15 Sep 2024 00:19:35 +0530
Message-Id: <20240914184935.848999-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
introduced in commit 12cc923f1ccc ("tasklet: Introduce new
initialization API").

This change updates the tasklet initialization
process without introducing any functional changes,
ensuring the code aligns with the new API.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v3:
- Rephrased the commit message with the reason for the change.
Changes in v2:
- Fix build errors caused by initial[v1] patch submission.
- Update the cvm_oct_tx_do_cleanup function to accept a
  struct tasklet_struct * argument, required by the new API.
[v1]: https://lore.kernel.org/all/20240912172231.369566-1-abhishektamboli9@gmail.com/
[v2]: https://lore.kernel.org/all/20240913191734.805815-1-abhishektamboli9@gmail.com/

 drivers/staging/octeon/ethernet-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index bbf33b88bb7c..261f8dbdc382 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -40,8 +40,8 @@
 #define GET_SKBUFF_QOS(skb) 0
 #endif

-static void cvm_oct_tx_do_cleanup(unsigned long arg);
-static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean);
+static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);

 /* Maximum number of SKBs to try to free per xmit packet. */
 #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
@@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
 	}
 }

-static void cvm_oct_tx_do_cleanup(unsigned long arg)
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean)
 {
 	int port;

--
2.34.1

