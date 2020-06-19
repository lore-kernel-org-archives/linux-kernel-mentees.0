Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B91AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10B521527
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJUlLmyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10B521527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9E94854F8;
	Fri, 19 Jun 2020 21:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmk8BXaEjUs0; Fri, 19 Jun 2020 21:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE09487A28;
	Fri, 19 Jun 2020 21:12:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D017C07FF;
	Fri, 19 Jun 2020 21:12:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84475C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 737E289647
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaadkaAiZdUy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7738A89648
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:05 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id mb16so11639636ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jAXB2Xsp63gxSnlS62FMvrJwIMDFQQlRe+IDuUdQLNA=;
 b=LJUlLmyrCY38Ie14pWTsCoOnKkS3KYeJLzwnwoxAo+1wwCZFsn161ttF883Uvy0e83
 D/9synv4uiajMX8KVQxqkerEZSZM2ZNEayk5T0Ud4rBjD52Np9NTRe4KK8dwz5scXm3v
 /vJaPosakihWFNrjwbiuFArhoUWggc1iZX/bB9BIvOp98lasyS2l1qW22ap+axkSAn3H
 Gfa1kyKqL4kPIzI746CIWuLZsw+7HulZw1XNdU5yP7CjBIPu6wHawx3ZIKlyjLgofSFW
 bJ8GpDJdvKI8C8SEDn7YI4Ye2bbWPnPeW5LJu3gwamlpv1UJfzO7pXpiOQyryoGqZ7l1
 XGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jAXB2Xsp63gxSnlS62FMvrJwIMDFQQlRe+IDuUdQLNA=;
 b=DD0ZmBdG4UwiYXhgG2yQ2Y8BW+FqeescYpWKhCqnHFOV5jQTH6EGSuaUW5QZFwlq81
 o7jgBGrSiSVcdbPCHYBnGfDHRskRtOXfKMVKhcsvzz549CSNwYpEJxYwIuZ9Kozw6Tgo
 vtbOz5PWD6ssT89bRpu91XCgraZO9AOLOILtxdkLXBcUNru93H+rhrXy7pMLh4nP151H
 LVxT9rMkKHVFR6R5UWY+b2UJ3fQcDB7jQsZpt5cT+b+lS0gYb6KGwEyMpWsf8lmXKf/3
 ZbwWzImPw64XuwL3k62StVZGMXlaBlTEj94Rc/+zUFcEkUqa5XkR12M++WcOSW1BXb9y
 UHEQ==
X-Gm-Message-State: AOAM531lbBWBITSzpQmvdQ3GSW2nXTZ0JGqrzf1jLDRUNFnhOf6TGFLI
 pT46grBDvnnzrj+7GUG9uaI=
X-Google-Smtp-Source: ABdhPJycigLNBigDYpmptOX7dWHewhlOXOlZAg4gjbgh43FSAqz03bmaygW9sIlYRuHI53gyWkYHWg==
X-Received: by 2002:a17:907:40c0:: with SMTP id
 nu24mr5678689ejb.141.1592601123931; 
 Fri, 19 Jun 2020 14:12:03 -0700 (PDT)
Received: from net.saheed (54001B7F.dsl.pool.telekom.hu. [84.0.27.127])
 by smtp.gmail.com with ESMTPSA id kt10sm5485833ejb.54.2020.06.19.14.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 14:12:03 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Fri, 19 Jun 2020 22:12:18 +0200
Message-Id: <20200619201219.32126-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200619201219.32126-1-refactormyself@gmail.com>
References: <20200619201219.32126-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] PCI/PME: Fix wrong failure check
	on pcie_capability_read_*()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure, pcie_capabiility_read_*() will set rtsta to 0 and not ~0.
This bug fix checks for the proper value.

Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/pme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
index 6a32970bb731..1d1d06f06335 100644
--- a/drivers/pci/pcie/pme.c
+++ b/drivers/pci/pcie/pme.c
@@ -224,7 +224,7 @@ static void pcie_pme_work_fn(struct work_struct *work)
 			break;
 
 		pcie_capability_read_dword(port, PCI_EXP_RTSTA, &rtsta);
-		if (rtsta == (u32) ~0)
+		if (rtsta == (u32)0)
 			break;
 
 		if (rtsta & PCI_EXP_RTSTA_PME) {
@@ -274,7 +274,7 @@ static irqreturn_t pcie_pme_irq(int irq, void *context)
 	spin_lock_irqsave(&data->lock, flags);
 	pcie_capability_read_dword(port, PCI_EXP_RTSTA, &rtsta);
 
-	if (rtsta == (u32) ~0 || !(rtsta & PCI_EXP_RTSTA_PME)) {
+	if (rtsta == (u32)0 || !(rtsta & PCI_EXP_RTSTA_PME)) {
 		spin_unlock_irqrestore(&data->lock, flags);
 		return IRQ_NONE;
 	}
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
