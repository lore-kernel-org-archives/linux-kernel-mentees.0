Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E3EC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2287E21D7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJw/CWfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2287E21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F19E788B2E;
	Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXjQr_e1iA0C; Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3CF9788B09;
	Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 225BEC0891;
	Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B89CDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A793288B1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HijXlW9bvzWy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AC7D388B09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:33 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a8so16432810edy.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z9A/niHETTJ6sG1YCidrVIts+5Cm3jRqOKxgMwZf804=;
 b=bJw/CWfEaGdgNEsvB+E0Pil+beiADxQRlYxFucL33vnzGqhY657FC8SLKndNCYmWBW
 RG5pWkJLTJi7uV42p3TsQHKr/zZfidLqtMJ6mhYMNC7lnI8wL9ob0ZHPC/oUfDh7idx9
 YzZ5BPoKFaD4VIy/72jiqKG0NxCQQ/8/m0foHD5mlcSJx45cFGCE0ILJ//80+HYv7hgW
 vQPwbztXczFxvfH8naRy5OzPhS16kn4sp5IQ1SShba7JIk1FYKiSmcPbBnzuxhJPin52
 zs+2qK4Yl/c3Za2m01tJx2/dAlc7v3zAHdgKWQuYZnn8eWzCtCNQsxS2ZxmznDCviBeh
 Aeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z9A/niHETTJ6sG1YCidrVIts+5Cm3jRqOKxgMwZf804=;
 b=cvBKDGv6Po2a/x/rmgoD/e/oZWwNQYBkOKpFxuh7KFavnfOwX/C3kOGTQmUOwsBHAY
 7OelW+FEJ+xGbnSSWWuNNvw+X1BTyeujp59u4hADabH3yxn60Ob0Ut2rE/E4TMWmarxQ
 dfDWnOJcX/ITB524bf/LhFDnnhrg9gGDhbam1ocAEuRD7n5gyYOsRvPcfSeEEBVUegV5
 cFDwy6L8GWko1t2u02beQ1Y439dOTzqnlwHjj2EAtfiWPA3yQ2ABYDbMemvJwFoW3oM3
 +N04aB4+P0dWA62uy4KF1FYUcKH+DLvXDf/jgffqxTi3YOboGDhFejsw0bND0HLEDE20
 h9tg==
X-Gm-Message-State: AOAM5337k1gITsBlq9wddd9UD2YtcZeXiiPc4IhvzqENtY/zU9UcuJ4r
 xggW+F2iQc2WZl+1rneJr1Y=
X-Google-Smtp-Source: ABdhPJz5BLx6UNGp+PcUoVcl9C9PveBd35/nU0renWNn761chkn0KvLT9qpMImrdubKCO2n43ShSeQ==
X-Received: by 2002:a05:6402:176e:: with SMTP id
 da14mr3798086edb.262.1594721071939; 
 Tue, 14 Jul 2020 03:04:31 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id bs18sm14137672edb.38.2020.07.14.03.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:04:31 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Tue, 14 Jul 2020 13:04:42 +0200
Message-Id: <20200714110445.32605-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/14 v4] PCI: Remove '*val = 0' from
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

v4 CHANGES:
- Remove unnecessary boolean conversion
- fix bugs introduced by previous version in PATCH 11/14

v3 CHANGES:
- Split previous PATCH 6/13 into two : PATCH 6/14 and PATCH 7/14
- Fix commit message of PATCH 5/14
- Update Patch numbering and Commit messages
- Add 'Acked by Greg KH' to PATCH 2/14
- Add PATCH version

v2 CHANGES:
- Fix missing comma, causing the email cc error
- Fix typos and numbering errors in commit messages
- Add commit message to 13/13
- Add two more patches: PATCH 3/13 and PATCH 4/13

MERGING:
Patch 7/14 depends on Patch 6/14. However Patch 6/14 has no dependency.
Please, merge PATCH 7/14 only after Patch 6/14.
Patch 14/14 depend on all preceeding patchs. Except for Patch 6/14 and
Patch 7/14, all other patches are independent of one another. Hence,
please merge Patch 14/14 only after other patches in this series have
been merged.


PATCH 6/14:
Make the function set status to "Power On" by default and only set to
Set "Power Off" only if pcie_capability_read_word() is successful and
(slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF. 

PATCH 1/14 to 13/14:
Check the return value of pcie_capability_read_*() to ensure success or
confirm failure. While maintaining these functions, this ensures that the
changes in PATCH 14/14 does not introduce any bug. 

PATCH 14/14:
There are several reasons why a PCI capability read may fail whether the
device is present or not. If this happens, pcie_capability_read_*() will
return -EINVAL/PCIBIOS_BAD_REGISTER_NUMBER or PCIBIOS_DEVICE_NOT_FOUND
and *val is set to 0.

This behaviour if further ensured by this code inside
pcie_capability_read_*()

 ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 /*
  * Reset *val to 0 if pci_read_config_dword() fails, it may
  * have been written as 0xFFFFFFFF if hardware error happens
  * during pci_read_config_dword().
  */
 if (ret)
	 *val = 0;
 return ret;

a) Since all pci_generic_config_read() does is read a register value,
it may return success after reading a ~0 which *may* have been fabricated
by the PCI host bridge due to a read timeout. Hence pci_read_config_*() 
will return success with a fabricated ~0 in *val, indicating a problem.
In this case, the assumed behaviour of  pcie_capability_read_*() will be
wrong. To avoid error slipping through, more checks are necessary.

b) pci_read_config_*() will return PCIBIOS_DEVICE_NOT_FOUND only if 
dev->error_state = pci_channel_io_perm_failure (i.e. 
pci_dev_is_disconnected()) or if pci_generic_config_read() can't find the
device. In both cases *val is initially set to ~0 but as shown in the code
above pcie_capability_read_*() resets it back to 0. Even with this effort,
drivers still have to perform validation checks more so if 0 is a valid
value.

Most drivers only consider the case (b) and in some cases, there is the 
expectation that on timeout *val has a fabricated value of ~0, which *may*
not always be true as explained in (a).

In any case, checks need to be done to validate the value read and maybe
confirm which error has occurred. It is better left to the drivers to do.

Check the return value of pcie_capability_read_dword() to ensure success
and avoid bug as a result of Patch 14/14.
Remove the reset of *val to 0 when pci_read_config_*() fails.


Bolarinwa Olayemi Saheed (14):
  IB/hfi1: Check the return value of pcie_capability_read_*()
  misc: rtsx: Check the return value of pcie_capability_read_*()
  ath9k: Check the return value of pcie_capability_read_*()
  iwlegacy: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Make "Power On" the default 
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI/ACPI: Check the return value of pcie_capability_read_*()
  PCI: pciehp: Check the return value of pcie_capability_read_*()
  PCI: Check the return value of pcie_capability_read_*()
  PCI/PM: Check return value of pcie_capability_read_*()
  PCI/AER: Check the return value of pcie_capability_read_*()
  PCI/ASPM: Check the return value of pcie_capability_read_*()
  PCI: Remove '*val = 0' from pcie_capability_read_*()

 drivers/net/wireless/ath/ath9k/pci.c         | 5 +++--
 drivers/net/wireless/intel/iwlegacy/common.c | 4 ++--
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
 13 files changed, 87 insertions(+), 87 deletions(-)

-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
