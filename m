Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7504C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:54:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D77221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpW78wvB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D77221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA4D886505;
	Sun, 11 Oct 2020 16:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsHIp2ITP0II; Sun, 11 Oct 2020 16:54:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F18ED864EA;
	Sun, 11 Oct 2020 16:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E31A7C0052;
	Sun, 11 Oct 2020 16:54:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5BBEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 57666204F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7JEOqs5ON8Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9439B204DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:54:38 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF3E321655;
 Sun, 11 Oct 2020 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602435278;
 bh=4zVGZfkfDuY637X0Q4hSpEFjVbRI9H7278GF/Bv9XmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JpW78wvBb7iHONUXHd/t/YcDsDNgaWLHk1NdI7Hu7D/OTwU4QdvuKe8Lj619mfh3X
 GcIhwdgp6nHHtsC9obVC48zXg949YwaoC50ZhkXmNocIot2ddR3zzlRvKx+jA+JCGS
 DboGB2xxjjK2CcuRspFEU/qdGb2ovX9swSneNoFY=
Date: Sun, 11 Oct 2020 09:54:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20201011095436.06131ff3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201010210929.620244-1-anmol.karan123@gmail.com>
References: <20201010210929.620244-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Cc: mkubecek@suse.cz, andrew@lunn.ch, f.fainelli@gmail.com,
 syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 dan.carpenter@oracle.com
Subject: Re: [Linux-kernel-mentees] [PATCH net] ethtool: strset: Fix out of
 bound read in strset_parse_request()
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

On Sun, 11 Oct 2020 02:39:29 +0530 Anmol Karn wrote:
> Flag ``ETHTOOL_A_STRSET_COUNTS_ONLY`` tells the kernel to only return the string 
> counts of the sets, but, when req_info->counts_only tries to read the 
> tb[ETHTOOL_A_STRSET_COUNTS_ONLY] it gets out of bound. 
> 
> - net/ethtool/strset.c
> The bug seems to trigger in this line:
> 
> req_info->counts_only = tb[ETHTOOL_A_STRSET_COUNTS_ONLY];
> 
> Fix it by NULL checking for req_info->counts_only while 
> reading from tb[ETHTOOL_A_STRSET_COUNTS_ONLY].
> 
> Reported-by: syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com 
> Link: https://syzkaller.appspot.com/bug?id=730deff8fe9954a5e317924d9acff98d9c64a770 
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

I think the correct fix for this was already applied to net-next as:

 commit db972e532518 ("ethtool: strset: allow ETHTOOL_A_STRSET_COUNTS_ONLY attr")
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
