Return-Path: <SRS0=MWxh=QC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD3C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Nov 2021 06:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F4963213
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Nov 2021 06:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4F4963213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FFD6075F;
	Mon, 15 Nov 2021 06:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qgm3gAaaXhOm; Mon, 15 Nov 2021 06:25:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B2B3F6074E;
	Mon, 15 Nov 2021 06:25:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B733C001E;
	Mon, 15 Nov 2021 06:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10765C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Nov 2021 06:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F33996075A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Nov 2021 06:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nA9pH2TUmiT6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Nov 2021 06:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 100356074E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Nov 2021 06:25:31 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so12160515pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 22:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7W9XanpshXvtSoCLshMRQwI6dIMSbV7kXiCbFgHrPGQ=;
 b=UvSfkLnYlDcixJTWnQ5GfcIG/r2wmRiqz6WT9HwhrUHHvxV5Z+s3mXBN0XX9uMPKzJ
 Lw1zXvwc/Ug34ogE39aks5ve65QQOdJ4zi0pyEE2Ky74zwpbxUnfmYazDbFhx1MXWACd
 8Zhwimu51nccW7X2G1imIHF0GvnlnQTIjsM2APdMB6Wp9qKVkHMHkoWl34rvL6eAf9xh
 8crNdvmfzNaU9tmKji/IduJXDEyXBCHem1yqAkw0TEzWVLwMkTu1RaY29Ka5O8WYTE9p
 eFN2fp8FL71WRx46tnwQnns6cvW1a2rAJd9J54H4b0On++nGHUxBC+jUv+KQs+3Vu/wo
 kW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7W9XanpshXvtSoCLshMRQwI6dIMSbV7kXiCbFgHrPGQ=;
 b=7x9c0QXd92FrWkg4j9R6U/e9GhViBUZ42gfQom3UBBOfA841oBpKcwjh5EWX4dU+Qa
 Ft1DXIIhzzS5asViwL4e42fvAohViTVzv6eN/4w9OzTNppcCxRf0/1aQ0TnGxbaZ+siP
 TZZrvE5Vx3aEKx50q1C7j64r8cY86fmxKtJr98o2rasDV5ILi4palbb9FFhqaGPAz6kY
 Rbfgr1ldp+aCS2fpCVS1KLk/kl/aMxn96Jvbdz03OWSPl0Bxd5PqlLgkJN/CWzbPQyVK
 NumHRqjHzpOMTxWFIJLJXfZZPq71BztMGb9jb11jWhvkW9YWQdYQoIR6NcLvc7Dr6u8n
 eazg==
X-Gm-Message-State: AOAM531fCYyhTFx6JqKsr5L65LCIkDC3PXmg7OwemkyttDkc14hpDO3Z
 GD14c8/tM8jider9K6CX5nQ=
X-Google-Smtp-Source: ABdhPJyWEXR0EyLejAUFWCYb03G4m+oTjbPVWHg+o0cZ8YzmPiNU3pNKfCJ6FyrARIhRTjLGiaQNHQ==
X-Received: by 2002:a17:90b:3807:: with SMTP id
 mq7mr43337338pjb.38.1636957531422; 
 Sun, 14 Nov 2021 22:25:31 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:e619:88c4:d8a2:c9f5:5c37])
 by smtp.gmail.com with ESMTPSA id
 s2sm15865647pfg.124.2021.11.14.22.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 22:25:30 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 0/1] PCI: Initial KUnit test fixture for resource assignment
Date: Mon, 15 Nov 2021 11:55:14 +0530
Message-Id: <cover.1636956898.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

Currently it's hard to deubg issues in the resource assignment code of
the PCI because of the long reproduction cycles between the developer
trying to fix the code and the user testing it due to the lack of
hardware device with the developer [1].

[1]:
https://lore.kernel.org/all/20210621123714.GA3286648@bjorn-Precision-5520/

Bjorn, suggested that it would be really good if we could have a test
fixture for debugging/testing resource assignment. 

The patch attached along with the cover letter is an attempt to lay the
foundation and also have a proof of concept to show that it is possible 
to have a test fixture to debug the resource assignment code.

Since there are a lot of things which happens during the resource
assignement phase, the first version only tests the __pci_read_base()
function since that was the most easiest to set up.

Hopefully, in the future patches I'll be able to write more KUnit tests
for the other parts responsible during the resource assignment phase and
get closer to the goal of having a complete test fixtures :)

Thanks,
Naveen

Changelog
=========

v2:
    - Add test cases to test resource assignment for Type 1 devices
    - Fix a error (a function was not static) found by Kernel Test Robot

Naveen Naidu (1):
  [PATCH v2 1/1] PCI: Add KUnit tests for __pci_read_base()

 drivers/pci/Kconfig              |   4 +
 drivers/pci/Makefile             |   3 +
 drivers/pci/pci-read-base-test.c | 803 +++++++++++++++++++++++++++++++
 3 files changed, 810 insertions(+)
 create mode 100644 drivers/pci/pci-read-base-test.c

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
