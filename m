Return-Path: <SRS0=dZTT=OZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C506C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:19:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC54661381
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC54661381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8985E60C1C;
	Tue,  5 Oct 2021 17:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVd88fs9WDX7; Tue,  5 Oct 2021 17:19:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9E2D160C0B;
	Tue,  5 Oct 2021 17:19:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 797AAC000F;
	Tue,  5 Oct 2021 17:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86685C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65B3340217
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPSVfckR5Veq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A701401E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:36 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so2527292pjc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Oct 2021 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjHgR4yuS2vTaKg7fKfhOjl8nNl87X4AMEmWTqe3CAo=;
 b=UvpRegiHO4NAWwEm0An/S746HVyraL1+IKlEUHsK7b4F732ko1nh7S4XAi2+ZFi0b6
 bj5GWF90SjpxzdpcbIVIimMhy10JdsL4iUHsdJGc7jTOfFL5A/B863nlU7PLVeyVe86m
 ttiIP1ALgJkzIYlfgAGNKSIlvlHYsd1kA3M1Rs2Ot3MNkOwV8KjIalam0TrlZODMnqkM
 dwaQ6z9hB42hc5w5gQom8SeKIt/CGM5sRwLYouk6LtfJmwRoxXlZAZp9uFb3M2XuSv9o
 5Yf9C/0A8wDenXF5AwdJW1tVNKkVNrkT7LdOXxhF+wmBMKU+ZmbfNqmGwS664+mwVcrP
 8R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjHgR4yuS2vTaKg7fKfhOjl8nNl87X4AMEmWTqe3CAo=;
 b=Z2rHdrugj1BGru8f1Ndkk836E/RhVyHUmKN9MGIoXQj5mHBClji9J21CC1E6TlZOYG
 KC37MdACuvNJS7yp9zz8UznQUGJGd+tGtnXDjBiq8+WiXXvQJHlZVGqr90a4424J+NSz
 861+IDBxuakICteoFy6uBaS9FSr2C2Xk40j1I43CWRUvLmSS9i9/+U+K4jGbMrY36+tR
 I4SjEYEWfqr9uvpp6v+VIc/U7YYrh2/v98WW6xJsaP8prQiiLRnWPm+3VuTdAJPTP4WQ
 Avlpo3qnZp5b6ERLkwxBy7S4pKqkcOnEFgXfl74mhIFKuaTP2wVhwUssRnIAQyEcTu7G
 vzhw==
X-Gm-Message-State: AOAM5311TzHMAh78C+Brku/4xH9hOvuVbdRbpBU49777nsKQCd1EgMGa
 YcIWNoeKND+jmZG+QZmw1ek=
X-Google-Smtp-Source: ABdhPJxzVl2CYXY1+jXkMgxI7lgjA4Vhcp7jsudKPrO1RBAfCZVLiTcwITS9ttdeflkxxCh6kEfNHQ==
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr5241539pjb.183.1633454375892; 
 Tue, 05 Oct 2021 10:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:19:35 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
Date: Tue,  5 Oct 2021 22:48:08 +0530
Message-Id: <22b2dae2a6ac340d9d45c28481d746ec1064cd6c.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
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
