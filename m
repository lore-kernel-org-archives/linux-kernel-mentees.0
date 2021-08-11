Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8BEC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 23:46:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B9D6101D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 23:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6B9D6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9456C40254;
	Wed, 11 Aug 2021 23:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzsMz7VexJm8; Wed, 11 Aug 2021 23:46:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A123B401E8;
	Wed, 11 Aug 2021 23:46:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82055C0010;
	Wed, 11 Aug 2021 23:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 160EDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 23:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF0A607FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 23:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRDFr-bL7vix
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 23:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A34E1606E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 23:46:43 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id oa17so6283513pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYwCxQJ9/49X2zOi88wvf0V9m4gUqdeY1chCL4IkZO4=;
 b=aOatYWRwElPP6ZXSdCZSyUhtbaghDH/JrKjaLWQsDElEiJWHm4XQP7WBs4ISYqHB7J
 Hf4o1W+HM5Yl8Lx5fj0WXPdJxQ8oyFF67Nbx2oz/h1yHnvdXiSZRDi3A/mphMSazT0az
 DPD4H2Da7MNg6GufC5JFZ3rzZpGTdLvvcuBE7oZ89jNFVq6X+ier9kloRmcMooJTCYbf
 1Vc2PwBwz63/I5dQTe/TBgfHumS1Neyhk89cTewrfWT4moFuZF3qYBhCN0B8xnLw+H5Z
 HiGiSBWhpg3nii0cQonrzlk+yqAPW6viczAEhQLlXcC3IsRbHWi3aXNGg0d5JZ7XK1MT
 i0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYwCxQJ9/49X2zOi88wvf0V9m4gUqdeY1chCL4IkZO4=;
 b=JoOkuzfK9Va9Zdphd4yREzWAgSriAuhV60oblDTnMRiNCQuLFtPCULS0vPf75NyvBz
 vDEKK/xlUQyM8Q840KkzjZR7z3vWYAEV3plG6c3sfeAkffcWk4HWiwlaxKRypqCtn4Zx
 B5/xdVxhXxqpL9q2zusm3wZNp8tjUaxDs8LanxFvp+Z0FkZLo6NR1BtT4eQyibsKAJ/Q
 9tjQ42eBGyWQhUadws8HoHj+W5JqDIE1g/QZeX5iG70qVJF5HjX4iOpGc2udnB4QHB7n
 Y5Ivl5WiWoZeSotZou1cRZSVuqXx7MF2/43FVOc6PWk2SNgn+3by77MvNyFBrmZWKEuk
 ZJrA==
X-Gm-Message-State: AOAM532qhP1yeqQEDscLbai/Ofg2Pz5GMEAbiWFeM3JRoZ2Z+Kkw30uy
 KoLIwOncNsJntofEnNG0zzA=
X-Google-Smtp-Source: ABdhPJymMZJQEXJ6i/YvE3tP05Tin9dZz072nwdOhv1eKu+lLq8CDjMLVcMxDlOBiXsCtGy0ACkb+w==
X-Received: by 2002:a17:90a:df14:: with SMTP id
 gp20mr11043265pjb.33.1628725602917; 
 Wed, 11 Aug 2021 16:46:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6006:a148:ab4a:57a2:9e36:2395])
 by smtp.googlemail.com with ESMTPSA id v20sm734361pgi.39.2021.08.11.16.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:46:42 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: Remove duplicate #ifdef in pci_try_set_mwi()
Date: Thu, 12 Aug 2021 05:16:01 +0530
Message-Id: <20210811234601.341947-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Remove the unnecessary #ifdef PCI_DISABLE_MWI, because pci_set_mwi()
performs the same check.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 drivers/pci/pci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index aacf575c15cf..7d4c7c294ef2 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4456,11 +4456,7 @@ EXPORT_SYMBOL(pcim_set_mwi);
  */
 int pci_try_set_mwi(struct pci_dev *dev)
 {
-#ifdef PCI_DISABLE_MWI
-	return 0;
-#else
 	return pci_set_mwi(dev);
-#endif
 }
 EXPORT_SYMBOL(pci_try_set_mwi);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
