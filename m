Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2A0C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 13:20:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD26861613
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 13:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD26861613
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1373401BD;
	Mon, 29 Mar 2021 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SG4sdVFsz2wp; Mon, 29 Mar 2021 13:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E13D440112;
	Mon, 29 Mar 2021 13:20:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3A7DC000B;
	Mon, 29 Mar 2021 13:20:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97EB0C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F3D340279
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7O7v1XKrGSo7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:20:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BB4E4026D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 13:20:25 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id m11so9831218pfc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 06:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JwsYQU1DFQ2M+ekJ6ppgtzSpS7I0JHxVUkdRYp5wdEg=;
 b=XrH8dfshMyX3xL7fehAPt61ew87yhjSA+3XOfDhGCmPYqYTG+B6siovezQEera41Rh
 YLFDFRlh0pVuIel2T/QwtWCKJD2HY40sletmWA4s1G1eWegtef0eJP8oWUCLlB7yFMVF
 am9P49fbvso4/FfPywZEpF2xsOFPOVRIEbRgQhIzmGM8cbQ7bgO2a8/NtbbSdE/Nstc3
 AJQTxdGobE7vYDfEQQ/T9Wc7aIwRh57KPUCjBt3cdU6+JS9GKM7WCnqz6r9V1p993QeE
 rOMTsilZDlkSRjZ7auF2p8mb+RYK0Q7Dbbf9mtarvgbBCRrW0b0Cnb6KP5B0hZr76fwq
 GsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JwsYQU1DFQ2M+ekJ6ppgtzSpS7I0JHxVUkdRYp5wdEg=;
 b=jYd4aAYMlg4567pie91oFqab92t5DRnYI9edj4I49CJYrvM5o3CD1s6RqNZbf6E/YN
 WmYK2ugFHwTD9T+ApEtQOV3o9ddJ1anQ55Js42lHjghll9N0D56j8JDVXAyU06BFbEI5
 zP7sA5u4ZMF+XBkS8SZd4FE+M/cmN5uWZ8NOh8XMvAg2906VO8NbVmZ/6T8iGtmBKT1R
 Cdk50FYGH/UTLTT0Y91mdBibCTpdmiwH++e3xY8RMILkyzT+MCsMQqH2kDty9UsbSRZT
 2BvcYSZPzsc4l2axmUFeMObnjVQPH0KBtTcqCcRBM5j9DRR+sl8+Xqe2+v6afFyNm331
 DNTA==
X-Gm-Message-State: AOAM530pGZTBOgRlNW49xJ/ck4G5SZJZD5G+V3ZqIFLhvc1/ROuXJ+yy
 yNPGjE3xyxUNxCBSKBiJR44=
X-Google-Smtp-Source: ABdhPJwEbRC9afY9WoMpQsBmFY1j/sgDu3pgz3Ebhpc/xBpfP+Rog+bmY7uNbzsOyaz66u3kiBjsYg==
X-Received: by 2002:a63:3585:: with SMTP id c127mr18073691pga.92.1617024024333; 
 Mon, 29 Mar 2021 06:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 t12sm16415838pga.85.2021.03.29.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 06:20:24 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: patrice.chotard@foss.st.com
Subject: [PATCH] usb: dwc3: st: fix incorrect kernel-doc comment syntax in file
Date: Mon, 29 Mar 2021 18:50:14 +0530
Message-Id: <20210329132014.24304-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, yashsri421@gmail.com,
 rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/usb/dwc3/dwc3-st.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for dwc3(). Prototype was for CLKRST_CTRL() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 drivers/usb/dwc3/dwc3-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index b06b7092b1a2..166b5bde45cb 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/**
+/*
  * dwc3-st.c Support for dwc3 platform devices on ST Microelectronics platforms
  *
  * This is a small driver for the dwc3 to provide the glue logic
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
