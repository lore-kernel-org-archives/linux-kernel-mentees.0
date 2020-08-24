Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6113BC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 18:17:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298FA206BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 18:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjpynL60"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298FA206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A52185EBF;
	Mon, 24 Aug 2020 18:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1nVyhpFsetA9; Mon, 24 Aug 2020 18:16:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C86285EA4;
	Mon, 24 Aug 2020 18:16:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FEB4C016F;
	Mon, 24 Aug 2020 18:16:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A39F6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A56421552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLNsjkxcIT-i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 084D021548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:16:58 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN (unknown [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C501206BE;
 Mon, 24 Aug 2020 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598293017;
 bh=QN3GnLsscsR8svGqnTbqMwMHQQ/bDpS/a2eA2g9QReo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VjpynL60QoLTwzWlZN5zinIiAG0E1d50mScSwVQ45XMIwzJd+oUNJRzpCsC9/j0mt
 /864QiX79PnsTEQpJmsHEamETUShKdibWmLPcMN/C7OreR5WGPwoY0XncNN5R3+XTZ
 Q+6IIKuKJV7Jy7+nJPy6ZAfVC9iYmnnAaeKFpmzU=
Date: Mon, 24 Aug 2020 11:16:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <20200824111655.20a3193e@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20200823082042.20816-1-himadrispandya@gmail.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
 issue in asix_read_cmd()
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

On Sun, 23 Aug 2020 13:50:42 +0530 Himadri Pandya wrote:
> Initialize the buffer before passing it to usb_read_cmd() function(s) to
> fix the uninit-was-stored issue in asix_read_cmd().
> 
> Fixes: KMSAN: kernel-infoleak in raw_ioctl

Regardless of the ongoing discussion - could you please make this line
a correct Fixes tag?

Right now integration scripts are complaining that it doesn't contain a
valid git hash.

> Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> 

This empty line is unnecessary.

> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
