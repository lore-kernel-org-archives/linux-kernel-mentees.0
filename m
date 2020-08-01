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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEEEC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D262820888
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/vkOFTf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D262820888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABBF887047;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lms_WDQaXmVq; Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 538C087040;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F537C0050;
	Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B401C0050
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 586F288800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9LP1nMgP3Ra
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC683887BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id di22so16946188edb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ugiOTcKJH92D5ouhrmd6nUXyIp1jeLijZ9Lgi26pKL8=;
 b=W/vkOFTfxzqiiqs5PXjZUT+8QIuU0+pxzpIIqEsz/Iah7QiEJd93HPDsKT8TflOP/Z
 vkokqeDy6Dhfa07r+1amoq4UimqMupmi6vEC/Z2KKJKd/6H6AUQEmduiJ6Zw6DSLqyKa
 jDLhRax2V6eINcLZ1dLJJvXe2155H77nTZzGKcm96vWk2MiZMNOaCqLXan1u6UVF5zHA
 Xeo1r1viDJH1NZLzBOqCaLwtu+Q97vwTx3n+mdsV+zBt3JyuxPiiBVO+wC9XKKShnelj
 4W8tiRi0URtcz+pixxXLjAWPDnYF8u6tA4L7FyczjlelIPysvj9ACtw2Tuc/Fqe6C5+N
 akag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ugiOTcKJH92D5ouhrmd6nUXyIp1jeLijZ9Lgi26pKL8=;
 b=pqDKBFtzYuHfy1ba9B3koRmX/1I3v5J9azjAbk1ds6XQJwkm6KQ2GL9BkL1mEyM7mR
 D8Saz+RAZhmarqhWxqvUKDTSBot6gPHtkWxGG1lfJAFHmyBXm8Pa89tt2hoignzcpQ72
 rVwPHfBPM1R+m9DQJtBoBvIg85kLq9FvdZw5088nvpVV3M1NirH5GYndyidAMo8ee7aC
 PaE35OUiRyMFgZSnlaiR7EPyt6mVBR06mvH4nj4ngm3Ygo9/HqsPkcBeJVmbD65XIeTL
 PP0o0UXGM5wka4KdOVzpdyGc++4nWwfNk53R21XXif0Yc9k2KxSpGizBGn8WbrT8UuWG
 FPug==
X-Gm-Message-State: AOAM533wzVlbj3CTD3qyiWbgdoP7vsJDhI21qer3Ug2YyBu/CJA0vE7L
 TEcCOGOZlq7rcXJzXOzpaBI=
X-Google-Smtp-Source: ABdhPJxHTS05lKwaHfmyLAfUgz62XiabbhKbOegL6lSQtaauPJSHYiZ4vVmubnufMFIzKuHLLLAvdg==
X-Received: by 2002:a50:cfc6:: with SMTP id i6mr8111480edk.88.1596284669219;
 Sat, 01 Aug 2020 05:24:29 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:28 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat,  1 Aug 2020 13:24:33 +0200
Message-Id: <20200801112446.149549-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 04/17] hwrng: Drop uses of
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
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/char/hw_random/amd-rng.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/amd-rng.c b/drivers/char/hw_random/amd-rng.c
index 9959c762da2f..e7bf17eedaa0 100644
--- a/drivers/char/hw_random/amd-rng.c
+++ b/drivers/char/hw_random/amd-rng.c
@@ -141,9 +141,9 @@ static int __init mod_init(void)
 	return -ENODEV;
 
 found:
-	err = pci_read_config_dword(pdev, 0x58, &pmbase);
-	if (err)
-		return err;
+	pci_read_config_dword(pdev, 0x58, &pmbase);
+	if (pmbase == (u32)~0)
+		return -ENODEV;
 
 	pmbase &= 0x0000FF00;
 	if (pmbase == 0)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
