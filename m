Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8E1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5592074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uY9d/63D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5592074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 06B802272C;
	Mon,  6 Jul 2020 08:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQGwx0XYq27D; Mon,  6 Jul 2020 08:59:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8DB4F22728;
	Mon,  6 Jul 2020 08:59:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C067C0893;
	Mon,  6 Jul 2020 08:59:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E3F0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8AC6B87686
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gz1sP9wWNvuY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1E9D687622
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x3so11165740pfo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zB8UGJwVVuUJ7z3/tn8lFjXFFz4cB0VoK0RQrWVh/kA=;
 b=uY9d/63Dp+ffxpmCL07ExtVosl/D32ZNJg4ja/bHrJhk/IV/UUHToL53A/IHxIo7C1
 qD/AXxdx1siGqrKKEOxrZNvtasyRNeJZCLCfb8BtvqcBxn9JNAHA13cizHUgoRLByiWO
 7L7hg//e2h8O8b4xXUrS3dv6/y7CHfbMTK/G6NxfcU8VM6xEPSuH5hNdMc3qXVCG0JK/
 2h99miDaU36t1SUrfybO4NVlMTlPl8Rm7l7smOVT5mpssxn7xEqN2tIlftaIcmH5ZT6I
 IeV1Ovf9TPgzQWbfQ2pnU/W2zX6dOExvriSFUTqAEicasSf+ikXzNmn8SQpj7Wt+k3oe
 4WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zB8UGJwVVuUJ7z3/tn8lFjXFFz4cB0VoK0RQrWVh/kA=;
 b=FeRVQ6z1+l/8gmNlZnAUC98vEZABZaJ3wP5oJFRJXXw+Q2OXaqAF18g7vQ2fo7plqH
 McQdPwSJretJTfCHNUyejP+TNEc09ADSK3tXkga8K73G5o4rx3S1y6WRWU0MjAGi4QC3
 QowCkhni9ubeSpbHAmPGCzcBy8jOfIAqygQ3UGQLLt+A+gCwGaRsEGrIrIWTK8pEuyNP
 wTz9RS8a+0vurI2zUEYpmYcBNC1abOG71cydAdkRujs8ApdL+hEOBEgXPNHHvVYXeNRW
 P9T5lHh8F6SwcJNKuI7FyIhbUpgxdzl+Ob/Syywrj8mB66FoDPzE5Ws8+ZmgPc9+ORz1
 T4IQ==
X-Gm-Message-State: AOAM530Z9NPok1/xzG9i7XWwFImP7LB50coGfgIC83MSXnRE4TQlpx7L
 Vd0ldjpyMZuxPffW0GLQT4A=
X-Google-Smtp-Source: ABdhPJwp6m7DYniWo1fOmyV+2e0zCqDDXlJnFgjk/KIBDiKmQnuJ+/xhXasYN/AnUW0PDcs0uTH+dg==
X-Received: by 2002:aa7:86c1:: with SMTP id h1mr30044632pfo.175.1594025957343; 
 Mon, 06 Jul 2020 01:59:17 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id a19sm10068149pfn.136.2020.07.06.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:59:16 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon,  6 Jul 2020 14:27:43 +0530
Message-Id: <20200706085746.221992-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/3] ethernet: sun: use generic
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
from sun ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (3):
  sun/sungem: use generic power management
  sun/niu: use generic power management
  sun/cassini: use generic power management

 drivers/net/ethernet/sun/cassini.c | 17 +++----
 drivers/net/ethernet/sun/niu.c     | 17 +++----
 drivers/net/ethernet/sun/sungem.c  | 76 +++++++++++++++++-------------
 3 files changed, 57 insertions(+), 53 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
