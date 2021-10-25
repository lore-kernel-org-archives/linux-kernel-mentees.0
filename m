Return-Path: <SRS0=xjH5=PN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BE9C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170B7610EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 170B7610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53BE80F01;
	Mon, 25 Oct 2021 17:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEr-PVNNJ8NZ; Mon, 25 Oct 2021 17:01:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E3B9A80EF0;
	Mon, 25 Oct 2021 17:01:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE5D1C0019;
	Mon, 25 Oct 2021 17:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49C4BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279D040443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-sIKr2oF34o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A00040442
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:01:24 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i5so8363045pla.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HZsp9BvdntOEBLsd033W6ZW3RXr9hJrrgi/DSIEiZc=;
 b=B/oKHfT/wUi2uwyEuNgWcKyEN7bNb1zznXch9q1rURws+JRljbJEIPz0+rgscXU0+Y
 SCs5Z+HviUmO/AG6Z/ANiKZe4sA5pzDCa+CIEjE3N5dq9PnkcFuiSkw3lDaQaV/ep//u
 ML0AA4vKJiuK7hluPphy+3uxXyhhohyLOWd/UXwTy3rPg2TO7smbF3Fwk9xJQHUp31bm
 LBfNWATE8ZnQ0WXPUVZXg8XJ+cEYa++C35DWFIZz9KbWcTReIP/lY78+rYfYbXko3beJ
 y/jCN5CcI/o3LdBpkqsUiU46xGnE0j44QUDcKmtzvDotdBtawKt/3XJNuzWrpRHLrlmY
 C2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HZsp9BvdntOEBLsd033W6ZW3RXr9hJrrgi/DSIEiZc=;
 b=sHr+BrmvEuNbq8t+eAZe5kYw/2kZJl4qvFOtr7W2tbWphHBr4uoNabOEssxcuT7Zv9
 tnyt9qJOPtQAwac1JDyJv5KDpzy2cC5s2vJccM/Wrt1/QPq7O/lnCGPEGnicLdRMKeHZ
 XIfDhdQSWKYBKrJ23nn17LbwKbj+Mqw9IFAOTqhFKGu1+Jdv2iKdrYzL9PeUlUpIlUpw
 4Sf9TqlB5xjAQrIo416aZR72gQLLyZYPMl2kgch/mfvGDbfjpholj3p3FkXim9DtPWRJ
 avSC1qYcZDlfZPkN2Z0D0B4mPxTuhd+v0bruoh+u7xdV0QKzTSkWKk/I+w2b0+5dqT6S
 3Urw==
X-Gm-Message-State: AOAM530TthDZb5qydAMi3FZ1IXlT4jCuhV/oVaZWaXv+wjNSkoRUlOME
 K684epLW/475ZxicT1b34PA=
X-Google-Smtp-Source: ABdhPJwUXQUjwnugVGLJbHKCyPdLUZ/UBQqXh8Cy82r1VP1k13Hq1CAUhdRWR7+Izqw0iqyEfe89ug==
X-Received: by 2002:a17:90a:2c9:: with SMTP id
 d9mr22098933pjd.73.1635181283642; 
 Mon, 25 Oct 2021 10:01:23 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:01:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 0/5] Fix long standing AER Error Handling Issues
Date: Mon, 25 Oct 2021 22:30:59 +0530
Message-Id: <cover.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This patch series aims at fixing some of the AER error handling issues
we have.

Currently we have the following issues: 
  
  1. Confusing message in aer_print_error()
  2. aer_err_info not being initialized completely in DPC path before 
     we print the AER logs
  3. A bug [1] in clearing of AER registers in the native AER path

[1] https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/

The patch series fixes the above things.

PATCH 1: 
  - Fixes the first issue
  - This patch is independent of other patches and can be applied
    seperately

PATCH 2 - 3:
  - Fixes the second issue
  - Patch 3 is depended on Patch 2 in the series

PATCH 4
  - Fixes the bug in clearing of AER registers which leades to
    AER message spew [1]

PATCH 5:
  - Adds extra information (devctl register) in AER error logs.
  - Patch 5 depends on Patch 4 of the series

Thanks,
Naveen Naidu

Changelog
=========
v5:
    - Edit the commit message of Patch 1 and Patch 5 to include how to
      test the AER messages using aer-inject.
    - Edit Patch 3 to initialize info.id depending on the trigger
      reason.
    - Drop few patches (v4 4/8, 5/8 7/8) since they were wrong.

v4:
    - Fix logical error in 6/8, in the previous version of the patch set
      there was a bug, in how I added the devices to the queue.

v3:
    - Edit the commit messages to be in imperative style and split the
      commits to be more atomic.

v2:
    - Add [PATCH 7] which includes the device control register 
      information in AER error logs.

Naveen Naidu (5):
  [PATCH v5 1/5] PCI/AER: Remove ID from aer_agent_string[]
  [PATCH v5 2/5] PCI: Cleanup struct aer_err_info
  [PATCH v5 3/5] PCI/DPC: Initialize info.id in dpc_process_error()
  [PATCH v5 4/5] PCI/AER: Clear error device AER registers in aer_irq()
  [PATCH v5 5/5] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 269 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |  16 ++-
 3 files changed, 214 insertions(+), 94 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
