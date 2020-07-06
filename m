Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA6DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097D52073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un1Dczxg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097D52073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3194882F6;
	Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGWFKDJoZKuJ; Mon,  6 Jul 2020 10:31:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9566882EC;
	Mon,  6 Jul 2020 10:31:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4692C0891;
	Mon,  6 Jul 2020 10:31:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 263B5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1FED4882F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEUmR2q056+W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93A44882EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so37224169wrw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=725GRWR92GVu/uY+skCayJkzfF6wpN8gi25u6sbBLsE=;
 b=Un1DczxgaDXNy/iNKYqrzFqkEwbciUm9hIX6DAgKniHCGQpPx0i0K3bnrDlhDtMKpo
 q0wOCMtfekkjl30VXCGPsS+hG9TelNr4M22raZFCY1YiPTUCHKlv5LWhVJIM+61RAQ6C
 bDrbnuRbETSBP1g8ensB++LtXywT+9Xs/XqeqsRGcj7TONjuhlccD2V+j91UWsYqsQR0
 t8AEyBoLZqyZXcPNvyTwCbOJUrosIV2Lrrli2/uwd0o/Lszt5TsMCB32M+9pBeN/LFCg
 BB7qSYGi11M+hdSekGJ/YUGiTqShZAvFXAqHx7/fyWecZI12olWLwYnfCowTeNzfodkx
 70Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=725GRWR92GVu/uY+skCayJkzfF6wpN8gi25u6sbBLsE=;
 b=D5SdjYZ55cSv/94IxsM7UXMvCVdf7EHK+BaswKEjVWP6tUeEdEWr3NYc7Y25kpD5yv
 pZMerJ/8iO7LsnLbwdgYWJpK1NdzkM7lisZY2ZaV87oddOoITECL4DdLHTITv56/aD6y
 z1EpXR6wCaLedA+B4hzILkUGv4692Fxvx/YWDiPtseihEEVKiEGQNWWLDtDERd/DHgPV
 rmxFs6BPVg/Rj+8h3H/v2E0Oad/HjI0MRNS3kBYnHbg/00Wixm0cwhdumRPNq2AB0hco
 LWdX6Wg+78XmpyPyOAbP8JIATvK51Cb9QEm7WA9PZqADcBkEpqKeHYHuFU8ulwgmLByK
 xhNw==
X-Gm-Message-State: AOAM533Uug72i2hrgDKA181qNA/Xgx4EWgudZ9LOo3LDNiW8pX1kN7lk
 DJJlZyaGrZ4Czau07GZILwg=
X-Google-Smtp-Source: ABdhPJwildPDtdFFvGu+6UipH246vuUUOhwlfa1qFX6Wd0FaSEnPrsMkjz6fL41zF5RaRLD9WT6dQg==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr19054078wro.245.1594031509940; 
 Mon, 06 Jul 2020 03:31:49 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:49 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon,  6 Jul 2020 11:31:10 +0200
Message-Id: <20200706093121.9731-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Len Brown Lukas Wunner <"lenb@kernel.orglukas"@wunner.de>,
 linux-acpi@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 Russell Currey <ruscur@russell.cc>, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-rdma@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 0/11 RFC] PCI: Remove "*val = 0" from
	pcie_capability_read_*()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

*** BLURB HERE ***

Bolarinwa Olayemi Saheed (9):
  IB/hfi1: Confirm that pcie_capability_read_dword() is successful
  misc: rtsx: Confirm that pcie_capability_read_word() is successful
  PCI/AER: Use error return value from pcie_capability_read_*()
  PCI/ASPM: Use error return value from pcie_capability_read_*()
  PCI: pciehp: Fix wrong failure check on pcie_capability_read_*()
  PCI: pciehp: Prevent wrong failure check on pcie_capability_read_*()
  PCI: pciehp: Make "Power On" the default in pciehp_get_power_status()
  PCI/ACPI: Prevent wrong failure check on pcie_capability_read_*()
  PCI: Prevent wrong failure check on pcie_capability_read_*()
  PCI: Remove "*val = 0" fom pcie_capability_read_*()

 
 drivers/infiniband/hw/hfi1/aspm.c | 7 ++++---
 drivers/misc/cardreader/rts5227.c | 5 +++--
 drivers/misc/cardreader/rts5249.c | 5 +++--
 drivers/misc/cardreader/rts5260.c | 5 +++--
 drivers/misc/cardreader/rts5261.c | 5 +++--
 drivers/pci/pcie/aer.c  |  5 +++--
 drivers/pci/pcie/aspm.c | 33 +++++++++++++++++----------------
 drivers/pci/hotplug/pciehp_hpc.c | 47 ++++++++++++++++----------------
 drivers/pci/pci-acpi.c           | 10 ++++---
 drivers/pci/probe.c              | 29 ++++++++++++--------
 drivers/pci/access.c | 14 --------------
 11 files changed, 82 insertions(+), 83 deletions(-)

-- 
2.18.2


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
