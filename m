Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD9BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A55A23158
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8RCISIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A55A23158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D525D8853B;
	Mon, 29 Jun 2020 07:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dI3iNcvjM-B; Mon, 29 Jun 2020 07:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62C3086A0B;
	Mon, 29 Jun 2020 07:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50B26C07FF;
	Mon, 29 Jun 2020 07:37:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91BE5C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F35E89379
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rD5xk8CTPZb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1AD708929A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j12so7525532pfn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gDM4k1Yk8LW7xlU6yNIJsCHS3QIR5uvUtDlbeW1QFKk=;
 b=X8RCISIZnXYpunasoPJqDhNH3rQ0XiSvdy4nAbk41pWq/dz/IPVZkg7PzZFRa4X1xn
 2YpDmquvcakzAJvUjME2R+RjFbDUOq9YJeT8rjloM3HOL5a532uXPTt3dHwNj9mDtxDE
 /rr7V6qOJWdkIs7xHye+ZDDVtmnOsdmoRMhBAY5Ll2d3KNJ6vxOXRcwIpI/ZM2B8s8e5
 EFAo4K2iEPmbe3Zg26yk6ckABJk299EGhZxOMt+9spTkdaphyQMC8ffmnIa2dvd6pC5w
 vz36LE8CtA5QSCMHB7d3B1H2h8nqKu3qQnShqek5l9zhH7FMXqpb+4uo9XFAE17E3zRm
 ZoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gDM4k1Yk8LW7xlU6yNIJsCHS3QIR5uvUtDlbeW1QFKk=;
 b=VVoTI4JD0UE8lEpwie5/9WPYfHhvXrCJtG+/wPoLFicNJ5ONo8/PGIc1gr3m7FSTNl
 +yP/bgs5Tok+waMQYxrMX2iuBvLSPvJvoVGnGrc+EIOYN4XZKcQtgHy/iK9a9Z4yRo8m
 KiwqrWA/xaTpJZwvF8D2M8G1Vdmc0Zzj4zDe0L7zEPSSRNcSCLSAzZDpBTQr+PU7kCvX
 q0hTywx6srcggBbV1nbQdTrx4qIDmiKKFE7ESZmtUY1RXh/MISpsuW+iPOV7QlyKlZaw
 4dgQC6J7eULYBVoKDj3+WHprh0+aIkD48AIlJLP4er5aRkUdLFT+Bhi+n2vRwgXacbB3
 u+zA==
X-Gm-Message-State: AOAM533QBuxS8ui9oZpsb4jOqQ14zO+PgrtyFO4VOqfjKK9s0i2Wv31s
 tgWTlmMpcBn9jChXPLnJ1os=
X-Google-Smtp-Source: ABdhPJxpCV89OAF2D6UcINS7KgFdE7WIv1a5RmvUcOk3a454WOLgNxKhYjvpA5bfJR821uWzIzAJxw==
X-Received: by 2002:a63:4861:: with SMTP id x33mr8936376pgk.448.1593416239679; 
 Mon, 29 Jun 2020 00:37:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:05:58 +0530
Message-Id: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/6] [media] pci: use generic
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

Vaibhav Gupta (6):
  [media] sta2x11: use generic power management
  [media] cx23885: use generic power management
  [media] cx25821: use generic power management
  [media] cx88: use generic power management
  [media] meye: use generic power management
  [media] tw68: use generic power management

 drivers/media/pci/cx23885/cx23885-core.c | 16 +++---
 drivers/media/pci/cx25821/cx25821-core.c |  8 ++-
 drivers/media/pci/cx88/cx88-video.c      | 52 +++++--------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 60 insertions(+), 124 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
