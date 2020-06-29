Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E82CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5D920857
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNVV8i+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5D920857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DAF38811F;
	Mon, 29 Jun 2020 09:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8uBLeMIbJGU; Mon, 29 Jun 2020 09:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AEEA88882D;
	Mon, 29 Jun 2020 09:31:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 960E1C07FF;
	Mon, 29 Jun 2020 09:31:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF37DC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D6897884F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0fQzaHCsvXd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7E2ED8811F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 207so7473198pfu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ld538JaKDXIGo10uVIPf/OU9ypVMHtMKsndOQ0uoERY=;
 b=kNVV8i+/97Zn5s/MHxIAt2QNER/BXTzL3YDs1qt3DOpG5XCX9RXz4wHmmN94H4DwkU
 M4Q0UuZJp/0kinhl4WxCtg7mewPv210DRtDVqjPKOY/XxfNtT0yRUsHMVT17dMliME1A
 k1yZh2RgyG5uhLj91imY9haypvx73lMIct0B78mnsGKgPMbqpWshBN6mCMzJ4DxSqqrA
 0e1LosaeH0fKz5NeWHnV73cfBwtWZXMfQWGR2lkdYI02wRq/A8jrJQ/ZZ+yWlW6F0GH3
 3zxdkuWiMu9miFniSuZM7WE0K9uvwTGKj4JhR8BeVctJuIy0HIJZ/+fzmzjymQ0kNFi+
 n/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ld538JaKDXIGo10uVIPf/OU9ypVMHtMKsndOQ0uoERY=;
 b=TCMPDM0s7vVkrfVrD4fqnNN2Jvr/QYv76cRnUfN6blkUohPYOkQXKt3e6yCI0KJ8la
 25smMSwvknD0E4stKRdBxfLik6XOyrzrGRxVu9sLQzC49FzA+x96L/lrTUKFk4FGNcfo
 JKI5R88XW9ZgB4/QHS8GVGO0LN0JoanxWo8gu2MDfT9vyqejek4osBvsiVwS9VzljGHA
 li1BAAC3d4ic6lNHe7t1ZikIv4+F29+1ALmEoDaOv/Ifwbkco+GQSiH6skvVGObsVQZH
 a/UVlhXQFcz7z4tIW9PzarYzIX2TZkpwYDL3A9lx6YgX81puTc9PCF02pRl5nSn9W+wi
 XHUA==
X-Gm-Message-State: AOAM530I72DAEep9EUFsVHx0nFBEsmUEtXQKIwynttrtFZ4jqKo4SN+c
 bvswZWH5RGe5njYE8GMdLHM=
X-Google-Smtp-Source: ABdhPJzg4uMdcuYxGKzmX4AkigvWMPMBvIUAccjNVi7bKO3S0bEG3v2GQq16Tqlxe/ePLRLJFpEoaA==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr3397847pgk.334.1593423072881; 
 Mon, 29 Jun 2020 02:31:12 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id q20sm2921286pfn.111.2020.06.29.02.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:31:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Mon, 29 Jun 2020 14:59:38 +0530
Message-Id: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 0/5] ethernet: intel: Convert to
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

Vaibhav Gupta (5):
  iavf: use generic power management
  igbvf: netdev: use generic power management
  ixgbe: use generic power management
  ixgbevf: use generic power management
  e100: use generic power management

 drivers/net/ethernet/intel/e100.c             | 31 ++++------
 drivers/net/ethernet/intel/iavf/iavf_main.c   | 45 ++++----------
 drivers/net/ethernet/intel/igbvf/netdev.c     | 37 +++--------
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 61 +++++--------------
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c | 44 +++----------
 5 files changed, 58 insertions(+), 160 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
