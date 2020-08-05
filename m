Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82467C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:38:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4740A206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBOMnrtN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4740A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11CEF88363;
	Wed,  5 Aug 2020 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgBBUAZgi5dj; Wed,  5 Aug 2020 19:38:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC85E88362;
	Wed,  5 Aug 2020 19:38:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8575C0051;
	Wed,  5 Aug 2020 19:38:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1F88C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BB8588458E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQEfca8MAZSb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB10084526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t11so6154689plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8aaXnFcZ4AT3389+t0qxS8pbT28OEw3qAsjmqDR3UE=;
 b=BBOMnrtNFHReBjXDeCiLjMl9olE1dPUW9Qju+IcKdTK3+9GmtDNFNKlHOTHl1uT1iX
 12vARS7LIHCPWquRGW42vrmScp10LsjoaOh9dHQ0Pkwx6nGWmfupqAO5cqk3TQjtZmCA
 3oS96NPE7nvwK/tdJK7yxY+05tEuNJleTWQCgSqMAwuIj5P/Qk9yOFwq3zOF5SwGGSLs
 O0lGc7m4Bo+I0Tr3PxKczoeIxuQx9Hh+UnUpM11dJDvm2RCMSS/ybQ/vscp7poo+tUki
 0tZuc7tMl6Dyxb7+Vld7soicjuNyNE4iZb5B4jKe5m+yXmNDZGm6KyeWicaoco0Y7lYQ
 splQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8aaXnFcZ4AT3389+t0qxS8pbT28OEw3qAsjmqDR3UE=;
 b=Agcx0wlzR2OAfZimR9WMPsQ1sw+u7es/4PZTwoUCAq1K8CBG9shOWFEA/3eTDk+NAb
 3GlCamVaixvsdXXvfByvx/NOAi4geXCxDpfE1+VXwDGvhM1TwOVB8U0ktlkBM/0FZ3nr
 ZJ3lH5QgATPmdy5RUlskPZ0WMyg+r0C+sKWA69YvB5qPc1uSEyY77VWDsKpOEa/3U5QB
 cTO3k70UcKwNosgJi53zjR7Q3d69spcqvMNZSISLcK43E5Ewv5Ijq1+JTusSK85iJ+I8
 nspZlTxgKQnhpxKVGqB45Bt4uqepIBCE34/MyiIUYU/S6cobtgdrPBjBSdV5yI7rUgab
 VSxg==
X-Gm-Message-State: AOAM530WFyIw8RXsLKrBQTzOtgYAYx4AmqVlb+kbf4nOEz/TNeSv0NJM
 fUrjrWsURW9n2NUZ7b0JQhc=
X-Google-Smtp-Source: ABdhPJzn7Bj7lt8lc5KhEfI4kSkNrIrHdD2blN71urAzi5cr8ZEUcmTH30mCT37gF5bvmXT1w9iMYA==
X-Received: by 2002:a17:902:6bca:: with SMTP id
 m10mr4508470plt.210.1596656330165; 
 Wed, 05 Aug 2020 12:38:50 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f20sm4901764pfk.36.2020.08.05.12.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 12:38:49 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Date: Thu,  6 Aug 2020 01:06:15 +0530
Message-Id: <20200805193616.384313-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805193616.384313-1-vaibhavgupta40@gmail.com>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-i2c@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] i2c: eg20t: Drop PCI wakeup
	calls from .suspend/.resume
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

The driver calls pci_enable_wake(...., false) in pch_i2c_suspend() as well
as pch_i2c_resume(). Either it should enable-wake the device in .suspend()
or should not invoke pci_enable_wake() at all.

Concluding that this driver doesn't support enable-wake and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
.suspend() and .resume().

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 73f139690e4e..eb41de22d461 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -879,7 +879,6 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		return ret;
 	}
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
@@ -899,8 +898,6 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 		return -EIO;
 	}
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
