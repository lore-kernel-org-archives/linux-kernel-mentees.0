Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E090AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C3D2077D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzz9d3FL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C3D2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 660498869A;
	Wed, 22 Jul 2020 08:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzF7jBkIzW1M; Wed, 22 Jul 2020 08:35:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E715A8867F;
	Wed, 22 Jul 2020 08:35:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD2BCC004E;
	Wed, 22 Jul 2020 08:35:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B62CFC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A23387FE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEGH3dhIN4dt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3664E87FDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l63so803278pge.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5B0GVk1sEbUASjT4+xgZWsr7v8I6T3nqfWa5obXE9M=;
 b=qzz9d3FLgW9eDvZozb1+QqmuacZbBMJUtVOb+ZnFDUVbj1aiDYQ2dEqp01X8FR0x76
 uc7DYiPf58TvPP7LrFQc3XLcknbdMhMl4WvUEvji8G3t1NAF2S/m6zkZuJH7YYxIL16/
 68SxxElSMctAqhqfcZ7y7OJCyE6g/LEWwAaI/Fixg7By1/6KGSCulpVDtMRdi1uWgvKG
 isZb2a61iGeqsPvijKksv4uOf4lqnbUNEEx/2xony4xlHPYKVsnijadpTKAIaMxG2AZJ
 SZg2yYbeels9SzuzOS7HTlEa6qeoGIgSoE9iJKsB6YoN8igRyZOG+r32j3vJTnE9fzRl
 xXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5B0GVk1sEbUASjT4+xgZWsr7v8I6T3nqfWa5obXE9M=;
 b=qIMp/f2Pu5+MTNBVnMbuvjNzUpZpJE4aojsVhHLcAPoCb4/8/yUs0WejoU/c7QN66V
 y9OxUd4jZ7VK00gQUK5XOyPJ+IzmjNRZgZE0riYQ7hrAz2hLQOfBOL9rxfInjY9jaYRh
 J4wM2ST0bWHOqgeUOyZYX3DkrssgaQOuk5xAdkceLu76Vgaw47UdjrvMS8jwtQclinDo
 UONk/OI4orpvuz5tGMuODgYu/fTzMn+SrYru7iS4x3zspz1Iqgor3hX6rVpOIvCwolQF
 K0ZH68IwP0cZZaP2AWUzZ4+F02KVsATxlq6E8tALN+saQXpVVJH8JU75dCQNJGceFtcB
 F6bg==
X-Gm-Message-State: AOAM532/591C06aYsV0KjXZ7AKkiV2KvasVaXLPA5FYuqJGZjhFKTMRw
 ealZjgDIUpFzFQHEOVngFR0=
X-Google-Smtp-Source: ABdhPJxW1giZd/2EieXhbK29tsVlNOYQs2kZciw/ydObd4eRPAb2i+Inq0D8ck6rN2S6QrVIV3yPIQ==
X-Received: by 2002:a62:7845:: with SMTP id t66mr27743156pfc.5.1595406900728; 
 Wed, 22 Jul 2020 01:35:00 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id g13sm5777319pje.29.2020.07.22.01.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 01:35:00 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 22 Jul 2020 14:03:32 +0530
Message-Id: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
References: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] block: use generic power
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

v3: v2 needed some changes in commit messages.

Vaibhav Gupta (3):
  mtip32xx: use generic power management
  rsxx: use generic power management
  skd: use generic power management

 drivers/block/mtip32xx/mtip32xx.c | 54 +++++++------------------------
 drivers/block/rsxx/core.c         |  9 ++++--
 drivers/block/skd_main.c          | 30 +++++------------
 3 files changed, 27 insertions(+), 66 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
