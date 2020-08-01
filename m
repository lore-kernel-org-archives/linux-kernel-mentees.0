Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6EBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D523D2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6ZCfvut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D523D2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B69DB8883C;
	Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYg7MbseXkvK; Sat,  1 Aug 2020 12:24:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E03088831;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 637D0C0888;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26AC8C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1672287047
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBPdpo0WD3ZI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3515F87040
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a21so34005217ejj.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4KwHv6QMJMXsH8yaJc8FAm3bwHGuyv+DgGa3tEGDGbc=;
 b=M6ZCfvutD7TU/pOV2RNFZ9MidUceEEom3Nv3cE806feUIRVqBJG/pIaUprqT1xhcje
 WdFRwEFWFMhXxFz9OgdZ1Gkc2To7DRldejROIxZU6c5ReUp9u6fMtabD/bp4nvv/xOZ1
 gEJrQOJUtdKdJ1QlchgC8PcfGkZLKme+Hi3QCWETI9t5oBQZyeKu/wRZdwIN4fw+6/p2
 aP/w5sc4rsYwGAOX8KMKUcMaGtvOVbby2SRPvd52QpVeN1oD1/I8CIBqPGmZsXStVK34
 LWU73hZRIlZwQmIZU0I3USachekVwyf51qlBk3yWeO3Owwoptvz+TI+cen849fVsnjFy
 6R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4KwHv6QMJMXsH8yaJc8FAm3bwHGuyv+DgGa3tEGDGbc=;
 b=dyGTFxMZJqAmV+k0mbn4aODcjJOlgrxf7efXVBRr1noJBsUxgEzKj/e5n6EtuV7KsN
 QH9yjbtjwamWCTJP9mWgYOjoQRRJBdtHcfFihC8bE5p19MMt4iWom+pMQDNHQgNK+M+i
 2uGI9kiLjroaT/ZovL0F7gp/41VfjhGCfN1caqkUeMX9q/ebh5b+1u+IrvLj+GSjbcZO
 e53xciWPoDqhT+oPmnGEZ/5uucRi22JgQvIt4UgKxztX7dH075KkNCXbEM4XWCHFMrpO
 /QaRlnYQGXp1NdQBHUqI/70bXCuCW8G67QWrN5zo+kv0TLO5MuLGD+KQpGDh0ufqqCjM
 N4jg==
X-Gm-Message-State: AOAM533mhty/P4eD3Z4Akz/z2Spt5GkycjlE4W3yBXc4lDm2VQjGjE1C
 GfTY7XXlFHd/o42saHXRuzg=
X-Google-Smtp-Source: ABdhPJyP/Khv/zO4ruS71OwrBP8neVvwznKuE/Wo/7tG658TgIhiZlq1Bl/1qqyQW8Ic4CfQutik3A==
X-Received: by 2002:a17:906:694b:: with SMTP id
 c11mr8314854ejs.232.1596284670556; 
 Sat, 01 Aug 2020 05:24:30 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:30 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Sat,  1 Aug 2020 13:24:34 +0200
Message-Id: <20200801112446.149549-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 05/17] dmaengine: ioat: Drop uses
	of pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/dma/ioat/dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index fd782aee02d9..e51418cf93b6 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -1016,12 +1016,12 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan)
 
 	if (ioat_dma->version < IOAT_VER_3_3) {
 		/* clear any pending errors */
-		err = pci_read_config_dword(pdev,
+		pci_read_config_dword(pdev,
 				IOAT_PCI_CHANERR_INT_OFFSET, &chanerr);
-		if (err) {
+		if (chanerr == (u32)~0) {
 			dev_err(&pdev->dev,
 				"channel error register unreachable\n");
-			return err;
+			return -ENODEV;
 		}
 		pci_write_config_dword(pdev,
 				IOAT_PCI_CHANERR_INT_OFFSET, chanerr);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
