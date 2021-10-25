Return-Path: <SRS0=xjH5=PN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810B6C43219
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3274860F9D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3274860F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73AF40442;
	Mon, 25 Oct 2021 17:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbXzs4inKCqe; Mon, 25 Oct 2021 17:01:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1ED0A40445;
	Mon, 25 Oct 2021 17:01:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F30C9C0019;
	Mon, 25 Oct 2021 17:01:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DCD1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E21980EFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2NN0tXsQ-5c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A4F80EF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:53 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id c4so11544143pgv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzDmm1CSO5ys2u/cUDBI2TYr2rN5kWaOTVprB8Ko1Uk=;
 b=ZHdhSeGLURPzXaswSnZGMuZ4LcxM/+rFjEy7pPEM4C8GYgNJCYn1yIid35ljsILwQh
 U67jlu8fWxehMhq7EiQY5KE11JOQg4hoZwWbNbk61OPyY4blm1uk4YXpwJbYlOSQEGVL
 LyFNcjlOnkQHLDXAwhFbQ5tKmV62LSf0LwtAaIcxKFXkXXKeDJLLBvLoLItgpm/b1lE1
 nU+jaOi2JRN5m7b2SBmQ1HhRYU4l2RwPPDrsDxaXNfxqkUhoVDn8tN3pMYujXUAbuNuN
 cBnR7a6eqlbNs8opvXdJoT7Pe5DChrLafLFE2RQwHrcG3/HjMruSaPOds39rtNr5agiu
 ZeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzDmm1CSO5ys2u/cUDBI2TYr2rN5kWaOTVprB8Ko1Uk=;
 b=RwpQliTKeFvBx379RIJjOTJLtaUtIy1whab2ebekaA1Gq8TbQM9bpnOy+UrmBQZjaN
 9zgCrWxY9VAH7MbtPRaNDqcFlejthzYZ+KUosv/RZxRtJQMfmk4z8NyziEEgGWJtYiQ3
 9g3/wBBO4deJqp3vrpEbJINtkWNaCDfT9t7GA7knkdoGSa+C8ZKJpmuaKr400sxXYOIm
 A4KUU7w1zobuRGmLknnae9AJsUWgGjUdIEmlluRCWPeuLMOxHujLsxoCdRa2lwV7JdUD
 meGOr/zSOUv9/x/2kOK0h+a+pSSmwspqG7/k5ez8TsZkROLzIoSIDV3TH2SrtX4FwiHk
 LWJA==
X-Gm-Message-State: AOAM533aEAJk5Jd5Acyd16rGJNQ/7OIh0Pl2dL3Qjt4ucRSnHtWUexFP
 6cLN0OqRktUOvRIlB87xXM0=
X-Google-Smtp-Source: ABdhPJyH7J/iuk4Y6eYOW7ZypxU9kq4dQSkqOm8XsvftCh8hBtHp15bTqEuxROXH/SA1ZGpJoWeNDA==
X-Received: by 2002:a05:6a00:88e:b0:44c:c40:9279 with SMTP id
 q14-20020a056a00088e00b0044c0c409279mr19791608pfj.85.1635181312767; 
 Mon, 25 Oct 2021 10:01:52 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:01:52 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 1/5] PCI/AER: Remove ID from aer_agent_string[]
Date: Mon, 25 Oct 2021 22:31:00 +0530
Message-Id: <a205d9c83f89a0942a3302bfa6e300121381aeb8.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Currently, we do not print the "id" field in the AER error logs. Yet the
aer_agent_string[] has the word "id" in it. The AER error log looks
like:

  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)

Without the "id" field in the error log, The aer_agent_string[]
(eg: "Receiver ID") does not make sense. A user reading the
aer_agent_string[] in the log, might inadvertently look for an "id"
field and not finding it might lead to confusion.

Remove the "ID" from the aer_agent_string[].

It is easy to reproduce this by using aer-inject:

  $ aer-inject -s 00:03:0 corr-err-file

The content of the corr-err-file file is as below:

  AER
  COR_STATUS BAD_TLP
  HEADER_LOG 0 1 2 3

The following are sample dummy errors inject via aer-inject.

Before
=======

In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
the "id" field was removed from the AER error logs, so currently AER
logs look like:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID) <--- no id field
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

After
======

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

Link: https://lore.kernel.org/linux-pci/20211021170317.GA2700910@bhelgaas/T/#m618bda4e54042d95a1a83fccc01cdb423f7590dc
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/aer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9784fdcf3006..241ff361b43c 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
 };
 
 static const char *aer_agent_string[] = {
-	"Receiver ID",
-	"Requester ID",
-	"Completer ID",
-	"Transmitter ID"
+	"Receiver",
+	"Requester",
+	"Completer",
+	"Transmitter"
 };
 
 #define aer_stats_dev_attr(name, stats_array, strings_array,		\
@@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	const char *level;
 
 	if (!info->status) {
-		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
 			aer_error_severity_string[info->severity]);
 		goto out;
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
