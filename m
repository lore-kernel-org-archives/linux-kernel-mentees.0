Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654F2C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E66206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiRstPhm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E66206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D556F85EF0;
	Thu, 30 Jul 2020 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8T6V1-mH26v6; Thu, 30 Jul 2020 06:44:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67A3D85E95;
	Thu, 30 Jul 2020 06:44:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45C25C004F;
	Thu, 30 Jul 2020 06:44:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12C01C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E95887D0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMeevUVSOJUK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A97FE8798F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:13 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id kr4so1455228pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0Z6YHYdP/kQD0cMS+cNQldOhqY6T8q1pjXPvT/YgO4=;
 b=OiRstPhmDEM9j1YxieKFDsmisl0va0TTs8SAgeCbQrA9AWLamk4R9MGSsK4v6bndhB
 RLewfarih1eCgV3Iputcsb8Fikf0Ts4i1DzVjx+N38MZOsWuNZkJbnGWYYRBMLzi/QnS
 gWLNvJwgGfa9pyvyYFGPfrF6suBPHMvAA8Pp+dAgRwz7pEIvIVwPBboizcmAW1ewhGnw
 oyNfRbmQAbZmpzaktT4Tx0ON8SY7SRP9rtF+afdlUt1d0G0UQIhpYsUI4FmTbgULbQSr
 QN5TpBwhN21MUhS84sWBvKcg/78IQrktg/pOpWQICx27YFOfDNq88Ez46QtYgrlndHW+
 F7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0Z6YHYdP/kQD0cMS+cNQldOhqY6T8q1pjXPvT/YgO4=;
 b=mIAUWlIjEJHHitIqLzfvK3899/1xkkjqDjPl6c8kacEfMwSEOz8RQCC3q3wcrOxUD7
 /Q0gVHw0udMQ0mrp8rZ+6ed28lWpPo/DB5WPQrXrVBvH0aNX8QlWbJDZ3hQFvb6/hYjo
 Dkdz78bR6hTL0rAkLZ/aakh5YtkiSa+PycRmvcZonZtvsZpLb+5tKKm1JadgHP1pX/1g
 nLISRn9AO+nzmyp7GSc/nO0PzV3V8WXhkP8A+5mXrPD3Bmpx0IKdZs8B6rdIwViAGHrM
 H7ftuGDk+mkw2bvYcoGD071RBSIu+CmnXcZ02fshSgTBVO4wq2IuroSe0aWZ6Fw1mn2X
 X/zQ==
X-Gm-Message-State: AOAM533iuCtWoRWU6is3D15dwvm6uFfT2ushkRYuMmhG1ketqjKXKMcy
 ZRwKVINZsKybl7Cxq1OrYco=
X-Google-Smtp-Source: ABdhPJw9O6djxb55ZNdBVxjrgHGcCupOaAemxFpYzSxNl58AoVv0WDFvfO70K4EdqKqtCV1QzKsN3w==
X-Received: by 2002:a17:902:c405:: with SMTP id
 k5mr30039309plk.202.1596091453251; 
 Wed, 29 Jul 2020 23:44:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t19sm4456942pgg.19.2020.07.29.23.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:44:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 Jul 2020 12:12:26 +0530
Message-Id: <20200730064229.174933-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
References: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/3] net: ethernet: use generic
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

The purpose of this patch series is to upgrade power management in net ethernet
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
  sc92031: use generic power management
  sis900: use generic power management
  tlan: use generic power management

 drivers/net/ethernet/silan/sc92031.c | 26 ++++++++---------------
 drivers/net/ethernet/sis/sis900.c    | 23 +++++++--------------
 drivers/net/ethernet/ti/tlan.c       | 31 ++++++----------------------
 3 files changed, 22 insertions(+), 58 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
