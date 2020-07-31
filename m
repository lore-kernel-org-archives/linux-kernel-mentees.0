Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E74C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5E722CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV77SFHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C5E722CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED84B886F4;
	Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rrj23kx8v1f7; Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68789886B7;
	Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1ADD1C0050;
	Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4797C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF6C188318
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Mv-0ymntoFZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 849B987784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:18 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id c16so10782639ejx.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZPoeO3tTC7ewTWnbFijLfWrL4pIpzl5ZB76dv/p6S+8=;
 b=IV77SFHdlJClAFDI4KSZtVJdC2DAtGrxQmIzbw7GOFGworBySBIYMfm9Yv26Y/SKyP
 rJ/5xlxCVrVFPq8kGTy8sYSnl8lJJRNSCrGsHmSuT/Q/6f6ZNhMo+IUMump4oyHXnbT4
 zdg6GnXC6I2EnnmIO+QWUt/QBdgUQDiMTBzZ1MF6LcHzPH6p6WiuMJRqgKLwdVXr0w6T
 A41vxNL3Pbxy7zwarGyvn0JkT7Sx1d9otfI42XD75uRhNvxzHSotK52Z7UcRx/7L0KoB
 ev5oiKfqKrPihVeHMlZvAQD8DrotfvZAdy9sCn3f87cYflYMriFMzeKWHMdJMTvHmefD
 7wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZPoeO3tTC7ewTWnbFijLfWrL4pIpzl5ZB76dv/p6S+8=;
 b=QWZrVl4yvucHHHeClxmaSBP9Xw3rslc4pN0UkaXyeKBnuBBWDrVBau9M2awVUYToXQ
 VfHaEUCqX3bhQnXMiyZIiOFdfDkbdoGFrZ8SBqjDLTHUytouWFbcMbqtAtJrj3TOSzc2
 uMVpzydc3y0LqWOh2QXjUPXF7w3O7xLxFa07W1em1wzKa8y8A2WKrUCoFh4GRQ91otmx
 HwbA38HMeb7MtThcG9Jd9u4dp+YvKhbn238DyyLqU+IvcVac+rZVsCjrnaJwI5lhfHB5
 gaQ+Aqxgnh0+6YByCuqFabVrpzJ9YYnksisgLQqttb5wP0dPTylYgXZXy2cQx9c1eir3
 bjtQ==
X-Gm-Message-State: AOAM5308xjFOwreKr1B5XM3YhHIr1uVKSQGkfe3NEHw/7Tu+W/cCeEEa
 VYC5QICxgwaDt6Ujf6LwlRQ=
X-Google-Smtp-Source: ABdhPJzjoTcnAvyDzlAqwJiXlviIPrdknthesuHRXw6Drk1Mxsa9h9E21KaWBpHYtCNmp+wuQyAJqg==
X-Received: by 2002:a17:906:d7b1:: with SMTP id
 pk17mr3684852ejb.554.1596196936900; 
 Fri, 31 Jul 2020 05:02:16 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:16 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, Russell Currey <ruscur@russell.cc>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 31 Jul 2020 13:02:28 +0200
Message-Id: <20200731110240.98326-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
Cc: linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 00/12] PCI: Remove '*val = 0' from
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

v4 CHANGES:
- Drop uses of pcie_capability_read_*() return value. This related to
  [1] which is pointing towards making the accessors return void.
- Remove patches found to be unnecessary
- Reword some commit messages

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
- Patch 6/12 depends on Patch 5/12. However Patch 5/12 has no dependency.
  Please, merge PATCH 6/12 only after Patch 5/12.
- Patch 12/12 depends on all preceding patches. Please merge Patch 12/12
  only after other patches in this series have been merged.
- All other patches have no dependencies besides those mentioned above and
  can be merge individually.

PATCH 5/12:
Set the default case in the switch-statement to set status
to "Power On".

PATCH 1/12 to 11/12:
Use the value read by pcie_capability_read_*() to determine success or
failure. This is done by checking if it is ~0, while maintaining the
functions' behaviour. This ensures that the changes in PATCH 12/12 does
not introduce any bug.

PATCH 12/12:
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

[1] https://lore.kernel.org/linux-pci/20200714234625.GA428442@bjorn-Precision-5520/


Saheed O. Bolarinwa (12):
  IB/hfi1: Check if pcie_capability_read_*() reads ~0
  misc: rtsx: Check if pcie_capability_read_*() reads ~0
  ath9k: Check if pcie_capability_read_*() reads ~0
  iwlegacy: Check if pcie_capability_read_*() reads ~0
  PCI: pciehp: Set "Power On" as the default get_power_status
  PCI: pciehp: Check if pcie_capability_read_*() reads ~0
  PCI/ACPI: Check if pcie_capability_read_*() reads ~0
  PCI: Check if pcie_capability_read_*() reads ~0
  PCI/PM: Check if pcie_capability_read_*() reads ~0
  PCI/AER: Check if pcie_capability_read_*() reads ~0
  PCI/ASPM: Check if pcie_capability_read_*() reads ~0
  PCI: Remove '*val = 0' from pcie_capability_read_*()

 drivers/infiniband/hw/hfi1/aspm.c            |  6 ++--
 drivers/misc/cardreader/rts5227.c            |  2 +-
 drivers/misc/cardreader/rts5249.c            |  2 +-
 drivers/misc/cardreader/rts5260.c            |  2 +-
 drivers/misc/cardreader/rts5261.c            |  2 +-
 drivers/net/wireless/ath/ath9k/pci.c         |  3 +-
 drivers/net/wireless/intel/iwlegacy/common.c |  2 +-
 drivers/pci/access.c                         | 14 --------
 drivers/pci/hotplug/pciehp_hpc.c             | 13 +++++---
 drivers/pci/pci-acpi.c                       |  4 +--
 drivers/pci/pci.c                            | 34 ++++++++++++++------
 drivers/pci/pcie/aer.c                       |  2 +-
 drivers/pci/pcie/aspm.c                      | 10 +++---
 drivers/pci/probe.c                          | 12 +++----
 14 files changed, 56 insertions(+), 52 deletions(-)

-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
