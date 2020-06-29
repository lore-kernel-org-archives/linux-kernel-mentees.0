Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B681C255C8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8/CAFiD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B681C255C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9397A87417;
	Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7ggsESjj5xL; Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32F1187446;
	Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C369C07FF;
	Mon, 29 Jun 2020 17:36:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1439CC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 031558874B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5f9T-6DwDJS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 881C888748
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:13 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j4so7370919plk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0sYP00DyHcgSiz/UpCj0vFSMqhUdJtVPzxSy22jFRs=;
 b=X8/CAFiDKcy1LRoopU/VXQqrF/ZXGGSBw4D5FArGbTOu2n4JamyvFgiWlugGFsqSWM
 /9xVgVu+f/ncxxEz0VlzZr31y1FxZzC8Jc+sF648c86tQga2eom8sl6/lfJxOcC2zbt3
 nfj2/wL562qfy3sqaGoUnWITVNcwjvE/Df3g3LcC+6PyutlOA9UrYFg+s4HWkAao31gd
 sjRuHnBD8imlkO9/NQEO6ZY6sbgFNfk5G7L7A3OtSQhS5yHQ7ZRroV6u+Zz/9N2L7ACz
 SpWvD/+s2hgECa2/k9Apgoa1nwhlGvHGZNScfJzhTUsFEHyivbspJCM5V40cttfUNNBU
 ti3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0sYP00DyHcgSiz/UpCj0vFSMqhUdJtVPzxSy22jFRs=;
 b=NUIDo6VgdASYZARtFaT0WirC4wTCQxivD65v9VciBUTZKjbcAnFzdy/Ct5GT7X5s7z
 sG+X+DPm762s2k+29EX4vUnvraIM3kWOorjrPk1ZmFErib2LQejs7cBpMXznmjRYW1Dw
 tfQOUYwa5DXgSPfY3qeNCbo2y2vzadoMSBpyLv7m+upJyhSv6yJVMHyt/9mMvp09NTbB
 k1VujtaKgJ8fkDI5Ql+K994JYmUK1WfM31bCsBSjJ0qs9hh33MPL9UtL7K8opMaw1b6Y
 xKBvZJtNO3AZ9WNYudDeJw0lEJxY1L9HIsQzrt1mRM18W75/H8mbujd35XA/Jxlm4zi/
 uDgg==
X-Gm-Message-State: AOAM5307aLU6q4IEWUE2sOJbasImIiwJ8vR4wPtIO5GCrzx5DgHNpRjE
 muibrYFTvoai3lfvNHES/Pw=
X-Google-Smtp-Source: ABdhPJytPqaMuxgD0wTHbLQsj7ArRGy3HFUVO8WFw4oHOZsTmYK70wTx5FpJaZY3EXhIhz/1MrYa7A==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr11765030pjq.185.1593452173081; 
 Mon, 29 Jun 2020 10:36:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id k23sm331461pgb.92.2020.06.29.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:36:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 23:04:55 +0530
Message-Id: <20200629173459.262075-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/4] drivers/staging: use generic
	power management
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

v2: An error was reported by kbuild in v1. pci_set_master() function call in
drivers/staging/qlge/qlge_main.c, inside qlge_resume(), was passing argument
which got deprecated after upgrade to generic PM. The error is fixed in v2.

Vaibhav Gupta (4):
  qlge/qlge_main.c: use generic power management
  staging/rtl8192e: use generic power management
  rts5208/rtsx.c: use generic power management
  vt6655/device_main.c: use generic power management

 drivers/staging/qlge/qlge_main.c             | 38 ++++++--------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  5 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.c   | 26 ++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.h   |  4 +--
 drivers/staging/rts5208/rtsx.c               | 30 +++++-----------
 drivers/staging/vt6655/device_main.c         | 25 ++++---------
 6 files changed, 37 insertions(+), 91 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
