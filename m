Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB80C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Jul 2022 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FF8F405B9;
	Sun,  3 Jul 2022 19:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FF8F405B9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aSdePPka
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b8XUWVxMaxX; Sun,  3 Jul 2022 19:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 78B7E40519;
	Sun,  3 Jul 2022 19:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B7E40519
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42CC7C0032;
	Sun,  3 Jul 2022 19:26:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F96DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64864410E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 19:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64864410E7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aSdePPka
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSEiFcjyWEdC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 19:26:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24156410E4
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24156410E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Jul 2022 19:26:06 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id l12so1473828plk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 03 Jul 2022 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ko4FLx/zT4WyjidusLHvpuHoIsoPjnk74mrmMkIRO34=;
 b=aSdePPkaoiggVQvZTHd0K8u6V+AHMuklxapVQ+2i5AWbeU8NHrmU5QqWEhoxHzIGJ6
 YudfyhsmJlv8i2lKL5Hmqdo5fIs2da6Z4CdCe/4VFFoLMTRKop3pctci2TTn58/J0iau
 wI/T7ZrJDFxrY713Jpd9o05JRWbPSuFV4lgS/SZLftRUVoh8sIqhCehgnSWgkBdapf2+
 86e4vqu2E7cxgY5b9l+8XqiEfBEJYzT3GkwbT8T6ct+rnOMg309m13iI64cGNEG0Gj1o
 ytOASkzU3tfffpp3eyVwLFzg4gUoKRAZ6OtTwZ7iZRrpXQ7g3+cdrZ2Mh9/WntPvmThK
 9/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ko4FLx/zT4WyjidusLHvpuHoIsoPjnk74mrmMkIRO34=;
 b=c/3MB0JkEz2uJ/axMD7brwLgV33H5shH0CASbf1Ld4AgZzjg1Y/uMfIG2rGexJ9a2y
 OgzqoFaFmkW5fdTazFuX1aAhswtoOMj9McuNGg7Bf2+jJ0yz73AnfJW21diu3XJBH9GW
 HyZYRFpVAm9xatwGkkDinMFPcGTa3Q2c871EHIVQLYsWRpB/n8RfuTT/mID1pOs13FUB
 zyRjn9dQPhaSvMdjmVD+S2I+vb8ZzfJIExph5DxgUt2656Psgk/uOMcTVSRH5YmWGYwE
 yUXrpKEUJmSJzqAo0TCQzSfD7guB50Jr+0Kmt3Ea8LvzaKaZX33Yo1trs+hlIFd7tdZY
 5I2Q==
X-Gm-Message-State: AJIora9G5dZng4Snhekwg5Ifx4RQ1Wo5LYoBzyTdD8KP0KYTEfWn94PW
 xXwSHASG3H1cfBI9FS+qJT1TlAtXKN+H+yhK
X-Google-Smtp-Source: AGRyM1vRgNbXzRNTe19H3aGcY46VOCbn98Rj38c8aEYnLB5138lI378QP7k4qXTLsoPtTbXjvTPm7g==
X-Received: by 2002:a17:90a:af98:b0:1ef:1d10:c052 with SMTP id
 w24-20020a17090aaf9800b001ef1d10c052mr30691024pjq.111.1656876365391; 
 Sun, 03 Jul 2022 12:26:05 -0700 (PDT)
Received: from fedora.. ([103.230.107.40]) by smtp.gmail.com with ESMTPSA id
 s91-20020a17090a69e400b001ef831a2015sm1341876pjj.22.2022.07.03.12.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 12:26:05 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: Describe function parameter 'mult'
Date: Mon,  4 Jul 2022 01:24:48 +0600
Message-Id: <20220703192448.13763-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Pavel Skripkin <paskripkin@gmail.com>, Felipe Balbi <balbi@kernel.org>
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

Currently the parameter is not described. Which triggers warning when using
make htmldocs. Fix it by describing the parameter.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8716bece1072..e8c86b08cd83 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -657,6 +657,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 /**
  * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
  * @dwc: pointer to the DWC3 context
+ * @mult: multiplier, 'mult' value for SS Isoc EPs
  *
  * Calculates the size value based on the equation below:
  *
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
