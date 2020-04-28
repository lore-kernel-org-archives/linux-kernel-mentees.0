Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E93FC8300C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472E5206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpEdhd4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472E5206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E4B942042A;
	Tue, 28 Apr 2020 14:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gipUWjQObaos; Tue, 28 Apr 2020 14:44:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5245A2046A;
	Tue, 28 Apr 2020 14:44:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BDE2C0864;
	Tue, 28 Apr 2020 14:44:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB66EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E256484549
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNWXDmgH55JZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B42284547
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:03 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id e6so1221148pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmxpJsxXAhcqB+ToVZExhvip4vVPdz5UbfhJp3pb3Rg=;
 b=JpEdhd4cifBh5c7FfGbQpg7esariuAxGZdmCnyS/MuOKKFBlwHW46H+u1qAsGkWl2h
 4zsWi/VrJlXbHu2CYHRUPR8FdH6YM7fffG20ZpEkzng0T+DtKmC1H9/5dQLJRCNMRcQa
 4ED3iCvKAwqCjZNfyGqwfdqN5vXclVNZoOeViUVVt/8pmrJscHsJFlDwK8J43xsZwEt1
 u/qhIc6lEJyZp8T3pBgvhLjqZpJjnDttudRto6wWbva5vb2YHplTH8wq8Re/V+hYO8Vj
 USNMAP8K5ZuSDjJD4nEPMj+G2fUUFVQ2z9yRkyupnmoBFtpYnoAJbhf8Va1tuig3gSIX
 fVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmxpJsxXAhcqB+ToVZExhvip4vVPdz5UbfhJp3pb3Rg=;
 b=fBYWb5Glr+p5nVJA07D5o07ymp6fkeGztJf0vJXp/EFpAjrd4/P0PhxeGFe9ovjRs4
 McuhWbIRZUnsIh+SO+fS4TN2r8A4OcuymnnifqHmO2oV4l8cuawfvRCZmZN8COla9jqe
 vJwqmXUINgI19ErG/SWDdjfJxtZhxJt0Vwrx6ts7LzXAD76hWI+t2IJgopLifZBfNlZ2
 AYiL7p+WR+Qm/2VL4UxDslUhKWS5j+D/Ntp8NGeUd1bzwhxolcA1zMf51dLp2k3C8Ij1
 1+aned/pPMZILvGBxGdn/aJwb7l7y3oyrsFYYXA2iDG/iVm0F09b0QQusjSPIBRI38oG
 cDPQ==
X-Gm-Message-State: AGi0PuabF4HvNsRpZ24UeoTEwJ9uQR0K00WiochCuiB3MZWL6D6f/G6L
 g8noQEtD3/so7UMOcnlniAM=
X-Google-Smtp-Source: APiQypLErRiVfS2BcM1F3SXg4qY/JpZaLDKctoUkSw9scfkA5By0Gg4GrF2ZF7DuR5iYOoa+PNuylg==
X-Received: by 2002:a17:902:5ac2:: with SMTP id
 g2mr13356131plm.167.1588085041193; 
 Tue, 28 Apr 2020 07:44:01 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:40f3:10a2:97c1:b981:9f1:d7d0])
 by smtp.gmail.com with ESMTPSA id
 d203sm15053203pfd.79.2020.04.28.07.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:44:00 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Shannon Nelson <snelson@pensando.io>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Martin Habets <mhabets@solarflare.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net
Date: Tue, 28 Apr 2020 20:13:12 +0530
Message-Id: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] realtek ethernet : remove
	legacy power management callbacks.
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

The purpose of this patch series is to remove legacy power management callbacks
from realtek ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly.

Vaibhav Gupta (2):
  realtek/8139too: Remove Legacy Power Management
  realtek/8139cp: Remove Legacy Power Management

 drivers/net/ethernet/realtek/8139cp.c  | 25 +++++++------------------
 drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
 2 files changed, 14 insertions(+), 37 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
