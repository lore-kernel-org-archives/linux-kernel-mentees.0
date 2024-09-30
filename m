Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1518EAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727663600; cv=none; b=Y2c/ErVsZZtm9F/JYnHa6a/Lyx/7ft5vqX9S/pxtXB9JoRejdYCLVzbd2af3711GU/3/B01RKwwx/IR0ghIV1OzqNPVAuF3vwiqUSiqY9qsftmfZA9bgEzjs1l4TmVOqqmtIVvmssY1lgNuhHhG6+K5GkGWkIa5M3TIMKRXV34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727663600; c=relaxed/simple;
	bh=e70E5Y91Jsny0whAyhew+r/g5VGp2qLMl59bQCj571w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fkd/kaAVd2AjFOixE9m68UIj9gkgDs8yc992StrbYGew7UoHE0h/B/kA7G3DJTno+PqCH/5IVVkHJC34R5AO/edoI3W9TQTSVCN+QTmTslpfV2sqShXa8fr0OygMB3/Q3dPZJJ3QSvsFUYvTObBxMZn5pvqlvYtzUbEEPFvb+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2c9iaw7; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2c9iaw7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D002B40245
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 02:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaDCH45sYCOU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Sep 2024 02:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A407440243
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A407440243
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V2c9iaw7
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A407440243
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 02:33:17 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-206aee4073cso43501285ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727663597; x=1728268397; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=V2c9iaw78UnbSeIehXejXDbFzjgeRcHw04P/7CVcvwOEiBqYDDN3/1dIYJAMVBA/yg
         I27gy6XGhmGkk/UiAhoVzunKkANowQ1RD0KOZRWlCN+vPCe+HJUSA71yJj80ngxSpD19
         Kfbb9Lcafvqr1NawDa2UMBHQqwfsUXKYL4E4oeIN07AdQ5o8bw25yc0XfL22MNHuEOnb
         bu6bqPR6J8oYaTzYnO1Unqf4Zj83Y00bubR1r+gxKAhWXdcPj4McuhakbFislpK6dbbJ
         d+cuwU+rAZ1Em8OCCKU2zOdiFNTXj49PQEjiN3CIlCI17CCr8/CpaSU5u5xFRqL4l3GE
         0brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727663597; x=1728268397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=gWbkklnvgAxT307fuDalkbe/2ROyos08TbLDXMzmjc1zGpwrJ1P+T3+OSXbSJWAP3V
         hmNTanMo6y6oI1+fKyTgMtZwsnI+m3EnJGshqPjs3biKnk5Vo7fRn75cg5pcbYzfu3gY
         Bf3J5U+sqP6lYA8rP0rMq+b/VgyCjTnLTwexZFdrgYtOEgWcWLcjJQaCVgLkRQo5qtST
         HCh+OmU654bHQIAisrp/w7dmtLuAz13NicHjmzPYfDCyZ6NAcxgm6/lMlH2goYjuEjBn
         LXCUqDt1R8qiKdaxjEr1JWwuA2BnQvsAf54sY+rAi4I/n1rEOopqGnpHyBQgNfTG5gJe
         ytnw==
X-Forwarded-Encrypted: i=1; AJvYcCW10hicN7s7KErv+sEW52qtBcMn4Ceai6geBpYsF2Wgy8JXOVx6V9rhVzVMD1qeHnvHYe5rYQtwens8EwC464Ij5gxpEg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyRkxOHzlm0Z94UvKiw80j+noj4VMw158+uCrP1TOyV4tCSqWpe
	eaPf198HZ8EHrLETrL+n+LT7rAtP1BgVhL0D9l2AbL581s8kP39y
X-Google-Smtp-Source: AGHT+IFaTTkpMfIa3pAOQiRSHGes+mnXnVgqsNsCx/5/t+75/M5Nvh0Z+2hujAzCajr+YQeaUPZG3w==
X-Received: by 2002:a17:902:e74b:b0:202:508c:b598 with SMTP id d9443c01a7336-20b37bcfa36mr177554005ad.59.1727663596735;
        Sun, 29 Sep 2024 19:33:16 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:889d:8638:b2f5:89a3:1fb4:f5b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d60e92sm45487275ad.43.2024.09.29.19.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 19:33:16 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dan.carpenter@linaro.org
Subject: [PATCH RESEND] staging: octeon: Use new initialization api for tasklet
Date: Mon, 30 Sep 2024 08:03:10 +0530
Message-Id: <20240930023310.397543-1-abhishektamboli9@gmail.com>
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

