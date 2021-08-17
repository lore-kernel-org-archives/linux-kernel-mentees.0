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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9112C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 08:15:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5895660E78
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 08:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5895660E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF1D607F8;
	Tue, 17 Aug 2021 08:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_vbRgbs06R5; Tue, 17 Aug 2021 08:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E4CEB607F5;
	Tue, 17 Aug 2021 08:15:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C70C4C001A;
	Tue, 17 Aug 2021 08:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A35E1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 08:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B9B14048B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 08:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-_kR2_Gt74i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 08:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FEEB40482
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 08:14:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so3839351pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WCp8noSccte2B57AIkhkKtX0SS0VncdQyviMk909mfM=;
 b=VFHPjEaMVaSuu/WtG+/pu5/GTX7hnLMHr0QpzkV7whvPns3ADAaZBe8HDqpjOdFXQx
 qqdf7Ih1PpIgs9oO+1JVwH19Xt+YM6y4yXzI+VHtqX2vmQMyPdJ6OdQHnPJMzA2Pm7tx
 I2UYbySGeg+lWShsUE+O5vRrR9I4dYNohzxzlOasCUg2DdF7nscnz57oDJcAgebB7bLz
 ryZWCuMhixUDt17AZMiM/hUBdFRDZnPZP4IiWfIcsIpTH9K4FUeorNgmgVk6tGjsxySh
 Je7DTLP7zcAvlpqnJWskJ/2ROn73rEvaWXP0bwHemrCl0OllUi2PKUxpa0Hj4d7uU/g/
 y6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WCp8noSccte2B57AIkhkKtX0SS0VncdQyviMk909mfM=;
 b=OHqTJbf8WHABsLV25K8fiw+ky6IHTIsCwXuq+OPJ0JG6zOIj45M571PWxwjfKy3EHK
 4AxopzoTHlrtWtGwDDO6EhpKbmUKmh3fPUOR8pgHarCEj5GKkR7Cz5LvBtpHUWX5V3X/
 DxgwCDuNUZMXsNh7LN9J5TSvQ6dapekQpA5tHMBM1AJ5CQI21ZLmMu7nhULE+FXqdDRC
 Cw/h2yENoTIx9WYhL546go4Q3B+lWluLf7rON4PovVJ/vYCBcQKleGz7mBaGbTBSIFSq
 jCLjDmeDBA/i9C91s1CIwAXDZjFxF4bOb3UGL2/lg0Il/DuvJJVUDt4/MIpZ9U1Giy61
 q2RQ==
X-Gm-Message-State: AOAM531JokciJdMoabiBmRaFFvRO4C8xM9izT8GfFu0m/zW1NEN9IQx4
 myOJlbnEtcYfvJA9KLx3+yI=
X-Google-Smtp-Source: ABdhPJweRksqNTFuRv+jSndFB0RZaTfEwZZsX+QUaVfXporkhL5jdLJ3olG7lSAgdNGypubz1jHEyw==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id
 oo14mr2489762pjb.108.1629188097947; 
 Tue, 17 Aug 2021 01:14:57 -0700 (PDT)
Received: from localhost.localdomain ([49.36.209.103])
 by smtp.googlemail.com with ESMTPSA id b190sm2079847pgc.91.2021.08.17.01.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 01:14:57 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] serial: 8250_mid: Use pci_irq_vector() to get IRQ
Date: Tue, 17 Aug 2021 13:44:01 +0530
Message-Id: <20210817081401.3440-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
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

Instead of a direct assignment, use pci_irq_vector() to get the
Linux IRQ number.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 drivers/tty/serial/8250/8250_mid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index efa0515139f8..3a279ce0e904 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -299,7 +299,7 @@ static int mid8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	memset(&uart, 0, sizeof(struct uart_8250_port));
 
 	uart.port.dev = &pdev->dev;
-	uart.port.irq = pdev->irq;
+	uart.port.irq = pci_irq_vector(pdev, 0);
 	uart.port.private_data = mid;
 	uart.port.type = PORT_16750;
 	uart.port.iotype = UPIO_MEM;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
