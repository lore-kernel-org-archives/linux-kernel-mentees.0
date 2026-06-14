Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F0B2BEC52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437740; cv=none; b=U0EVm8UsSH6pTSLW9YAl9ALuMPpQYqbGqDxe9gP/JPV5JBiW2Te8uhZ+ifpSbPO8cmeRwE11ZpSm8+To/aZNkeMKCE+rMyyXgf96cZr1ArQ4HvatQ7pOT6sKWDqYnptVTlz47MjxqQLYYi52Cp7vHH6py2MdZzkh8xHbcVVa7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437740; c=relaxed/simple;
	bh=ll40Wdsw5Beb5SEWvKZ7o8ZFRW5ZvL3rqlsZ87zKu/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOqV8IvIdj52P2644nDADP05/V3P86pFLgo1lGdIE+JlA7ImoNaBUe3eQm9GXJdqRcUZRbV3y6O4NBN4ezr2uUu47grhW0NV5pS/2GZSb1r6AE8fAobM6EQHdOHM8jrCFAE+30Fzof6fKqRTFkqb8HKomTGD2V9n8tll49lzWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXUfXn7H; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXUfXn7H"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E51183C7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKzGCHCljPII for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2026 11:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC05C83C79
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC05C83C79
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mXUfXn7H
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC05C83C79
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:48:58 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36e0a13e801so334447a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781437738; x=1782042538; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mE+74dY5/0xayTn2/a4ziQg7s4J1BN3ftMLZ3hA9Rvw=;
        b=mXUfXn7H57iBGhhSlVOcj0ZoI17X/IeUu4HeOrNbVUwWJzPNf0S8gCNSNqqfqPeMBP
         gaU3yF1VRu9reddBH14+hyY/olrBpQdAJBjWzQRab732zeBGWpbPRdmWGuP/qgnG27e+
         z7qDRiaVFzjk4YWtYdOK5bbMTQpCu1ZJLTeiDA0wq3VHSOBf6Gli4m4mr9Khb2Cw194o
         bkKLEL3aUkTL2d2cWWxmPA2KBFreCBpWLT26tuzTX80PATmrVvoWuJeD7EniFm4IljqC
         YmiVj9A38gbU6mtS0r7zQ8bCTfyBV/ZV+gez7UrAWTGH59MWb8stSw5H+wqbc050Zq8t
         qf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437738; x=1782042538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE+74dY5/0xayTn2/a4ziQg7s4J1BN3ftMLZ3hA9Rvw=;
        b=nYWmSoT5sohJmUG1EG7aIji9Jy5N1rdv/JwS1dLFtiSuNI/dqwwKOrUYZU1xQVN5lf
         bWIn4lyfGsUxroExt62BHJ4MdKIsdFBmlh/UNKV1LqJqqUBXMR2MGvY7bvGtDMtGMHbC
         foLAhwpYkZq4Era10CLoGdE4T8X1W8KBaje5xzqFLT9QIwXXt43+UKXhLmIkRvx7f0im
         LT3uB2h+NnaVAsuqeGduB8ADSe+Zzd+rDbp63l1GPYe4ApRC4wa8LAgzD7Wncf+w+NGr
         +RPEaFW71kdJyBjZ+oVOfc0vEkmPx3sfjbz7TVEcgSP/zV+BY5dI5HOibvEaHT0m0WHN
         vr7A==
X-Forwarded-Encrypted: i=1; AFNElJ9Z/PKyx3RSsEWrD5J+zqxOzk558ofU+TR6Ieu+3at1awxp/FW1CSDXa8B+nKUFROFh/XDXkAb8clRgPrFY7UdN/HxS8Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzFUAG11r4w+a8n3jDUgiqVO8FnAtAJIYy6EpR+onJRn34VVEMN
	1UhJ2+bGCAlJcOQWwYjfLCh2zULnFetl2jBZAF/4SmiZ9aV7ZALRjnay
X-Gm-Gg: Acq92OHQU8RVg6aTea+4+V8MQSlgFidN6zfI8BbJ1RSVl3cSSf+RRiGY9PlvpjrtAIC
	TTu02frpAH2iAV76uiN+5HqmQtq2W56ehki7IwaND6AXVTxkwJsE9fMMr6INC5+kNPXDNLAGztu
	3+jr7k/sCqG+CxyPFyT0n1tvqZ5LBZrWVqS6xJzaPAbuTSATwtS5TMXhMutTI2JiIM8y7QddxnV
	kow02m8fxQ2gN9Vqx3ew9JL676Bx0+JIKChkcA4HRe1K3EiLT4/vv9zhXMq3yFVflqFXmPMl6hf
	EDORIqMSpBFckMOrkRQmjAf0XyCZlyD2Mxjf6dfgnfbI6UEYZP1UiDZ7dsASXmECTJuvj9qGGNe
	ulrbLfMGFvIoskyDNTrxKslEHI//hf7SGV0sFUcOHbxQVskBtlaBmanqLELBWB0CYKB1CHWkeOy
	gcMjfW9F2+W0YcsXEtsVeaVDCBiXHU1rCxy4Yp45SqBbFJ9VP3FIxFSXHPd1A7LQ87pLgJcxYqB
	e2ZDksqm1lbtbNs
X-Received: by 2002:a17:90b:3901:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-37a03fb813fmr5350117a91.7.1781437737852;
        Sun, 14 Jun 2026 04:48:57 -0700 (PDT)
Received: from fedora ([2401:4900:79eb:8cfe:b4fc:6fb1:4b23:8420])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2179d743sm7388808a91.17.2026.06.14.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 04:48:57 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
Date: Sun, 14 Jun 2026 17:17:38 +0530
Message-ID: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
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

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
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

