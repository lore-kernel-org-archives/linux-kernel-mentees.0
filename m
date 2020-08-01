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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001A2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49A32087C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHi5Tbht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C49A32087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8989D886E1;
	Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t+8RDfgYUtcJ; Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0615388686;
	Sat,  1 Aug 2020 12:24:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED35CC004D;
	Sat,  1 Aug 2020 12:24:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2E4CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C9D738867E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TwWo5WKOvSQ0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5022886D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:26 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id d6so20185954ejr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BywL0jlhvMnVFDfC0ze8h5LlMNFaT8aAv2rtyExEJSw=;
 b=QHi5Tbht062uQl2CgFExEPFUSOMEeggyKWMdFMaxe6+Ih4MGawd4RuVAGo9gayKr/D
 2yHM3GwaZiead9mkPgX6CmWqtJbVMVrs1ivY/NsgsQYDy259Sl3XZbv/YgzUgCEEqs/l
 1wsrUeMhNsz49YAxVBQhfhiIj9RG9ULztEQd4Q8H0R1duiNIIlpXMswb/m7QfOuNR+W7
 PzhiKRCjDzvqB1woNt4nMSfQ4i7ZYPwKrKGD1c4qVxpaPGDRJJa1GAWZwDRByPlEFt8o
 ZwW6DJ21TN+PbO9dKjKlAV0aNVKmWm6tq8l2jd4PPsh2rNZxPgV7qhiiUwBiy6U/4PQq
 iFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BywL0jlhvMnVFDfC0ze8h5LlMNFaT8aAv2rtyExEJSw=;
 b=DK7BhcNtBcdx3D3Q7Mrzny5DwtdSutLWrEBREFvxX/J4mu5oZhBW4lZAnRfFbc8j5c
 x91aS1M9YJC8jzA7/4PrwZiqznyq+5nTJTVNUACoUxViY8+K26Sl9LRfBze4bZMF/3uB
 7X6U12rw/aYyMGAsphvYlwBN+UlxE62IluWiUP1NM7agBb/QCpvnGUSc5eEpSX90Tl1V
 YOrC1zk0PlO+UwQJ071jjC0AUnL2XerREzub66NBHn3YjMVZIypRTQrV76oTTBR5GUNi
 uZW7eDjdNpCAYxMISUuHWpTeeaWFPzFARPIJhxTKM6NFScg/ix/B2drROEHMJM86FtEw
 kVvA==
X-Gm-Message-State: AOAM532HmjGdfdRAx+CRwywr2cF+kKwNdQGj2/FyMyCX3rTsKLliL3lD
 aXS/3i9DTKYmVUIKG+NHENw=
X-Google-Smtp-Source: ABdhPJz7rYxC2q7EJUBMGW38zssfKtQqC5IyJS7xjTc/otiniFOliqfObCiKTOcL0cPPw/LW53NfQw==
X-Received: by 2002:a17:906:1756:: with SMTP id
 d22mr8343053eje.29.1596284665171; 
 Sat, 01 Aug 2020 05:24:25 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:24 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sat,  1 Aug 2020 13:24:30 +0200
Message-Id: <20200801112446.149549-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 01/17] ata: Drop uses of
	pci_read_config_*() return value
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
Check the actual value read for ~0. In this case, ~0 is an invalid value
thus it indicates some kind of error.

drivers/ata/pata_cs5536.c cs5536_read() :
None of the callers of cs5536_read() uses the return value. The obtained
value can be checked for validity to confirm success.

Change the return type of cs5536_read() to void.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/ata/pata_cs5536.c | 6 +++---
 drivers/ata/pata_rz1000.c | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_cs5536.c b/drivers/ata/pata_cs5536.c
index 760ac6e65216..c204215e239f 100644
--- a/drivers/ata/pata_cs5536.c
+++ b/drivers/ata/pata_cs5536.c
@@ -83,16 +83,16 @@ static const struct dmi_system_id udma_quirk_dmi_table[] = {
 	{ }
 };
 
-static int cs5536_read(struct pci_dev *pdev, int reg, u32 *val)
+static void cs5536_read(struct pci_dev *pdev, int reg, u32 *val)
 {
 	if (unlikely(use_msr)) {
 		u32 dummy __maybe_unused;
 
 		rdmsr(MSR_IDE_CFG + reg, *val, dummy);
-		return 0;
+		return;
 	}
 
-	return pci_read_config_dword(pdev, PCI_IDE_CFG + reg * 4, val);
+	pci_read_config_dword(pdev, PCI_IDE_CFG + reg * 4, val);
 }
 
 static int cs5536_write(struct pci_dev *pdev, int reg, int val)
diff --git a/drivers/ata/pata_rz1000.c b/drivers/ata/pata_rz1000.c
index 3722a67083fd..e0b3de376357 100644
--- a/drivers/ata/pata_rz1000.c
+++ b/drivers/ata/pata_rz1000.c
@@ -64,7 +64,8 @@ static int rz1000_fifo_disable(struct pci_dev *pdev)
 {
 	u16 reg;
 	/* Be exceptionally paranoid as we must be sure to apply the fix */
-	if (pci_read_config_word(pdev, 0x40, &reg) != 0)
+	pci_read_config_word(pdev, 0x40, &reg);
+	if (reg == (u16)~0)
 		return -1;
 	reg &= 0xDFFF;
 	if (pci_write_config_word(pdev, 0x40, reg) != 0)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
