Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8C9C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:12:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8331206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwidX3Ze"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8331206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5D7D88090;
	Mon, 22 Jun 2020 11:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47GGEnmtxEvr; Mon, 22 Jun 2020 11:12:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 51DD2853B9;
	Mon, 22 Jun 2020 11:12:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE8EC088F;
	Mon, 22 Jun 2020 11:12:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8501DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7039A85FEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR9BDNAU2qb7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5004D85FD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:12:33 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d4so8015599pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYAXPW7DT0kbvzrQebyhhIbPbS864IccOljK5pvAni0=;
 b=AwidX3ZexkpxDTHKyTCGp46jSNW2xMBBWhPBN56AWN4n6wEVZfIQfLnHUtbsVPC/+q
 vHSkQ68iyNPUheHNKCpbOSIbouDo4Fb6Cq4jawLnxgXqYfSUFwy7Bhlj2B5DaPx/hoOz
 XmQGM7H/6M7XbjcOe9abIhMO/hLNUvoEF+EqPw7Y/Ju89+cXXG54N1oIAcwtiAbSb7mz
 +vrTrj2CmD2oqV5dvdp7w2d6m1zhtiGdtm2ECq2Hya31fWGr4QScfV6dtp34YYx8KiLa
 Kmu1m1VrnvCOas6ZRsUU69J0vlNoZJo8g/qxNJIVmOCbRzrejzbYO7qevtEAHO5zNTqY
 LtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYAXPW7DT0kbvzrQebyhhIbPbS864IccOljK5pvAni0=;
 b=lIjJcvuMQaL4iqSwO5/Flp1VEGfoa6b/Ylyiic6KzqMVgc8NDT7V0oqy0BbZo4lMLA
 gSRmyzjdYbfE7cO2zzpAkNQ83UEjxrPmMwt/HckYQ+CJHRVZtBJ0a2/wF4wKEIXM780i
 zpx0tViFTmgaLX5d+jLLYUVed6ce0LUZyc5QTEKPTjvKdcDEe8wOJb5ViBUh7qhZl4kf
 dEp7yT/NgfODGe2+F16fdQeUeBgWH3E6kRRfREbDSAvLeyAhAjuOfuSeQoObIRwx7eaL
 HCZnk/1v0wkhdS4kWfCcudOqQE5+IL/2YZ9aqrpO9nWSiA/uZFcFVPMczL6HrONGvb4L
 DhGQ==
X-Gm-Message-State: AOAM533aWn5RxXI8V7fenOvguGBv/z43mKruVNjqZnbQ+AMfjq0m6Cjr
 IfJPApD3yDgBZ1XYO+ywRC0=
X-Google-Smtp-Source: ABdhPJxdh9WVIqHVXa/wZqGd4y+AAcv+Apip4Y9P8JN/SwkmLrq/IJHMqUL7J0kc15kn0dVK0K9DKg==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr21122392pfa.124.1592824352780; 
 Mon, 22 Jun 2020 04:12:32 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id f205sm13467355pfa.218.2020.06.22.04.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:12:32 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 22 Jun 2020 16:41:06 +0530
Message-Id: <20200622111109.55674-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] ethernet: amd: Convert to
	generic power management
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

Vaibhav Gupta (3):
  pcnet32: Convert to generic power management
  amd8111e: Convert to generic power management
  amd-xgbe: Convert to generic power management

 drivers/net/ethernet/amd/amd8111e.c      | 30 +++++++++---------------
 drivers/net/ethernet/amd/pcnet32.c       | 22 ++++++++---------
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c | 19 +++++++--------
 3 files changed, 31 insertions(+), 40 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
