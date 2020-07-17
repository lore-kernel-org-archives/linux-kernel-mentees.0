Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F5FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6BE20737
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxO+Lekr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6BE20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D76F203AF;
	Fri, 17 Jul 2020 08:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwIUK7sut40p; Fri, 17 Jul 2020 08:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D46AC203AB;
	Fri, 17 Jul 2020 08:10:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF6C7C07FF;
	Fri, 17 Jul 2020 08:10:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 676ECC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5087A861A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJDua4E61aV9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E16FC86199
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:30 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t6so6327802pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wb+mPg1t2a/HwdF5pc/QRkfVddm7WxKqWMPXH/1N+qM=;
 b=LxO+LekrPnoGrzriVhswyB7/G1U2O6WqKZbD8gwzhVHXmrZAfaUFoi9vYk6U8ycsff
 k2SbF+c1uJ/5AUZLMGGo2n/HWylovQhcI5LcP20nPEWiCBtRDAkbotjK1MSpNGtbKusK
 7paGgCd/78ftlysmgKkIQDG9IxtkSjZvuy/U+KpGEd9GnGfRGZXfKpd+KFiTVwV6Ar1T
 Jfg8x8TE1ELJimwvB0QE+QyhvkSkTezA2Wwa+kURv5jxd5jt2zLzw0Imxskx1ezI2TEx
 YNIifYoRaPRBWRvjgB1pFDbhJcDP3yJ2Bp+FwsgeMUb6M06phhiRtzJHb90L9ZGOy3S3
 3kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wb+mPg1t2a/HwdF5pc/QRkfVddm7WxKqWMPXH/1N+qM=;
 b=IxcdcCOZ9QRF0/QkIKSBPxs79hn3J5Le9JKkuo97/k8Am2zIbfZLEM5RGinaRWkThx
 D09+L5YgKon8Be9jitj/i9gTQEsrZcscGgXb/WK6n7rRGD46LKMro9wN1YEgALGKRIYw
 N0aK0mNZ+zN2b02F1UmgSoK0MAYwa75Zsb3lOCdPJU4LFa8x6TgawTgON8Exp+agkdR0
 KkFLh9zfJ+F28wTtvl4jAlihlrifA6gVojoUfu8cFQ7fapOow+xGFVNZiu8Q/0MJjGp8
 R83f6P5AtKmhg3XZdv5QsJBt+UJhNqFBceVo1TCVRcJzCylnitfBXgDTFP4ndC+LypG1
 QQzw==
X-Gm-Message-State: AOAM532LTwjMQiLCr06bGfChhUoGPin65TgDBfEkyP7frRGjQykw9OBs
 k8rsPkiuOd7xB2qNoUyeJ9E=
X-Google-Smtp-Source: ABdhPJwxtCCwa1VmRCFBDVqGdQcJ/2V5fJ5JyH3gwwFNIOYc0esNeHrFaSxs2CqFCUyitRpWn4V8Nw==
X-Received: by 2002:a62:1d0b:: with SMTP id d11mr7346372pfd.1.1594973430357;
 Fri, 17 Jul 2020 01:10:30 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id d5sm1937296pju.15.2020.07.17.01.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 01:10:29 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Fri, 17 Jul 2020 13:39:07 +0530
Message-Id: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/3] block: use generic power
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

The purpose of this patch series is to upgrade power management in block
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (3):
  mtip32xx: use generic power management
  rsxx: use generic power management
  skd: use generic power management

 drivers/block/mtip32xx/mtip32xx.c | 54 +++++++------------------------
 drivers/block/rsxx/core.c         |  9 ++++--
 drivers/block/skd_main.c          | 36 ++++++---------------
 3 files changed, 29 insertions(+), 70 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
