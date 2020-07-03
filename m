Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24459C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:05:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBAE820A8B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQB1Gr6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBAE820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C7B6687C94;
	Fri,  3 Jul 2020 03:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4cqE-T14WQ2; Fri,  3 Jul 2020 03:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BB1C87C85;
	Fri,  3 Jul 2020 03:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29E39C0888;
	Fri,  3 Jul 2020 03:05:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D43C3C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D00918976B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XevxuLb6Vn9U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 921898974C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:05:35 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id h16so2748930ilj.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 20:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8+UQwuXxC+Hk3b/RHaKYib5FH1f4hDdnk1vs6FzplY=;
 b=rQB1Gr6B2JLCZdZMlpDDPYmtUXdmlci/ut3szK2nGMpgrgDKccBRZAdg7fM3tFmJTm
 SuEKqBqdyoSbj98eRtt5au0pjnW+ssSxt0i0mB6mYkfly1bWvVaww+ki975o0IK/G5+I
 6oig7P8QXjKuD4bWBxbVtlJX0bDAPUmg85lXUCYHf/FiXgm1oq5rF1WvAfM4S8JSL8+t
 Gr2oet6kSZgQcQuZ3H3NsK5sMeOCZlFiwz54Gf+qF0Fcy/FLIvALpVM440td7cnOW+0O
 upMPb8cz/cqRBhnfWNycYTqsl52w7uE/YMH54czeX3ACQ/yKpavTldf7HhisQzyBwYod
 BJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8+UQwuXxC+Hk3b/RHaKYib5FH1f4hDdnk1vs6FzplY=;
 b=uNsJYE7Pl6glJk+xcr/MfOuUmwgUjkvMEqxi3hJ99FlXiq77lC61JPF/dCYvopTm/W
 DXV2ZUJxr3dAwO3JFBvF34iCfNNabBQNveTzINdqPpYcOCStc0j1aIADTiBm6BZsFCgl
 +3I41lc0824kvBSGwoaDEKjZquEVf+tEybwG5CfJvrazlfMUjYy8xZMe2fZE5NkVa/AU
 GuGjXUOxsXIRgTdKNKCSVvE2JbpE2iYz/TCzQ7nWkl/S3D7F2tdbcbUccARRJzEi73LG
 UyKaj+fvI4s400PNlvCKzVy86pRh6B1ZvRkbo+W0UWeMaDbcY9ZB6jA/U9nzIhthPbKA
 7TVg==
X-Gm-Message-State: AOAM530xG2iPnMH9MNSRUe+HYMW8KmLGP5i5e4IMKI72NX4JoIV5INlq
 CK4Y21DCvYrgxezYUToz0uLw08j9uriLH5t5DbY=
X-Google-Smtp-Source: ABdhPJz4+ioeA2nP9zgX8fa88ROeI1ZyFyxLz8J8nizj7PhHFLtQKDEM9PXwCV1FqYNWrRydgcUhR8hBHGE4zJATX/A=
X-Received: by 2002:a92:cc50:: with SMTP id t16mr15622736ilq.180.1593745534863; 
 Thu, 02 Jul 2020 20:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200702105351.363880-3-vaibhavgupta40@gmail.com>
 <202007030309.DqqVrhAQ%lkp@intel.com>
In-Reply-To: <202007030309.DqqVrhAQ%lkp@intel.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 3 Jul 2020 08:33:54 +0530
Message-ID: <CAPBsFfDcugy2=wzd49riVkG+_CZJ01j4i9M44zpdDjGYEHFu8Q@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Steve Glendinning <steve.glendinning@shawell.net>, kbuild-all@lists.01.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, Bjorn Helgaas <helgaas@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] smsc9420: use generic
	power management
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

On Fri, 3 Jul 2020 at 01:38, kernel test robot <lkp@intel.com> wrote:
>
> Hi Vaibhav,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.8-rc3 next-20200702]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/smsc-use-generic-power-management/20200702-185914
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cd77006e01b3198c75fb7819b3d0ff89709539bb
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 003a086ffc0d1affbb8300b36225fb8150a2d40a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/net/ethernet/smsc/smsc9420.c:1466:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>            if (netif_running(dev)) {
>                ^~~~~~~~~~~~~~~~~~
>    drivers/net/ethernet/smsc/smsc9420.c:1471:9: note: uninitialized use occurs here
>            return err;
>                   ^~~
>    drivers/net/ethernet/smsc/smsc9420.c:1466:2: note: remove the 'if' if its condition is always true
>            if (netif_running(dev)) {
>            ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/ethernet/smsc/smsc9420.c:1460:9: note: initialize the variable 'err' to silence this warning
>            int err;
>                   ^
>                    = 0
>    1 warning generated.
>
> vim +1466 drivers/net/ethernet/smsc/smsc9420.c
>
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1456
> 7d465053ec82e2 drivers/net/ethernet/smsc/smsc9420.c Vaibhav Gupta     2020-07-02  1457  static int __maybe_unused smsc9420_resume(struct device *dev_d)
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1458  {
> 7d465053ec82e2 drivers/net/ethernet/smsc/smsc9420.c Vaibhav Gupta     2020-07-02  1459          struct net_device *dev = dev_get_drvdata(dev_d);
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1460          int err;
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1461
> 7d465053ec82e2 drivers/net/ethernet/smsc/smsc9420.c Vaibhav Gupta     2020-07-02  1462          pci_set_master(to_pci_dev(dev_d));
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1463
> 7d465053ec82e2 drivers/net/ethernet/smsc/smsc9420.c Vaibhav Gupta     2020-07-02  1464          device_wakeup_disable(dev_d);
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1465
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11 @1466          if (netif_running(dev)) {
> b5a80837b7e125 drivers/net/ethernet/smsc/smsc9420.c Francois Romieu   2012-03-09  1467                  /* FIXME: gross. It looks like ancient PM relic.*/
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1468                  err = smsc9420_open(dev);
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1469                  netif_device_attach(dev);
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1470          }
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1471          return err;
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1472  }
> 2cb377283f3469 drivers/net/smsc9420.c               Steve Glendinning 2008-12-11  1473
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Fixed. Thanks!
-- Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
