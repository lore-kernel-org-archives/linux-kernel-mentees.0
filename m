Return-Path: <SRS0=sPDn=3N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8855CC3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 17:28:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D59C2075D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 17:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zRe2haba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D59C2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 276B922775;
	Fri, 24 Jan 2020 17:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ul7yGcb2K-di; Fri, 24 Jan 2020 17:28:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 978CB203E1;
	Fri, 24 Jan 2020 17:28:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 844DBC1D80;
	Fri, 24 Jan 2020 17:28:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 512A8C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3763722775
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 17:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SJ2ThIpXDj7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 17:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id C5BBC203E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 17:28:07 +0000 (UTC)
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48D6A2081E;
 Fri, 24 Jan 2020 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579886887;
 bh=xKeYSTzuiPLpfoVHzYLcCkTA5xYucgBlImpWHbcWV68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zRe2habaFvk9T+b2yK7elYh+xguEe1nojGQ77ceriPknPrR2alzAVIxo6UFvRXJj5
 AasbxKpQdE+Eu0RhYNa7kSIeP1dWDdspxGl2v8TW+7sSbvPmH/NbK8/N7pkyu/lzhN
 hXL+RPzQUA6+/vxRHTFJSOG8TF70g9NzgXkaVcN4=
Date: Sat, 25 Jan 2020 02:28:03 +0900
From: Keith Busch <kbusch@kernel.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200124172803.GA18688@redsun51.ssa.fujisawa.hgst.com>
References: <20200111073815.7659-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200111073815.7659-1-frextrite@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Christoph Hellwig <hch@lst.de>,
 kbuild test robot <lkp@intel.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] drivers: nvme: target: core:
 Pass lockdep expression to RCU lists
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

On Sat, Jan 11, 2020 at 01:08:16PM +0530, Amol Grover wrote:
> ctrl->subsys->namespaces and subsys->namespaces are traversed with
> list_for_each_entry_rcu outside an RCU read-side critical section
> but under the protection of ctrl->subsys->lock and subsys->lock
> respectively.
> 
> Hence, add the corresponding lockdep expression to the list traversal
> primitive to silence false-positive lockdep warnings, and
> harden RCU lists.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Thanks, added for-5.6.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
