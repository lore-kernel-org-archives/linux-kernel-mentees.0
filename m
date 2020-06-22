Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D15C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED56D20706
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lftijr+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED56D20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC69789352;
	Mon, 22 Jun 2020 11:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tomXJbtEpBHv; Mon, 22 Jun 2020 11:15:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A203B8934B;
	Mon, 22 Jun 2020 11:15:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D034C0891;
	Mon, 22 Jun 2020 11:15:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B34FCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A53121FFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDBS+EDlNAYN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 03E1921FF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q22so5154119pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYAXPW7DT0kbvzrQebyhhIbPbS864IccOljK5pvAni0=;
 b=lftijr+BoVI2hKAc7YoyK6NPtN166LMRGO8r4gck9Aa5QzCc6tqZOvR68LxyOR4rOW
 b3MdgwPqdDDW+/jySMgdBT4pSqbFHM/O3eydto3DTigvIh+fwwLgcICyHKXFAcZ4Aeqg
 c/qBlBZ2uHXBvXFO1InOJ57M5ErQFNAv5Aj15mtTRcMJOslpucX46ZesUofRzcTe4RJb
 FtI2kOva6fiKZoUVLWWHTJN7YlLvyQVZE/2CM9X/wXhY+OE0HD4teXffpw73mB2eUIc6
 EIu8WSrKdeLX0aPSlKaiLEeGHRL9+cpNUT9Eijng6rEMbEhKugVMaoCM6BFbfqmNJlkE
 djDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYAXPW7DT0kbvzrQebyhhIbPbS864IccOljK5pvAni0=;
 b=R0LY0TE3sdqIamz8WVrPlyt5aROkzLidq8WwFkPf0khew6kF+KjKMTPA6waUTIaF8h
 a1yKC3uN+xYOg9X1TBWev4/FiFMqpLAfKLBzRHEygquOlAjCR0mwE/CaxyJnk28Eh++p
 CVuHzCiGPSI+jD76awvyZBq1aj6/esnkv++2wI+g094oVnTL2wIxd/xfeQF4fTmZMbcR
 BrGDIMbcvEr4q0/5bw0W9j+ZRwqPKErFR/W7C3HjOddy95kQWDfUc21IDGgBfVs3gONL
 mmlA3gamuJzA9ZO3hjksQ/kjHfNM+Bv0SXX+2Pg7a0HZGPr1xeSwJlC+wtkwRY37u1Ax
 u22g==
X-Gm-Message-State: AOAM531lkxzuC7qbkw+ULwd1+20kYojXYm7+8NoIGK+cD1BnpTQ+6vv6
 u/pWkSijHH4HfepEKMTEsUU=
X-Google-Smtp-Source: ABdhPJyCOvfUH6liRGyVXYWOxijl72Ct8WwDBg0elvqKh/Vgh2QOd6SHNWiMZ8xVMdwX5xl9H9MANg==
X-Received: by 2002:a62:194d:: with SMTP id 74mr20748665pfz.21.1592824510388; 
 Mon, 22 Jun 2020 04:15:10 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id n189sm13950150pfn.108.2020.06.22.04.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:15:09 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 22 Jun 2020 16:43:57 +0530
Message-Id: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] ethernet: amd: Convert to
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
  amd8111e: Convert to generic power management
  amd-xgbe: Convert to generic power management

 drivers/net/ethernet/amd/amd8111e.c      | 30 +++++++++---------------
 drivers/net/ethernet/amd/pcnet32.c       | 22 ++++++++---------
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c | 19 +++++++--------
 3 files changed, 31 insertions(+), 40 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
