Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800E6C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AD420714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtOkR5jf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AD420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A693886F8;
	Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aT4L45TGcnaN; Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29568884AA;
	Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0592EC0888;
	Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68AF9C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4104C23337
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tczpxzj9819
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B6E920509
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x13so16133817wrv.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9KYL3/QNGdUfmk+FO2Zw/YosA4y8k6PjID3Uf7sVNdc=;
 b=QtOkR5jfF7lmmFdPdljqkdC04VnCGOnahNDsT9a2uCWPfLVGqPGebsOQohqZdJmAvO
 Q9kerB0b+T23muU/+2Yiydhh1mVDK5jhtS+tyjRqZlsLxmrPjIJOM01J96eIryeRw3nd
 HrsdmS5De7fOFhuWQNR80hKHSC0jWry8ZtylyDvAKaoglk7CLsNrmf8vGjGn6y6BEuUZ
 TCF59RiuSsjizZdHIMC3UqT6ThWx8GgWALJXvI9zMYNkRTAJsji+c1Js19VKRUJKuGHh
 4Dtn9I7UI/WUhNNY7JUZzJ4mgyOTLNMtDgEWW/KBcp4EbsVrQe9+ab2yD4mtTQmFIT/7
 qEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9KYL3/QNGdUfmk+FO2Zw/YosA4y8k6PjID3Uf7sVNdc=;
 b=IlGPYpON4tDWTHluot9qOSyROnc8sRMQ4KyQG8GH70tB0qHsbCNBHxWmxj7ab51PeF
 bzy1/Z7wd3UEw+oKAg5jXZTeEvDHpNDu3Ih7WGbAmtib+NclzYyFmD3gK2G16Z2XjjRK
 n6LcUbNuZvF4aLnGsfvO3VoSH0LhBxQwU5ckyCZOwE690JukJuj3/rYutt8Ycu2NrbT7
 1rYDLArq/pS+ERnFVITMeI4DL+uOjoemvgFDu+0kb5FNhtTXPnPlQqDJwTWvqe3bJcsO
 Vml0US/FcuGkQDG6dN4u+cyoYqfl2mhND2ZQLT6ea9fnlHkZhyN8Ad1URgqnHuP/Cg4O
 jSkw==
X-Gm-Message-State: AOAM533/EKq03cDhkUMzXZ9hGdieYCNGsNZZ9IiXhrkpXVFE/iHw9yKG
 VmjpasXcfkAtFxp/rNgzn+4=
X-Google-Smtp-Source: ABdhPJxLXnD+PnWZMq7OsnU4Mxg6o2Ccm3rgVEepbhXZzGk1RDZts5KG01u8CP0K7rsYZGJjSKF1qg==
X-Received: by 2002:a5d:428e:: with SMTP id k14mr27402732wrq.21.1592209930738; 
 Mon, 15 Jun 2020 01:32:10 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:10 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:17 +0200
Message-Id: <20200615073225.24061-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
Cc: Don Brace <don.brace@microsemi.com>, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Russell Currey <ruscur@russell.cc>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 esc.storagedev@microsemi.com, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [Linux-kernel-mentees] [PATCH 0/8 v2] PCI: Align return values of
	PCIe capability and PCI accessors
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


PATCH 1/8 to 7/8:
PCIBIOS_ error codes have positive values and they are passed down the
call heirarchy from accessors. For functions which are meant to return
only a negative value on failure, passing on this value is a bug.
To mitigate this, call pcibios_err_to_errno() before passing on return
value from PCIe capability accessors call heirarchy. This function
converts any positive PCIBIOS_ error codes to negative generic error
values.

PATCH 8/8:
The PCIe capability accessors can return 0, -EINVAL, or any PCIBIOS_ error
code. The pci accessor on the other hand can only return 0 or any PCIBIOS_
error code.This inconsistency among these accessor makes it harder for
callers to check for errors.
Return PCIBIOS_BAD_REGISTER_NUMBER instead of -EINVAL in all PCIe
capability accessors.

MERGING:
These may all be merged via the PCI tree, since it is a collection of
similar fixes. This way they all get merged at once.

Version 2:
* cc to maintainers and mailing lists
* Edit the Subject to conform with previous style
* reorder "Signed by" and "Suggested by"
* made spelling corrections
* fixed redundant initialisation in PATCH 3/8
* include missing call to pcibios_err_to_errno() in PATCH 6/8 and 7/8


Bolarinwa Olayemi Saheed (8):
  dmaengine: ioatdma: Convert PCIBIOS_* errors to generic -E* errors
  IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors
  IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors
  PCI: Convert PCIBIOS_* errors to generic -E* errors
  scsi: smartpqi: Convert PCIBIOS_* errors to generic -E* errors
  PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
  PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
  PCI: Align return values of PCIe capability and PCI accessorss

 drivers/dma/ioat/init.c               |  4 ++--
 drivers/infiniband/hw/hfi1/pcie.c     | 18 +++++++++++++-----
 drivers/pci/access.c                  |  8 ++++----
 drivers/pci/pci.c                     | 10 ++++++++--
 drivers/pci/pcie/aer.c                | 12 ++++++++++--
 drivers/scsi/smartpqi/smartpqi_init.c |  6 +++++-
 6 files changed, 42 insertions(+), 16 deletions(-)

-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
