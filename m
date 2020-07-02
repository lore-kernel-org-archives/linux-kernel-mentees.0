Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095F8C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 03:53:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1C2207CD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 03:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ3d90KI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE1C2207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 958488929D;
	Thu,  2 Jul 2020 03:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkIHRADWdCfG; Thu,  2 Jul 2020 03:53:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB8168930B;
	Thu,  2 Jul 2020 03:53:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0918C0890;
	Thu,  2 Jul 2020 03:53:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42CF5C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2607489358
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAHGhmjO8RDz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD17689346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:44 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h22so11926171pjf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 20:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcCDFvVNDv5tfHBu7VkyFE5uW3DJnle9jyk1SsEW+/A=;
 b=HQ3d90KI7yetZPuqqx7k8BY4KjIwP/0tv3uZF+dV+DW3Bz13WkomceOpelWoXBGXsc
 vX1Rftx/cbLSNYfwZUnZLrSyTL4UksHA4GSWjme/8qyohxEWEUzJFw4g3dyotyXrwZ9o
 J2Mdo7jpDppvBTIWEFLsHxz0GgUr/LQCNa+Ux07VIkktcj0rD5qSS3EXAjLx1XBTHnwl
 J9CIx42YO9CQvEdmTDU7IUXSadzxbe/tc8oDcLlsPvMw3FGrcZUYEgBAtZbKLXF5sMOJ
 rn3WjGSn1wAWS8ATEihsRoyNbwJYLQEuUbG7O5HNKU/htlWAKQMidubeEur0x5Raddmo
 GyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcCDFvVNDv5tfHBu7VkyFE5uW3DJnle9jyk1SsEW+/A=;
 b=QLoXu6DtNTt4nviV936y9VvXqF3IzlnL61O55l3wJVGis8GVElXW4g+kvyEZhAPm5g
 YGLzqg/01/KnjvVGYFUqzgJ7zWR+vZHVe9xs9Q7RrkTKSDkfdYbHmS00EXC6wVgUsLtm
 dz5UUCjtb7rET+1a1w5c8mPeig6bRLmgUgB79R6TO/s244w2tPfmcb1VD+ZVBuxmO2m8
 kwWXj6BaQ0nSPIZqzqoXRBsFeQwLpaHV7eFaurZ1k+8pBpgARyVtV9R96LQvKRXXyD/r
 pi6eheZXxV5AUZB8TQbHP6GmvBKnC/6PgKVAJ6BK3ZY0ILCeM74AXPNgOqulRexM+r86
 cQyg==
X-Gm-Message-State: AOAM533uuxD7I6ac8UzuB28Ww7jF3D/kiDhek76mboD9FQdUZ4SNecvX
 SLG4AttjJXSExfdu2Z0Ze0Q=
X-Google-Smtp-Source: ABdhPJzQAlEoSv2wWBCHA+xcPr6SXxTyvg03M/f5jaWxBJ/sJLUUg4aleVJKBxDoQKVXd1eT0P+GTw==
X-Received: by 2002:a17:90a:2c0e:: with SMTP id
 m14mr7085307pjd.166.1593662024242; 
 Wed, 01 Jul 2020 20:53:44 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id t187sm7308885pgb.76.2020.07.01.20.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 20:53:43 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jay Cliburn <jcliburn@gmail.com>,
 Chris Snook <chris.snook@gmail.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Thu,  2 Jul 2020 09:22:21 +0530
Message-Id: <20200702035223.115412-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] atheros: use generic power
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

The purpose of this patch series is to remove legacy power management callbacks
from atheros ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (2):
  atl1e: use generic power management
  atl2: use generic power management

 .../net/ethernet/atheros/atl1e/atl1e_main.c   | 53 ++++-----------
 drivers/net/ethernet/atheros/atlx/atl2.c      | 64 ++++++-------------
 2 files changed, 31 insertions(+), 86 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
