Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4ACC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E082F20768
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ/G2+Zt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E082F20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1F1A87825;
	Wed, 24 Jun 2020 17:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FKte+drAoen; Wed, 24 Jun 2020 17:30:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28D3587831;
	Wed, 24 Jun 2020 17:30:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F3C4C088E;
	Wed, 24 Jun 2020 17:30:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91FC9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8676D883C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TymyoZKqhhyp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11D28883B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d4so1735150pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q15/TzuCJicAE8EEZy+jtFuuq+UiSpYK9IL1usdFcPE=;
 b=tJ/G2+ZtCC01Paj/JN3QoUPDLqFBcKO79I6h3o8CyYHSnd9q1OEH5PLyE6x9Cm/JWu
 SAhBPOwaLdcbgKSRCSSUI/nfL7Hz83CWPP1GP7dOBUlj/hTPcM7vTvHXE+bFml2SFgJ3
 mAYj7idtIZ3c7oWjrai/yX6P5+dr0+NzeoSqkHl6xpk4EIvd+alSV2NQLgRuwomJ7qjJ
 OXWqJ/4T3A58dCuAU6RYhADwClA5QxRJJ04WzB2F6zQEcPIMoAZvPslAnptjrMPsUBY7
 4gilpfPeFkzLKfLG1DBZl34eykw1orox/alt09ttTli8mgB5rl7wBr1/LppjpwxI25dn
 SycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q15/TzuCJicAE8EEZy+jtFuuq+UiSpYK9IL1usdFcPE=;
 b=jff8XpIIHthm/RxpgHkvjOst2s85s6aNOkhPTJCpOgQnMQW89bCzGcoFmaPbtIMT2+
 /onNVPbqxXW/lthJiRaNgBaM3gmtw7hPknshgyTbWF6rKT21p27jjJqCgznivS3DkA6S
 lQSWJYYLWZdsS9dW1CPibAlA9hBora9ic7kH5hY/2V0NxuDzQy8i0VQRZbc0Ar5EJFd/
 KNbGQv8hOu23b/ciSZtXxKywI+d93oelhiKf42EIw8BEdEwHmPzu3IAO2HwLGoaPqlwv
 QFU6At7ovEtvf8ssXBkyBVsJz1jMMHOzrLznN0TFBnK1nM3wUinyOOGio3AR562kOMzt
 wfQw==
X-Gm-Message-State: AOAM53368F8KyC/j2ip6vDy+q7NcAivPExch8ppiD0uHVOARsOOtUrdN
 nDtu7pxhRHAx6+tjX5p/Umc=
X-Google-Smtp-Source: ABdhPJyqvWmyEtSNhauUsBE5HJ97LsiACvw4Ii9Hd2so69stSp1QeaQb5AVx7KKSl3+Uqic19cio4Q==
X-Received: by 2002:a63:1312:: with SMTP id i18mr23039279pgl.142.1593019816511; 
 Wed, 24 Jun 2020 10:30:16 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z11sm21187215pfk.141.2020.06.24.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:30:15 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 24 Jun 2020 22:58:53 +0530
Message-Id: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/4] drivers: ide: use generic
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
from ide drivers.

The suspend() and resume() callbacks operations are still invoking
pci_save/restore_state(), pci_set_power_state(), pci_enable/disable_state(),
etc. and handling the power management themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (4):
  ide: use generic power management
  ide: triflex: use generic power management
  ide: sc1200: use generic power management
  ide: delkin_cb: use generic power management

 drivers/ide/aec62xx.c         |  3 +--
 drivers/ide/alim15x3.c        |  3 +--
 drivers/ide/amd74xx.c         |  3 +--
 drivers/ide/atiixp.c          |  3 +--
 drivers/ide/cmd64x.c          |  3 +--
 drivers/ide/cs5520.c          |  3 +--
 drivers/ide/cs5530.c          |  3 +--
 drivers/ide/cs5535.c          |  3 +--
 drivers/ide/cs5536.c          |  3 +--
 drivers/ide/cy82c693.c        |  3 +--
 drivers/ide/delkin_cb.c       | 35 ++++++----------------------
 drivers/ide/hpt366.c          |  3 +--
 drivers/ide/ide-pci-generic.c |  3 +--
 drivers/ide/it8172.c          |  3 +--
 drivers/ide/it8213.c          |  3 +--
 drivers/ide/it821x.c          |  3 +--
 drivers/ide/jmicron.c         |  3 +--
 drivers/ide/ns87415.c         |  3 +--
 drivers/ide/opti621.c         |  3 +--
 drivers/ide/pdc202xx_new.c    |  3 +--
 drivers/ide/pdc202xx_old.c    |  3 +--
 drivers/ide/piix.c            |  3 +--
 drivers/ide/sc1200.c          | 43 ++++++++++++-----------------------
 drivers/ide/serverworks.c     |  3 +--
 drivers/ide/setup-pci.c       | 28 ++++-------------------
 drivers/ide/siimage.c         |  3 +--
 drivers/ide/sis5513.c         |  3 +--
 drivers/ide/sl82c105.c        |  3 +--
 drivers/ide/slc90e66.c        |  3 +--
 drivers/ide/triflex.c         | 24 +++++++++----------
 drivers/ide/via82cxxx.c       |  3 +--
 include/linux/ide.h           |  8 +------
 32 files changed, 65 insertions(+), 154 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
