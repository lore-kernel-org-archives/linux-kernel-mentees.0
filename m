Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136BAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECC320704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M06rkvxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECC320704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91B3687089;
	Fri, 17 Jul 2020 07:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ch6ktW2jw1Ot; Fri, 17 Jul 2020 07:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2235C81CFF;
	Fri, 17 Jul 2020 07:51:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15013C0893;
	Fri, 17 Jul 2020 07:51:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22ED7C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 08F3586101
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eucg5nK9A9ee
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEDF3860FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:51:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x9so5120370plr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQMEtakU6xS8LBnA2yMRjtPGhopel0Omr+ZNCJgv3hU=;
 b=M06rkvxqty8dn8IXzeesiv6KfkaAFIVggP51R9rAl8zPEtCRnkT+scKW4YTcilLGZX
 /JZA+UUB/EqcnenwrIW8OeLn5QQtZk21VoSTL233t/D1lktszA69GRaJuwReqckn7FBF
 5VssdRukZwyh2IVo+pR84jmH7uCEHqugT61PPrgzDWj7MPy9BrAMbFq8KpJcG+zOoz8c
 vGBr2sQG2IxRTcFD/IhZrU8N+5PyoFSkjM9VXYNoJOLZ23hgZtk5vk9WHcT3vzggaXLM
 KAc+Rso01VAjwlVkairTfNxO6gn2LxW384A2B/RQbcrzf61FHHNHJE66aMI8IdreSUnC
 fsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQMEtakU6xS8LBnA2yMRjtPGhopel0Omr+ZNCJgv3hU=;
 b=F/CnmWQerjzoFyjV1KJrLj40LkOVWJWA6dhRJ4NLxPuNlnei7C4sOsmFsYSnRZ4dcH
 bFuUvVU5d+Pdu/THeQDMPKd6Y7/OKOMMBKNH+c9kwfPHky4R9xSKHWrHAUJwnoMddW9J
 BAEDd4Z2UVZcDHh03ErxhIwQeaWiz1ZU3IdROkxj68dX6vZt/vz4JslK9y9nS/UnFuk9
 oPXBNaV3+OqT2/m+gN+E2evUqnVJh2taVZTgQoEkHV2rOftB5vXXfdxlKLcTKQBZA3tv
 hVfHLIxurxxrUZ7H1/gDmQD1AAs3cOtdyWwrGbosF8Q3EK4H8e2b8AuarXMVJSEE2o2R
 HyhQ==
X-Gm-Message-State: AOAM532Q4rpGAdxRQT5SYMQgJjjDehdyqaySlNmTvyBHMwhtW/WpMHrQ
 yfXPYpvOAW332pKtSS1hnrQ=
X-Google-Smtp-Source: ABdhPJy3FJKJvWW6pKyEqr3V2z6yNkYiEEfQX+1qxqgCABkkYLm6lyEyStcfQko+OoysKi3fGgdXKg==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr8782433pjq.185.1594972277266; 
 Fri, 17 Jul 2020 00:51:17 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s68sm1924332pjb.38.2020.07.17.00.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:51:16 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 Jul 2020 13:19:34 +0530
Message-Id: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/3] char: use generic power
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

The purpose of this patch series is to upgrade power management in char
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
  amd64-agp: use generic power management
  sis-agp: use generic power management
  via-agp: use generic power management

 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
 drivers/char/agp/via-agp.c   | 25 +++++--------------------
 3 files changed, 17 insertions(+), 57 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
