Return-Path: <SRS0=4CcE=NI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488CAC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 17:04:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F2961076
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 17:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0F2961076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FEC60674;
	Tue, 17 Aug 2021 17:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqVBa0kW8Qll; Tue, 17 Aug 2021 17:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B940860594;
	Tue, 17 Aug 2021 17:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A5C6C001A;
	Tue, 17 Aug 2021 17:04:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8494DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66DEB6061E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwKJ2aB0lqIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8993F60594
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:04:19 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id mq3so57704pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=74Z3GwaGrI/6L9131Hr1UbUOb6HfxaEgTCmH3K6poSk=;
 b=mJsV1EjCjypQ/+hVsiuaTX4jdTaHW0J2geVgrgdXMLGaI4kkfM69xiSPEkYG+0XppQ
 sTHJ+RmAbjFR9HSCTzsNB6avSLRCnQbWKv/V5iuzsqibAv8iKmZcrFTbinA6u9n+eKJ+
 hqbLRHC1YJbvo9nQEp0Dzszz2igME0vh5S6ZmXTAGNvUEDsxpG4g18xIzViIDXkc3joM
 QuUXeK0wLUbII158wLtnW4aF0imAXBPYOGA6hGSwMq6D5lTnsBbBG3vaylwWzZ6EFwFt
 dg4xR5b/CeLhhdlYpNcmdb8Pwyt0qmQyFF4yq4lhefjrNj4g4W6w25o/uGYZ5AXBI0c9
 X38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=74Z3GwaGrI/6L9131Hr1UbUOb6HfxaEgTCmH3K6poSk=;
 b=rhjpmhsNuqe2oQoCeG8rTFiY/+F4ymCb2oH5RFWP0wU+P/FhnHFHzAc1VD0kUTGER+
 uKICzCDt/6JtkwGFyJwhopA+Q8/jFQB8s2T2d819kR/Pe1zqbuSBVLwvxuuDfjgVmMfT
 Pb8x8TiUA56cfhSs13CxWoHszqmSH79ew7BN+kiqYfeLfav1FrXDG0GM80COP1JLAURG
 4klgvEHqpsZv35oPVyGpqOnCDc5ogE1FeNLq94cq488r8fInCosD2pU6YCiYSkk5l93C
 UqrLO/jz313XR7eOn/3K9VOJ06iDT4nMrZROH/1tSQDun3qiTpY6ugWhVPauz5A/FYjy
 BHEw==
X-Gm-Message-State: AOAM532W31yVgLZ0kEXrENvB+r4Qt93ebqaJb/dRpetkSTXC7XrrnKm3
 gZXNDFs9wL3W/z6d7o6/jaU=
X-Google-Smtp-Source: ABdhPJyaiZuQKZeZ5Z5LXSWOAXvDKrX2z5w8aE/fXPs2fir6u76qA821P2ehYwrWLsKR4qx6k6WotA==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id
 l15mr4570586pjq.183.1629219858940; 
 Tue, 17 Aug 2021 10:04:18 -0700 (PDT)
Received: from localhost.localdomain ([49.36.211.221])
 by smtp.googlemail.com with ESMTPSA id 65sm3958402pgi.12.2021.08.17.10.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 10:04:18 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] serial: 8250_exar: Add missing call to pci_free_irq_vectors()
Date: Tue, 17 Aug 2021 22:30:57 +0530
Message-Id: <20210817170057.16783-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Valmer Huhn <valmer.huhn@concurrent-rt.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
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

Free the pci irq vectors if the call to pci_alloc_irq_vectors() fails
or if the device is removed.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 drivers/tty/serial/8250/8250_exar.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index 3ffeedc29c83..38b65d6980f5 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -627,8 +627,10 @@ exar_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
 	pci_set_master(pcidev);
 
 	rc = pci_alloc_irq_vectors(pcidev, 1, 1, PCI_IRQ_ALL_TYPES);
-	if (rc < 0)
+	if (rc < 0) {
+		pci_free_irq_vectors(pcidev);
 		return rc;
+	}
 
 	memset(&uart, 0, sizeof(uart));
 	uart.port.flags = UPF_SHARE_IRQ | UPF_EXAR_EFR | UPF_FIXED_TYPE | UPF_FIXED_PORT;
@@ -677,6 +679,7 @@ static void exar_pci_remove(struct pci_dev *pcidev)
 
 	if (priv->board->exit)
 		priv->board->exit(pcidev);
+	pci_free_irq_vectors(pcidev);
 }
 
 static int __maybe_unused exar_suspend(struct device *dev)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
