Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB31CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:26:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F98923134
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETUdifcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F98923134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2AC60207B0;
	Mon, 29 Jun 2020 07:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81NC1fhSwixJ; Mon, 29 Jun 2020 07:26:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D3E7820448;
	Mon, 29 Jun 2020 07:26:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B83B8C07FF;
	Mon, 29 Jun 2020 07:26:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8F42C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BEDB7207B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D+uMizTdoQwC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:26:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0DB3320448
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:26:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x11so6750945plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYJKmE7yRo1ixIz8HpJIKtPVneklCF0ayYZCHIK8EeE=;
 b=ETUdifcZaxHgQ48Wde9ZIvalgHRr2IpHQLLiZnWHytAq24TQ8K7zASRVrF/+skVFqn
 RKlKDVZkTI8ZndVkU4DtGQdNSA/BgX4OjdoC4bH9ACkvNJn49fDp7fwLatM1xLWxK7bE
 +W5+Pb3Vvtlsh5ZuB1W+gN2cnZc0HrLFU2+1Xc13CDA14a19fcbXdz3sBiLikw5PhSt5
 x+ah6FfNTa9hRJkIBleZu2Rl1eD5ZE6pEqMU3Zjm0GBgWzAeoHtZzf9SFMr9pXRId/dG
 VKnZmRR0yJGFOc4F0BEuxTdI7I58coK4BOSc4QHoHu7baAKr+2QP9qscaIPVxo7ynAev
 B/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYJKmE7yRo1ixIz8HpJIKtPVneklCF0ayYZCHIK8EeE=;
 b=iZnkSA2DWHOljjsj90wx2MGcCLq7+Ae+gf48zJxR6KlXzmVNiXylHj1tZLvr4VvmeC
 rnOyAl20YneKx9NdGpQjGo+GeUEp0sK+3bWU+H3yoCoMG9I0NAaCWX0zfYNPg4q6h/8V
 9ulLZsTLhvr4/J5J78CBYfpSLscZGAt6K/C3fo7/AIRkLTgnrVwuM2BQFGbOyfHKz+7X
 tXMvVRCytFlDAKt33k9sakAyLsoWMWWjs8TUgjsS/lsatDo4TyRukt65DcdbWUX8UcrX
 wwujPI6no7cNtBP7SXrO22VvH4IFJwX9GM8BA9ktNcnwabqL+jsEktUkc4rE9MNsCcCi
 2BCQ==
X-Gm-Message-State: AOAM530kprjJ08jds1WCZJjuq7ykNu85aw0KgEfAPoBxFvLX+fYm2F3v
 xhU06DTVTlNVBaTv5yi7xcE=
X-Google-Smtp-Source: ABdhPJw7/Ns0hjjDKLsAKA2XwfV4jnOl/CKEE+c4gdUObP9BqDcFYIDHPoFLlO72Kc3GEdrw8wp7Mw==
X-Received: by 2002:a17:902:710d:: with SMTP id
 a13mr11960415pll.71.1593415609467; 
 Mon, 29 Jun 2020 00:26:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34637627pfk.86.2020.06.29.00.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:26:48 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 29 Jun 2020 12:55:23 +0530
Message-Id: <20200629072525.156154-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] ipw2x00: use generic power
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
from amd ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (2):
  ipw2100: use generic power management
  ipw2200: use generic power management

 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------------
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++--------------
 2 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
