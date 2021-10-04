Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698C9C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:31:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1803A6136F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1803A6136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8F8415DF;
	Mon,  4 Oct 2021 14:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8YDXcdlxBxv; Mon,  4 Oct 2021 14:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0F995414BA;
	Mon,  4 Oct 2021 14:31:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0141C000F;
	Mon,  4 Oct 2021 14:31:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEA26C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1FEB84C23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1d4THJ9PKNk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07D2081D02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:12 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id kk10so2400332pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGisZgUAndR6vbypwD4J77Oe+tJJydzPHMGBtKSc8nM=;
 b=OYkLF4jRenzIQdzKZe4qmQGMnvSK+jQXdQiOwjvl48ofn2l4BMD6xrqcWDUEhBcG52
 H0YZnDmK586+ADSnkPq2vWqxLpYoz+Dq9/jsl1ayWVFRsgrTR2HscGQxMv5QIypM6J8w
 IF921DChGFUU0Ubx8nyIOpaVWw+LRHsR/bbCwxOtGcPsWid9Gjvlmxq8ZiVPAUKx9lfH
 x74zbeEid+g9DBFRkWoOpQxyrXXRmSqTa8vzd+rpaYP+vP04HOdRd74zaMY+qd3Zu6/l
 1AfQmiDWypumIYTdoL0WXRc3u7ol/OuF0/2xM7m+HWWZZ7aIrfErYnFcc2d9kxS+SbNf
 qNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGisZgUAndR6vbypwD4J77Oe+tJJydzPHMGBtKSc8nM=;
 b=2xhab3I4FXNjsKeDyVGFVSnbd7VotzyexCMLM1lAhguAE8fuo605hLqeDuP4krWqv0
 y7RiutYXphGG0bwGfKuzEIxd0jjeaWZk7NajZ41+PupezMGAbGBXLM8aBR/Igmpa/nNw
 IunuloSewWA8cH7Cr9pbdi8kLxM+nkifBoYbcNfiIC6VoKLT93KlrDddXTI+TqaE4yYw
 pofMDtVSBuq7bxVpJr+1K5JGyip9lVMUVBoXnEHhJKQHpBFHwunCd4L7+z5UvzccSa9y
 0323XvswdcFVyUrngCz3xlHng3bBJqVO9KpsqOPjaeCf0ga6Odeksu5qtykMQV59Qo6q
 jsgQ==
X-Gm-Message-State: AOAM5309mdrjMJ0LDuUFfgeJcdnhle4ErL0m3gDLe9EZszvPPqabOWHf
 QfdgTD47EvPfZ9M9lM+rwDk=
X-Google-Smtp-Source: ABdhPJwRGQEgFTrP/TcZFfidHVNYaV6yZnACSRUkg8OiMIzlF+QimixqzYdMrw3SzsANwkLpwHyDkQ==
X-Received: by 2002:a17:902:d50d:b0:13e:a44e:2d2a with SMTP id
 b13-20020a170902d50d00b0013ea44e2d2amr10557059plg.89.1633357872271; 
 Mon, 04 Oct 2021 07:31:12 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:31:11 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 1/8] PCI/AER: Remove ID from aer_agent_string[]
Date: Mon,  4 Oct 2021 19:59:57 +0530
Message-Id: <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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

Before 010caed4ccb6 ("PCI/AER: Decode Error Source RequesterID")
the AER error logs looked like:

  pcieport 0000:00:03.0: AER: Corrected error received: id=0018
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, id=0018 (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
the "id" field was removed from the AER error logs, so currently AER
logs look like:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

The second line in the above logs prints "(Receiver ID)", even when
there is no "id" in the log line. This is confusing.

Remove the "ID" from the aer_agent_string[]. The error logs will
look as follows (Sample from dummy error injected by aer-inject):

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com
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
