Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEDBC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D026105A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9D026105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EBB0402CD;
	Tue,  3 Aug 2021 14:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9KaL8ejBU10; Tue,  3 Aug 2021 14:21:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D27B400F2;
	Tue,  3 Aug 2021 14:21:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BD2CC0010;
	Tue,  3 Aug 2021 14:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E2FCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 508A3404CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2xV_77ONAZH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3790404BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:21:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so4047563pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cjJcYm6ukuHvF1VeTN7Im6jNgf92bM82AxQ4ySv6jgU=;
 b=BoKIGgaW8x47E4wei36R5h9/iXEJv0y6gH/g06O+ngsmMtFQUpqZ/vdr+iaYF0gUIk
 qJQt1Zr3F6FZEPhfHkagxeH8k+VGVY6Ax3eeHMYTJuxMTl6B9sSmua2bU1PQyFlROTUs
 kTJCWQXSrnQ7gMar7FeMcSUlUSG0ZPY58QaFE6MPl5uAhU48XqDY6B0xMcDQk1JnWyuC
 xxEQVbEVITysjCe8io61bFq7Vr9TOmdtZXDij0nfaqRV4WzcUL9z2XIUowjx2PYG3zHC
 s4LsVTT1PAShvGqrLzEHZZvQ4yGOtLxqKQPAkLDfZcEW7b3Bsf+iGdIZcBzZqQl30mf9
 THWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cjJcYm6ukuHvF1VeTN7Im6jNgf92bM82AxQ4ySv6jgU=;
 b=CupS10DdXxmC9xrCuzu+fhXSBcSAuf1QKbPsiFX9ARM7byijZQXpL3HQqBGoistOs6
 12agGsBhII0Mw44P3f42uTl3T9dAfgrEvRFFeCk0VfZ2YgEM5HsRXnkF1MrrqID+G1ge
 KwWdI8yfRsX6gBuAbLBM8mjKzXkcsqrFnTlFyFry9sQyDXGOd6dkbLrGfthjcA+9uGgr
 JGC9RQRAvJyR88tFpKy+CsXLy0h0K1aqkMoRB6ezsZdX57sG4+Rl2NFeo970aUwR6NfP
 tvuuA876vHN965iTWdOiEw2BkCTdy6a8agAXCghYBPNK4s5jgQ13QRHgWTGFYODCp4xS
 yvIw==
X-Gm-Message-State: AOAM530I85cVac1tWC/PJRFiEk7QpdP632cqmKyTfqW6p42z2Gobalby
 QD6/KjghYDbgyIRKBhgcdrM=
X-Google-Smtp-Source: ABdhPJwErR0hjibjn8e6hmkqlyyceD+f5+LUyKBL8OeVUAVMdXyJ65DHYTT9auIitIAOopEpqFvkiw==
X-Received: by 2002:a17:902:d682:b029:12c:13e9:adaf with SMTP id
 v2-20020a170902d682b029012c13e9adafmr18700101ply.74.1628000460080; 
 Tue, 03 Aug 2021 07:21:00 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id z33sm11490738pga.20.2021.08.03.07.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:20:59 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] USB: serial: iuu_phoenix: fix checkpatch memset warning
Date: Tue,  3 Aug 2021 19:50:45 +0530
Message-Id: <20210803142045.17082-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This fixed the below checkpatch issue:
WARNING: single byte memset is suspicious. Swapped 2nd/3rd argument?

Logically the code is correct, but it is unusual to use memset for a
single byte only. The same can be achieved by using a simple
assignment.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/serial/iuu_phoenix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 19753611e..6bab12f4f 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -253,7 +253,7 @@ static int iuu_status(struct usb_serial_port *port)
 {
 	int result;
 
-	memset(port->write_urb->transfer_buffer, IUU_GET_STATE_REGISTER, 1);
+	*(char *)port->write_urb->transfer_buffer = IUU_GET_STATE_REGISTER;
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
@@ -1056,7 +1056,7 @@ static int iuu_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 	dev_dbg(dev, "%s - initialization done\n", __func__);
 
-	memset(port->write_urb->transfer_buffer, IUU_UART_RX, 1);
+	*(char *)port->write_urb->transfer_buffer = IUU_UART_RX;
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
