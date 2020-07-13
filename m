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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168F2C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACE52072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7SRK/ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACE52072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B7BE4876E6;
	Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXPy5Y1j4bLM; Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52094876C5;
	Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 409F0C0888;
	Mon, 13 Jul 2020 13:23:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91277C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B5B4876C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6zSONnF3xTe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C005A876C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a1so8213684edt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Od1uE36VZZcVYLn0QSD8NtzuxQxsefbubYclE4nvIkY=;
 b=e7SRK/dskLXTgSYSlQ2o7Q4GwDjhmiP9X6vyk4ZKZEDu/qgVrpUvAqt9H0nYD8+O6G
 tS9IxLNysoC0AJatrwEo44o4SAxid1FlUkUtT0nJX2TYfohWaenFiCs0a+bBJoPZ4PrQ
 olkimNUMz/4c2WhWYTiMwpSVPAxiMCziBsQ1kHrgdn1HkxRuu4IMfbWw8/CJ3QROjQOj
 kmSCNf1U1Jh9w/9rKB7mUu3WCIIc/quDAXu4oBtvdAJaugj9OAo5B/Olh3qgInDhjr0W
 kZ9WFKb+55kYxv090/oS2lbVBG/glVDJxIHRBePzwE74mGECDU7wwOU4oYCIY1k3Arja
 1khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Od1uE36VZZcVYLn0QSD8NtzuxQxsefbubYclE4nvIkY=;
 b=Z9+DbUjplg9UhZaJSikoZx+ZkxtouB6IPQbNSXmQSQo3A0fJ/wNozQgehmrSRL/8Sz
 8iBP9h+eEerFWOX1PbYO8+zP0dwR5xyaYuMOWTNVzGwnR84Aw2UQ8LMTq8xmNfuOpqIe
 4ujDSbUtQVDXlhOREkWAct7lwwmNB0RnlrIfAsC6F3aJ4ZRtrGAQQyf7IV4uh3uVpkdj
 iWCxASvFe9Hg6y4k14iZmvtw37+Smr9n2pUggL1tgEznWH4t1hzKBkuPMdAu3Ki8xWmx
 N7KzWY0sptvMrdxCRS8mUxVKTtOdaHWu888dUCJgKtyXfYo/lRorJuSbNxU5JnJ5wYfp
 Jy5g==
X-Gm-Message-State: AOAM530pLrprXOlW/BL+obXVZqGd8XtW4jXZDxVJiXpiS7+uYsycS5Zm
 bMXO/w8Nt2FOuC25OG7TEo0=
X-Google-Smtp-Source: ABdhPJxpNR6rRgsPQS5aE3w3IDF8VLZSwN1M0ZM5Th2IbtF+Dj00cjehb0zQNQGy6XXrKpQDJRU0Hw==
X-Received: by 2002:aa7:da8a:: with SMTP id q10mr29025674eds.139.1594646583291; 
 Mon, 13 Jul 2020 06:23:03 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:02 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Chas Williams <3chas3@gmail.com>
Date: Mon, 13 Jul 2020 14:22:31 +0200
Message-Id: <20200713122247.10985-20-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 19/35] atm: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/atm/iphase.c | 4 ++--
 drivers/atm/lanai.c  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 8c7a996d1f16..b01cc491540d 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2296,12 +2296,12 @@ static int reset_sar(struct atm_dev *dev)
 	iadev = INPH_IA_DEV(dev);  
 	for(i=0; i<64; i++)  
 	  if ((error = pci_read_config_dword(iadev->pci,  
-				i*4, &pci[i])) != PCIBIOS_SUCCESSFUL)  
+				i*4, &pci[i])) != 0)
   	      return error;  
 	writel(0, iadev->reg+IPHASE5575_EXT_RESET);  
 	for(i=0; i<64; i++)  
 	  if ((error = pci_write_config_dword(iadev->pci,  
-					i*4, pci[i])) != PCIBIOS_SUCCESSFUL)  
+					i*4, pci[i])) != 0)
 	    return error;  
 	udelay(5);  
 	return 0;  
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 645a6bc1df88..2b82ae30dd74 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1098,7 +1098,7 @@ static void pcistatus_check(struct lanai_dev *lanai, int clearonly)
 	u16 s;
 	int result;
 	result = pci_read_config_word(lanai->pci, PCI_STATUS, &s);
-	if (result != PCIBIOS_SUCCESSFUL) {
+	if (result != 0) {
 		printk(KERN_ERR DEV_LABEL "(itf %d): can't read PCI_STATUS: "
 		    "%d\n", lanai->number, result);
 		return;
@@ -1109,7 +1109,7 @@ static void pcistatus_check(struct lanai_dev *lanai, int clearonly)
 	if (s == 0)
 		return;
 	result = pci_write_config_word(lanai->pci, PCI_STATUS, s);
-	if (result != PCIBIOS_SUCCESSFUL)
+	if (result != 0)
 		printk(KERN_ERR DEV_LABEL "(itf %d): can't write PCI_STATUS: "
 		    "%d\n", lanai->number, result);
 	if (clearonly)
@@ -1949,7 +1949,7 @@ static int lanai_pci_start(struct lanai_dev *lanai)
 		return result;
 	/* Set latency timer to zero as per lanai docs */
 	result = pci_write_config_byte(pci, PCI_LATENCY_TIMER, 0);
-	if (result != PCIBIOS_SUCCESSFUL) {
+	if (result != 0) {
 		printk(KERN_ERR DEV_LABEL "(itf %d): can't write "
 		    "PCI_LATENCY_TIMER: %d\n", lanai->number, result);
 		return -EINVAL;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
