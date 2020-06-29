Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743BCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:33:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E67A206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccEw8pDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E67A206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0481086E7F;
	Mon, 29 Jun 2020 03:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M8Zz_0pxLjZ; Mon, 29 Jun 2020 03:33:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAC1986D36;
	Mon, 29 Jun 2020 03:33:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC722C0865;
	Mon, 29 Jun 2020 03:33:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5D96C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D83E622721
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hk19sX5mgGrx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 1CE69221C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id 35so6559826ple.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Jun 2020 20:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYJKmE7yRo1ixIz8HpJIKtPVneklCF0ayYZCHIK8EeE=;
 b=ccEw8pDgO7NJNzDs8/7IFb44i/405jgQahmjmw0raESl6GJAwudPJl180HDwTGkU5e
 m9zB6pFPv73MAAbRbVnUMpdnbfsfT6uSWw81J4okpgmBtFr3tKTSp+wwoIkvMzUAO7BH
 aGc6sEa3/+MeaXkgXdnUtL7nd/Ze0m6L56MgGDTN3c32wyW6wrb2oXoa/J9miE2qLHT4
 ByBWtU8m3FeX1BhoZfTUgMZGBF+d5jFkEzkoEjUNwHKIoV4lHjOkdXumOjzRSi0njIBD
 U0bcJOaNPqsscII0jzSX6EZlbGuSk2uZmqR0jLIslptv4DutAKZ1HN7akNTVlTSFxL/v
 cWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYJKmE7yRo1ixIz8HpJIKtPVneklCF0ayYZCHIK8EeE=;
 b=prR63tmN4bF1mWiM7HNX4GbFdYZsMzgNgsRIfZ0DDXZJbDzIwlIwpJLm6YQ8+8XNF3
 emuXpPwf2GhCTS0STgVc7MtBZDQvDUrwmxDSVMdm2q1X8hcx4pkvOsLfJ4PFNUuiPf6x
 QV4DfVvI+8k/WMIPy/jgC8IwsOFQKqKx/OOGUvKza12B98IyTOTzoXIzPl/741fMfk1L
 upLxyoFdBSUyUsbxeMZiig7IHwByZlBTp60tcRa7MMr4SvulTO++ey5OsRmOV3KOPDtk
 L61U4cdS9fg7udENcfisUpQFIn70PbSF+p/J0L5G0aGzlR4J375NwDGlFMf/Z3+K8ewF
 XEZg==
X-Gm-Message-State: AOAM531Qu668+Mjqp6d7JWYih7AnzQHxYoiToGi0OTThO2TnU3KuaAkH
 4E5UvrQw3k70vY0JZV7yT48=
X-Google-Smtp-Source: ABdhPJz+JdBvOqVV/+8nOkMDZE+YnbOlM+MtB6ZHTco9p5/atAcS3aB8wtXbL2GHSw//dWLW9U0lww==
X-Received: by 2002:a17:90a:ea84:: with SMTP id
 h4mr4007676pjz.128.1593401619651; 
 Sun, 28 Jun 2020 20:33:39 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id e191sm10679196pfh.42.2020.06.28.20.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:33:38 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 29 Jun 2020 09:02:24 +0530
Message-Id: <20200629033226.160936-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] ipw2x00: use generic power
	management
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to remove legacy power management callbacks
from amd ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (2):
  ipw2100: use generic power management
  ipw2200: use generic power management

 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------------
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++--------------
 2 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
