Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935A14830F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255065; cv=none; b=V1o/atkMOANwQ1bjnI8hyfFXozW3lVSa11Q5k9yekezPEWkuhCH9+evILmngYKv1I5SAaE1lrdGq4xESRNB7eQZ95LCszhO6SejzMWGzMu8IJE8/CeSYN7MLfoDHc50TxKD8Xuysr4FJtxy+y2n542N3TKluoUGCJ6YtiHyQKXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255065; c=relaxed/simple;
	bh=yWuHN4hOrAHckEToIrtlx40+ngK2VaRLBRCYDXTOO+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ceg9zVjOJl/wBF/O592rZVJRCKUfYGTUfvPdMeZiVbRej8M7sMStzS9MHJNbAySR1GsJ0iKrmrP73o+Q9FdAj1IaOPWZRQiurBZlpFzcFmxsR0a/61M0ALNlmHANt0PgYNUqokhDU7ilfz88YNUtCbKUHVYGRNLa6Etf9Gsi/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yu0vMSME; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yu0vMSME"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C0184175
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 19:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3k4GI7skWO6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Sep 2024 19:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBF7884168
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF7884168
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yu0vMSME
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CBF7884168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 19:17:42 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2054e22ce3fso27602435ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726255061; x=1726859861; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jcIHqWkgAfixknzcAhPYZoyDkQ52gLcOsIWSku0RSo=;
        b=Yu0vMSMEMjuljhOmUdHrVw84/Mpkz5cwz5kO0FO9n7iOBySZgIdful/NYXUk7CoGan
         f6m/+zvr1cKNyONHzvTmBJWyT5x/Qly7OChpoh57qwLIENBAMFeRB6nhxKnEIpFA3n9O
         xXy4dnI1eSux43kTiDQ4F+We73evkbJbH8xPYzUQ0a/TVeIKALmcMQKHkVnb6AqV6EMO
         rKveSAmnfgakfDUzZCOdFkz3zNlSagZUVzxlcgOamAZHju+2bI4w/MBquJ/d1jd7FMVW
         YP3vGST5p7heXOrlOMCBlvDS7vpvhNH+lmRHo/Ob2Js32b/+W2s28UKJCtopVYht8FZb
         iYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726255061; x=1726859861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jcIHqWkgAfixknzcAhPYZoyDkQ52gLcOsIWSku0RSo=;
        b=dZxi25FTnUtsAfuQhzJLtP9FSucRD+DGUdw3YBmbKr2lhvbZxv8clW5lXbkC/3AQVs
         foJRT94/NGkpYJ242KoClx3ZXgpJMMX9EMdtivXEdA0AjV+yMSLh5wH+AdrLFFH4Ghwh
         jfUgo+fu57bVt+tjBZQ45SkYhfh6QkODHjVNddw0ceVzhnmf9hJzX6RmlQ0pHxJ4yGUH
         yadV8Erny6W/3zPAoq+yrEfYdkfzNcYhxTOazI1w6JhaTAbjqnkKvdNfd/48NPMFJ+59
         4bOcVLPEKFGtlO2Y3PEnzBtz6+HLNscTmiBqSpxfAXFcQQO1wAA/HyU7ElEjsU9m1DxD
         sGwg==
X-Forwarded-Encrypted: i=1; AJvYcCUSvitq4Pdn1uNJGpn7fXnQLnFFfEtr5NSxFOdj/UKpdWVSTIicubB2jsEvRdFx2mHl5iU54tiKa00S6PsRwhO4n0O91g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzk0iWVhe2+ZN/rWLDtw66yG/Of+NYmLLnvnsvyrEw+b0P/E2rp
	ByP9gyZCFlh1OkMbq0R7/t35gl6X5IX26SUz9no1+txYQDSvZ+N8
X-Google-Smtp-Source: AGHT+IEefJq989ae2HFQTbfTrintN5mE/N+S5NGfHELvPZ6eTmyNQifeCKgcEqlVYLZymntY9GVheg==
X-Received: by 2002:a17:902:e802:b0:202:2cd5:2095 with SMTP id d9443c01a7336-2076e33e92amr108363275ad.18.1726255061405;
        Fri, 13 Sep 2024 12:17:41 -0700 (PDT)
Received: from embed-PC.. ([106.222.228.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01b4d7sm30899105ad.295.2024.09.13.12.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:17:41 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: octeon: Use new initialization api for tasklet
Date: Sat, 14 Sep 2024 00:47:34 +0530
Message-Id: <20240913191734.805815-1-abhishektamboli9@gmail.com>
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

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Fix the build errors
[v1]: https://lore.kernel.org/all/20240912172231.369566-1-abhishektamboli9@gmail.com/

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

