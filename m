Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A94183C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544585; cv=none; b=vDhJV8y52hbm5UAlW1XIAXN2Mn7Z6vMNLto5cVZ/f3j7VWtQRNj+5+1iEECoBrTtmoCVHcOKT4DIlwt4lCJZT5EV0pAGQ3d1NZeZkEqxDpyBc8Icm/f2XO3/0Z4iMkKWTsFj+ETu9yRhmBwN/mhU69GS2RQ2ryppFRFS/yACIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544585; c=relaxed/simple;
	bh=zjJaFdjvPiCMQQinHXGS/Lj0fAMMTQSVc9jvt4DzchI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emSN1H2sA48Cc3VkNxIiInrih1Cx3cCq4MWQ/icnlnlYInlrW1JjXxiyJBpLZy8tpUaJxFNgcyYLZ3yjFaxUwrlG1vc6V3IWAKoiJhAkNyGsR4J5pSLcfO0C3lfr7VooGaMyoXjFmnBFr4q6OVwXgTJKSlQiNNj0fajplGHlKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJsKu7vO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJsKu7vO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFE061339
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9ol0oPKCrEh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2026 17:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 217A060B86
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217A060B86
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VJsKu7vO
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 217A060B86
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:42 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf22eab320so3729555ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544582; x=1782149382; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvlWKrsshSGlU2CfP5kimPXzzn2s1m0s/Uam/zRnJWE=;
        b=VJsKu7vOLASSK2UELrHSkPO1H1O/Br4TS28KoGpxBZTlyTyTQ02R6A7WEXpsmQ+V8k
         olYrBbmE8AlywsiTtEO9H5UyUnSgRAwMv0bOLEYKWQCIOAW6ewPzxgevmzJSQHrbf3Yd
         9qxaeqfyjZFcK0pBKGvfdHwLHyLP225eqWmdL0zf3He2S2JxW6E3R259PwkBld8hYqlt
         rzNYvqqwkrqb8+TZJbsRAkgVNwY3i64e8MPCGKDlrwGhV1m8rF9LdoVkfnnsDrEiMNgI
         rk44vjMetjBguGPiirLlemrfIP8hYqBM5rXq6By9OLjODX2vomuqlYx5Wfa2rLMEHFb3
         loKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544582; x=1782149382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvlWKrsshSGlU2CfP5kimPXzzn2s1m0s/Uam/zRnJWE=;
        b=tUUoNOJ/kV0ZptxO77rI4tKxprIVagguNn6cVAiZLd1i9w9yFzlsEplsI6A2HansB8
         7QWJUAGkaif3OZJSbo4g56fBfH872RpCtaG4cnsZeO90NMuxKVceSKZP3DNhzbuXV5tf
         ZiY384dJ2QAx9/CrlKKUw4r0MpGzLYZdrfNKphUCrxTTGW0co9e5sGGrglkGsaqcCsGd
         YlbMFC+TMZC5tCqApKAeQFUmkfy/jvbDKgZYpj7qtuBt+vC3wbJugvp3+l9PA9K9CWOw
         F0/2F8mvuGa3HdNoGV8lBz58jbEEe6a8K7WoZklvsCS6HIlk5cgETq4QRbue9895hwun
         ZgKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nhEeufnUnQO1t6hIZLaC/pjm+AfqGA3ls5ZiAO9r5Hj149VNPJcMEchVJzR9QaNoOJ6OW64UhwEPCTbS+o5/mAAQzEQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQ5wfwi5KY2NAKM0X3XJ6A7Th9lgxFQJJHpoywvA4jitGq/I2b
	QU/BVg8cjy7exBmPgI/a4GT9c3nlbWbt8buhJmJoIZ4p7Ruhoyt4G06g
X-Gm-Gg: Acq92OHb+oMvpqD7BfsL/+wG8W6pR32pY7pJTehvaYiC8mE2xSrHcZm1DjubZGalVMb
	KJRcxtQQ17o6x3lloLchVV8YqxzjxhzLUvyuDV+FnxgMdXayTx5sy4UrMea0a9eX/p9jtE59EN3
	Pm4fonKbps8gvYUqXuUscNFsxx22vVssBfQGdQ+ovCQp0om8sSNdO6kL6N94hRS7PQEghD1Hgh9
	B1asHLYleMZBZAHHNdXrP+W3cLpXqCpOqEPvR2frIQqapyzva1hgqSzopo3UvsLCozvjGsVS0PH
	6rjmMj/JzoE26HNMZfOwiyHDAl6KgqpB43L2Tb4LoP+aN37HKyB+X7U7T6mmTqA1pPgev1ubDg8
	9EHljI2vd3kfZfC0YoeiRMbHY1o9jU6EHL/515RILHj6vcfrythocgWW8Mh00tpIiZLBkYJZo6h
	QXN0vrladN0zWxNWocJMF/G1NU7+SuVVYiTMu/VMWn42FGuoiZzKw3eAmiSNgDMZY9EiL/rFUm2
	Rnv1GdaOyHuDaKncbXmwyNyjw0=
X-Received: by 2002:a17:902:ce03:b0:2bf:32a5:dbdd with SMTP id d9443c01a7336-2c41245866cmr82743195ad.5.1781544582270;
        Mon, 15 Jun 2026 10:29:42 -0700 (PDT)
Received: from fedora ([2401:4900:7c8e:5373:4159:c5ca:b737:78a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm105001775ad.32.2026.06.15.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:29:41 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
Date: Mon, 15 Jun 2026 22:57:33 +0530
Message-ID: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
the queue which might run after the cvm_oct_remove() frees net_device
structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
iterates cvm_oct_device[] which is an array of netdevice pointers.
Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
scheduled or running before teardown proceeds.

Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260511150931.93382-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Changes since v1:
  - Added Fixes, Reported-by and Closes tags 
  - Added compile-tested-only note

Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

Sashiko also reviewed the v1 of this patch and found that cvm_oct_xmit
can still schedule a tasklet even after tasklet_kill is called. I was
planning to reorder the tear down so that the net devs are unregistered
before the tasklet_kill is called in a follow up patch.
link to that report:
https://sashiko.dev/#/patchset/20260614114739.87061-1-ayushmukkanwar%40gmail.com

 drivers/staging/octeon/ethernet-tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 14d10659bce7..785c6492f170 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -668,4 +668,6 @@ void cvm_oct_tx_shutdown(void)
 {
 	/* Free the interrupt handler */
 	free_irq(OCTEON_IRQ_TIMER1, cvm_oct_device);
+
+	tasklet_kill(&cvm_oct_tx_cleanup_tasklet);
 }
-- 
2.54.0

