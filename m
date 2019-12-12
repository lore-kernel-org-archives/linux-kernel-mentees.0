Return-Path: <SRS0=PP36=2C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A66C00454
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 18:04:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AD424676
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 18:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n13dv87d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7AD424676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C38C88705;
	Thu, 12 Dec 2019 18:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vtTmI9sMdQF; Thu, 12 Dec 2019 18:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12C45888A9;
	Thu, 12 Dec 2019 18:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBA1DC1796;
	Thu, 12 Dec 2019 18:04:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 568D4C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3F09B888A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wezdqQgXL1m9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1CD188705
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:03:59 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65CC7206DA;
 Thu, 12 Dec 2019 18:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576173839;
 bh=cZV989DdYo9B9NVAqpSi0dlI1udeZn5Oa6mQtxQHc08=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=n13dv87dgFevQzdUeJHbKYQ3YsqGQqtTbjX7j47+p3TV5ooU736D/cx/1AgU4Xsjq
 5m+OsPbdg4tPh8HWhMAXNmwya28fwIXsS1BKo1w3ppgJJFLNyI4LNKl8tEJDqLkr8z
 Ajr84HjIiD0JI3HkaN6YkeHiVwDSqfX+KHMJ1qJU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id ACCC73522757; Thu, 12 Dec 2019 10:03:58 -0800 (PST)
Date: Thu, 12 Dec 2019 10:03:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20191212180358.GX2889@paulmck-ThinkPad-P72>
References: <201912110621.WJ6oENgf%lkp@intel.com>
 <20191211074842.21400-1-madhuparnabhowmik04@gmail.com>
 <20191212041406.GT2889@paulmck-ThinkPad-P72>
 <5614739335088d3e9baff43b752df04b84a8ad14.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5614739335088d3e9baff43b752df04b84a8ad14.camel@hammerspace.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: nfs: dir.c: Fix sparse error
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Dec 12, 2019 at 01:45:29PM +0000, Trond Myklebust wrote:
> On Wed, 2019-12-11 at 20:14 -0800, Paul E. McKenney wrote:
> > On Wed, Dec 11, 2019 at 01:18:42PM +0530, 
> > madhuparnabhowmik04@gmail.com wrote:
> > > This build error is because the macro list_tail_rcu() is
> > > not yet present in the mainline kernel.
> > > 
> > > This patch is dependent on the patch : 
> > > https://lore.kernel.org/linux-kernel-mentees/CAF65HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t
> > 
> > If the NFS folks are OK with it, I would be happy to take it in -rcu,
> > where the list_tail_rcu() patch is currently located.
> 
> That would be fine with me.

Very good!  I have queued it.

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
