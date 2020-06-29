Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19131C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0F12335A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1jI6aqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0F12335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A53A089393;
	Mon, 29 Jun 2020 08:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7ysY8+AqDqF; Mon, 29 Jun 2020 08:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B7E989394;
	Mon, 29 Jun 2020 08:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2678DC0865;
	Mon, 29 Jun 2020 08:17:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B34ACC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1FEA204FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvIPgkJL4p3d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 304FF204F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d194so4581986pga.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgDUE0GKIkXmW6aX8lSR4NBOqlcCjZE7PQjmXBJ/lhQ=;
 b=Z1jI6aqnyUAm3q07oAb5HCKKw4uCkN9ddj5DoN/Sg5VrboJwevPNrx5jLcmZc9Dl8O
 ZRcimyRboN1Mw60EMnIE6sg0WqQspyGB1f47XUPbzFnvcL28gzVoEypDV9PSA492B4qB
 LMY0EoGnFUAttLxvYWDvZy+U616IqcnR3Wgrjq3C7ebwO/PSzhVk5D6D61MlfjqhrPcH
 MGdFVCtnMLP+C03SvJiWfyOZSmg78HZ/2Tv10F1tHbg1RZaJEWFtWk5xGCeQHKhIE4Sn
 eUiAQCmCxLZX4NKVOwTXMuZrMaya1tu3C78hwonMTqzMaIKTD5KAdAxDuVuHJLmmfiP3
 7NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tgDUE0GKIkXmW6aX8lSR4NBOqlcCjZE7PQjmXBJ/lhQ=;
 b=Hhtw6RlROcebggg4UBVJZnn2OIVTkIqzheX17nKl4beUyuelrZiJpEykDck0rzzyYi
 jvfYozi1uzUlDpcnP7Nc2w9MLE9KAmTPwhEnhkUCUVcBlEjz0KNjViLikAub09cBTup5
 wzF5dqDx8a6AnWzqf60P9BybpxKE/4q4Fp2II4+OQOcm4aJFodHZoTg5jQgXkbiAgqbo
 Xevu4mLUKkjAmhGWnzI7tLEkWh8lE3VrdFG48jb9mgT4f0upSHOq6AGhv+0a1dRWkM4h
 Z2nrWCFZx+gT9YanRQNuSnXnTwq83egj70rvZjOq92EUBZQAamH4iYlXG82TQwiD07bZ
 fMLQ==
X-Gm-Message-State: AOAM532TrE6pXORDQoX5X/S4Hzu1JBEALdUVjNYYPlVTTuVVM/2El5bO
 R4oRkuCuRwQf9TpOW0fgUrs=
X-Google-Smtp-Source: ABdhPJzM28IRQ1wZ9naK+e4ccSXlhOR9bkSkq6Iyv0YsLSn5bOc6DAlXFR5zm+eZRxkTJOETv4SPtA==
X-Received: by 2002:a63:6643:: with SMTP id a64mr9557397pgc.246.1593418633762; 
 Mon, 29 Jun 2020 01:17:13 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id co1sm3345154pjb.34.2020.06.29.01.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:17:13 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@gmail.com>, Alex Dubov <oakad@yahoo.com>
Date: Mon, 29 Jun 2020 13:45:26 +0530
Message-Id: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/5] misc: use generic power
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

Vaibhav Gupta (5):
  cb710/core.c: use generic power management
  cardreader/rtsx_pcr.c: use generic power management
  misc/tifm_7xx1.c: use generic power management
  misc/phantom.c: use generic power management
  misc/pch_phub.c: use generic power management

 drivers/misc/cardreader/rtsx_pcr.c | 27 +++++++----------
 drivers/misc/cb710/core.c          | 28 +++++------------
 drivers/misc/pch_phub.c            | 48 ++++++------------------------
 drivers/misc/phantom.c             | 20 +++++--------
 drivers/misc/tifm_7xx1.c           | 30 +++++--------------
 5 files changed, 42 insertions(+), 111 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
