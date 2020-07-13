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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2926BC43462
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED83F20773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP4tM4Oo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED83F20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA3AE876DA;
	Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6-PlnJX3YG8; Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 742A6876C3;
	Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60820C08A5;
	Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D189AC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1AD6876C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQtT5NYm8UQ8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E82F876C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id br7so3314137ejb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f8H9ERlOx/bwQCAi3oIgaIga9LfQUpIbkoayEldb0HM=;
 b=nP4tM4OoaJfI0jEtW6xEBzg5apoi+sWZOdNUHQnZql6+5zpfUsCjSE4u5R6pLHW7oz
 jwCKuzbcq2TY5Dj55XYH232OmurQzeBHVhYptBrE9zfGCZRU4opTaCJbHAMpr0Io+O6H
 7CkiLXYzvyqDjoBjHNoxd6DKPV8nlkPB4GjV5Gm5694PrvQuHLga/wb1ZW/qqoYB7fX/
 23WjP7f45Ar86+KfC2ZgCUkjdOH+neDGunZLfG1c3Unv9zr1u/U/MpAClk0P9WhMhftQ
 ZOPqXc9lBwP4VFQwgbEqziTeD1X6/NYWmcovo0m8tlTlLm04kKUGwewdHeh4toIGMfu7
 3x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f8H9ERlOx/bwQCAi3oIgaIga9LfQUpIbkoayEldb0HM=;
 b=hzfoZ3nUSbMSZFrh6yVsY+T2i8gsAikfYlmAKPl21qQLXLA0PgS3ewVknrFp8AlSZj
 OJb4k2aRggRewXctbrID5Au0AXBswxNNXoxS1Y5wso3nQnI5v1O9l8464Z9v139JAjJ5
 o+ac3delsDiKRFkEO67pWeEsQbd2YU1gdMYiRzeXlmVMepzKoaSzbJ8L1C3DSjCSia65
 45z1ar60rno5DGdd86jOEsSo532HOBMycKQheKafF/Q16ZZAbOfNnVTmBVZf6rQDT9gN
 kZlUzwCmJnfocN5o2HhTtMu5FCyfowQOkGaeWGwga3QEfE4L/l40UC4VTLGFZVtEegYt
 QTbw==
X-Gm-Message-State: AOAM533Mn47kB0ortn3Q5DeGR1kqLT1EmDYC664anJwKeYJ9FyK3o+pL
 xihLsQyocB8LcAx/yiB643I=
X-Google-Smtp-Source: ABdhPJzx0zQFxJKNIsf6530AIRMCz6zA8fnk43QLenk2ugiiyTQ45TDgcyc6ZIixfZou+TbMT0rN7g==
X-Received: by 2002:a17:906:ca56:: with SMTP id
 jx22mr72549054ejb.494.1594646584531; 
 Mon, 13 Jul 2020 06:23:04 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:04 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Chas Williams <3chas3@gmail.com>
Date: Mon, 13 Jul 2020 14:22:32 +0200
Message-Id: <20200713122247.10985-21-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 20/35] atm: Tidy Success/Failure
	checks
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
This patch depends on PATCH 19/35

 drivers/atm/iphase.c | 10 ++++------
 drivers/atm/lanai.c  |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index b01cc491540d..2c75b82b4e7f 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2295,14 +2295,12 @@ static int reset_sar(struct atm_dev *dev)
 	  
 	iadev = INPH_IA_DEV(dev);  
 	for(i=0; i<64; i++)  
-	  if ((error = pci_read_config_dword(iadev->pci,  
-				i*4, &pci[i])) != 0)
-  	      return error;  
+		if ((error = pci_read_config_dword(iadev->pci, i*4, &pci[i])))
+			return error;
 	writel(0, iadev->reg+IPHASE5575_EXT_RESET);  
 	for(i=0; i<64; i++)  
-	  if ((error = pci_write_config_dword(iadev->pci,  
-					i*4, pci[i])) != 0)
-	    return error;  
+		if ((error = pci_write_config_dword(iadev->pci, i*4, pci[i])))
+			return error;
 	udelay(5);  
 	return 0;  
 }  
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 2b82ae30dd74..5852b8cc0cc4 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1098,7 +1098,7 @@ static void pcistatus_check(struct lanai_dev *lanai, int clearonly)
 	u16 s;
 	int result;
 	result = pci_read_config_word(lanai->pci, PCI_STATUS, &s);
-	if (result != 0) {
+	if (result) {
 		printk(KERN_ERR DEV_LABEL "(itf %d): can't read PCI_STATUS: "
 		    "%d\n", lanai->number, result);
 		return;
@@ -1109,7 +1109,7 @@ static void pcistatus_check(struct lanai_dev *lanai, int clearonly)
 	if (s == 0)
 		return;
 	result = pci_write_config_word(lanai->pci, PCI_STATUS, s);
-	if (result != 0)
+	if (result)
 		printk(KERN_ERR DEV_LABEL "(itf %d): can't write PCI_STATUS: "
 		    "%d\n", lanai->number, result);
 	if (clearonly)
@@ -1945,7 +1945,7 @@ static int lanai_pci_start(struct lanai_dev *lanai)
 		return -EBUSY;
 	}
 	result = check_board_id_and_rev("PCI", pci->subsystem_device, NULL);
-	if (result != 0)
+	if (result)
 		return result;
 	/* Set latency timer to zero as per lanai docs */
 	result = pci_write_config_byte(pci, PCI_LATENCY_TIMER, 0);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
