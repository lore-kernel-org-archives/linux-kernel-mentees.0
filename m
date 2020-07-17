Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2556FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD842071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWZ/4jVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD842071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 858EC88222;
	Fri, 17 Jul 2020 07:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nW+wLHysnvwK; Fri, 17 Jul 2020 07:36:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0837986D7A;
	Fri, 17 Jul 2020 07:36:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E96F6C0893;
	Fri, 17 Jul 2020 07:35:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35A8DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C5A6860C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNQOmwaVIo1K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B6051860C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:35:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x9so5105463plr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H6UgjbIQGVN5oFfgxU/CHIEw0G9DHJL+4n0GByCqoKU=;
 b=ZWZ/4jVtjrKf9R2VXYKIHZ+Pyugf1ECUJzzMztl7ZhJmng7dJMQOjVX0nnY1wEv9Mo
 sWzRdLBYGlDLQiKNgfip3W8IqglWn5NoB+wjkO8Pv/74UUapkKJcjtP9v86ZTJw6zdpJ
 //LcgllV8AuvMsLd3OeGTGXQGa1G4S1UyBcQ8U8G7aUTZmNXvsT5xr2LSlckjnzFjp+H
 R22aDhy8soxWLWgpLfPa66TQrtoPkT+z2jhLlHu+t4J3km5o/306kyBXcdi27dxF8F4l
 oSbWcUfFNYmED7V9S9guJI7rFmtV88l3xM4eIur+pdmG+fv+Ej0wh3oDqgVlLplIzOXS
 MFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H6UgjbIQGVN5oFfgxU/CHIEw0G9DHJL+4n0GByCqoKU=;
 b=SI2TUwLFIlrnZN6Do+lJhOASOIHSFx5yXuiALEfH8AyIA7ftxiiMpBBa6frY9iN3ay
 kCrDG8vy334MRf8p7G4Z8g45DV6oSNxlPdfryq+K8kNyvDU++hgJVj03u/2Se0pSHzqm
 dqSzKoNr1Tv5QTdL2wePl8lj/eKcRBltoj2AwF10157eskxAKNP9ddS1HSsrlXrw38Wn
 c2Xyu74/A6b8wsWTLRVUKGkl012UArlTADcO9oTYURKcn7wbJ0iIsQtLhYsj4mHqHjTa
 OxeSKZJEQDFbooeWYOXPUbUAc33V47d6+941ljV9ncEymsmtgbfmR1IURNk1RK4cN+Vv
 CrWA==
X-Gm-Message-State: AOAM531EZZy25zGICufoYFsu2YFryXZdVaVotPZRRJXKp5V64Gr9eEpX
 seHOgeIDVW/F8SNtIbAZpfQ=
X-Google-Smtp-Source: ABdhPJyV8TF/8340VW6zAKsBcjtJyGZUCuLrzgfBjaLKiQqbhUXOWPWT4ov7XWH1kS1rxJD2S5vFug==
X-Received: by 2002:a17:90a:17e4:: with SMTP id
 q91mr8464124pja.61.1594971357237; 
 Fri, 17 Jul 2020 00:35:57 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:35:56 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 13:04:30 +0530
Message-Id: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 0/6] [media] pci: use generic
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

The purpose of this patch series is to upgrade power management in media
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

v2: some changes in v1 might break cx23885 and cx25821.
v3: kbuild error in v2.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (6):
  sta2x11: use generic power management
  cx23885: use generic power management
  cx25821: use generic power management
  cx88: use generic power management
  meye: use generic power management
  tw68: use generic power management

 drivers/media/pci/cx23885/cx23885-core.c |  3 --
 drivers/media/pci/cx25821/cx25821-core.c |  3 --
 drivers/media/pci/cx88/cx88-video.c      | 58 ++++++----------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 46 insertions(+), 126 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
