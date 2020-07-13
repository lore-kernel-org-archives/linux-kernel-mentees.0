Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FB3C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61AAA20771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSWxYJ9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61AAA20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 440A087721;
	Mon, 13 Jul 2020 13:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xICsAA6IJFT; Mon, 13 Jul 2020 13:23:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E1E7B87701;
	Mon, 13 Jul 2020 13:23:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2326C08A6;
	Mon, 13 Jul 2020 13:23:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD0CAC0888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A9FA6876F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmSoopDJ9cOG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 08682876E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id dr13so17160560ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ogb36sa6vQqtiEyWjTGxiNgWIm0WCLEYPRrILza4y+A=;
 b=gSWxYJ9bQdXtfjpV5tTR8o48guQJpHgLZf/AFrheK3RnuqHSN8PTPjtDsp1el2JhLA
 xFCqfnmY4I7S2CJAQ1NmuTzbhZ+piSkoZznsvy3Ns6sv6mxGXQY1LdtWlLP+9RnLbvXe
 r/Z3B8mPu7oFnRhOq8liQCkwx28YatrK0EbWmFhCqq/6Rr79MhPcZV4WnSI65ji95OpV
 ms24mXH2uX3XY+qu+zM38pKy89l+0Gj1XPT4jmw8tkzOC0+cpGPcRFakRw5saJjkZrdH
 lY4jJJb8LP1Ym3wBB9vuW3lr9lDBYXspDKgKgVf6kbF4xOtHe02GGveSvba0Tbzeq0Zz
 tSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ogb36sa6vQqtiEyWjTGxiNgWIm0WCLEYPRrILza4y+A=;
 b=WvewhMyuTM1QwQUZDWQjH3F1Zt8ETdvmxRsH9DOTb0EXFW0lYLv6Ri5jzStDMGSI0u
 oCDL22Tj1Ynxvtu3FAhFosmNvsf7stlGVQoxUt5CCNbtcUTZLlkpiWl0nRqQqMf8kW0v
 IZVk5QVeqGcCsMtcuFWGtQ8Te+PSRkw7TORf8c2c9oOZLytdjb2H5tt8Ot+9xLlLZkFZ
 KQSMfJhNAlkZbxZlQHIJryHgVfwHkw8HXW21tp8BZGD7pSnjiSwAmWfFGE2xulhkbCZ0
 CnAR8XiarzSug8/LyhJbtWg9zgdFEJsvBwyUXijziqp8f+xvt9//hftsFGW5AUXKh2rY
 0kqg==
X-Gm-Message-State: AOAM530P37pI5Zf3b+vcq3KD7RkHvJnrjXTwKRJu5//Zy37apuOYwIWU
 WfKp0Xz+r1ddrTL4j+PSNYc=
X-Google-Smtp-Source: ABdhPJwwo3WT8dxUL0Kf6TWRHS0OPQZfA5A+WaxpTkL2dVH32LbSdz8Gf2rnEGSvvqVJFQLgzS7Lig==
X-Received: by 2002:a17:906:7c8:: with SMTP id
 m8mr73051911ejc.527.1594646603546; 
 Mon, 13 Jul 2020 06:23:23 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:23 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>
Date: Mon, 13 Jul 2020 14:22:47 +0200
Message-Id: <20200713122247.10985-36-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 35/35] alpha: Tidy
	Success/Failure checks
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

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on 34/35

 arch/alpha/kernel/sys_miata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
index 1b4c03ac34d8..539f803c1614 100644
--- a/arch/alpha/kernel/sys_miata.c
+++ b/arch/alpha/kernel/sys_miata.c
@@ -185,7 +185,7 @@ miata_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	if((slot == 7) && (PCI_FUNC(dev->devfn) == 3)) {
 		u8 irq=0;
 		struct pci_dev *pdev = pci_get_slot(dev->bus, dev->devfn & ~7);
-		if (pdev == NULL || pci_read_config_byte(pdev, 0x40, &irq) != 0) {
+		if (pdev == NULL || pci_read_config_byte(pdev, 0x40, &irq)) {
 			pci_dev_put(pdev);
 			return -1;
 		}
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
