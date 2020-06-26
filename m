Return-Path: <SRS0=OiW2=AH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428A6C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Jun 2020 15:35:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA3420706
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Jun 2020 15:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Occ0hBEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA3420706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB3BE20134;
	Fri, 26 Jun 2020 15:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42aebg2c3u2G; Fri, 26 Jun 2020 15:35:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D0AB24E00;
	Fri, 26 Jun 2020 15:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F4235C088C;
	Fri, 26 Jun 2020 15:35:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9693C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB26524C93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 15:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lDp-vPTBb39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 15:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D478120134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 15:35:02 +0000 (UTC)
Received: from localhost (mobile-166-170-222-206.mycingular.net
 [166.170.222.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44D4B20706;
 Fri, 26 Jun 2020 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593185702;
 bh=61Aafhz/sebn21egwsMMGm+NbOzYRY3lUCbjT6P131s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Occ0hBEswS0KfEiDUn8Ab9ZytNfsRzopQVvidPVjfnoprbdKkxEYtVtiv7AB4u+7x
 rRslWJ6ZC1NEieDYKoiNI4ymI0qRxj0rhzBhDmIHlZhZylzJhDQHb6DkmqSoTYsRRJ
 Af7htNBpqd23xDGDeNA5qJUnVKXGwRseDDT/bess=
Date: Fri, 26 Jun 2020 10:35:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <20200626153500.GA2895752@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202006250611.HDgpcjeu%lkp@intel.com>
Cc: kbuild-all@lists.01.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/4] ide: use generic power
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

On Thu, Jun 25, 2020 at 06:14:09AM +0800, kernel test robot wrote:
> Hi Vaibhav,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on ide/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/drivers-ide-use-generic-power-management/20200625-013242
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/ide.git master
> config: x86_64-randconfig-a004-20200624 (attached as .config)

This auto build testing is a great service, but is there any way to
tweak the info above to make it easier to reproduce the problem?

I tried to checkout the source that caused these errors, but failed.
This is probably because I'm not a git expert, but maybe others are in
the same boat.  For example, I tried:

  $ git remote add kbuild https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/drivers-ide-use-generic-power-management/20200625-013242
  $ git fetch kbuild
  fatal: repository 'https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/drivers-ide-use-generic-power-management/20200625-013242/' not found

I also visited the github URL in a browser, and I'm sure there must be
information there that would let me fetch the source, but I don't know
enough about github to find it.

The report doesn't include a SHA1, so even if I *did* manage to fetch
the sources, I wouldn't be able to validate they were the *correct*
ones.

> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> reproduce (this is a W=1 build):
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/ide-pci-generic.ko] undefined!
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/serverworks.ko] undefined!
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/piix.ko] undefined!
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/pdc202xx_old.ko] undefined!
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/ns87415.ko] undefined!
> >> ERROR: modpost: "ide_pci_pm_ops" [drivers/ide/hpt366.ko] undefined!
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
