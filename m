Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC11AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:04:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9942207CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz1zKCSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9942207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A76A388347;
	Tue, 26 May 2020 08:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCaxvqrhf1na; Tue, 26 May 2020 08:04:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8084587BD7;
	Tue, 26 May 2020 08:04:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A8CAC0888;
	Tue, 26 May 2020 08:04:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0D0AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCE0B834A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p38LepyuTOKd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5D6CA80662
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:04:53 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id z15so4562950pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s99asDh3KqWhbtaAWLoxUL9KkIJuoxOh8yq3KY5BrWQ=;
 b=Tz1zKCSoTHHucRUc2yQMyukp4e4qrrwhsUh8b0LQrY+j7riVutzUZ3CdlTFW/zCDVc
 dnKevt+yNUl38GN2jcDl4l5Kvb2EIC6LSqa8H8/JFf55FpvMUDy0e60PpgI6GXxxC4Qe
 28awVQt3Hm+8J3+1SFfBLTURZKgQwr2qQAspbd6CoJMSA9M0TCdlwjrXXX6/RULjc2T8
 nc7NDHCX/ajltPg/trR5I8CnaKcaAFDRewfBGqkpphf4ryBTZelSLJEELCJCLHQKR/Bd
 +WGauubie/aXE4QWdEIzL/I8XvsvJFMu+RPerGK9qY5r62v44NBvdMtTmKVABFYdoYW6
 ms+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s99asDh3KqWhbtaAWLoxUL9KkIJuoxOh8yq3KY5BrWQ=;
 b=HiFeunBIm+5+qTqr+GNj+yfDzzMVxrrCLmDIUOthdAHiKj/y98d0gPs+g5hMtzXKDF
 5AvWD2oktQGdt/INIgooSjCl60mvd9fEfHuIhwoIUHF3XIeq6iVJDCfDtxvbyK9CZ7jQ
 1aVs/zV7FxSElBibY4WDFBCK4VHevHbHZYlFxMOeJ46d+IIn6CdHLfOMHpbxSLN/YeNi
 Y9rfapoSrDdxHvVZPCgKTmGkJlbu2RVvOdzle0etoYiauBnPOp75MjoPLd7DkK4p5ria
 nlVNbLS2JaHb9ggTorfteTmjRBV3S/+h4rSKkkPt+WKrU5YUE1Dv9Fo846CFDf+GzjjL
 D7/g==
X-Gm-Message-State: AOAM533N6AslIzM0p+Aud9eKvGFn4SfO/Bs2Xhjp+de5aZiR5UGrjrqN
 scVsY808fXLRXLN0dFx8amA=
X-Google-Smtp-Source: ABdhPJy9soyYLetfBPPjblNk1wYJKFUpB+0tOinBo70tQjNFkLGhKbqWqfN4gafp7nz51rwX6HIOhg==
X-Received: by 2002:a17:90b:3d7:: with SMTP id
 go23mr16352740pjb.9.1590480292908; 
 Tue, 26 May 2020 01:04:52 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id fa19sm8614477pjb.18.2020.05.26.01.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 01:04:52 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Tue, 26 May 2020 13:33:21 +0530
Message-Id: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH v1 0/3] ethernet: amd: Convert to
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
  amd8111e: Convert to generic power mangement
  amd-xgbe: Convert to generic power management

 drivers/net/ethernet/amd/amd8111e.c      | 30 +++++++++---------------
 drivers/net/ethernet/amd/pcnet32.c       | 22 ++++++++---------
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c | 17 +++++++-------
 3 files changed, 31 insertions(+), 38 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
