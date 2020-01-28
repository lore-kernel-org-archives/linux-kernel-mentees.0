Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185C6C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:52:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB4F22522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEB4F22522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B493A86597;
	Tue, 28 Jan 2020 17:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvP284TLUbca; Tue, 28 Jan 2020 17:52:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 402758632E;
	Tue, 28 Jan 2020 17:52:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D0F9C0178;
	Tue, 28 Jan 2020 17:52:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6965C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B5B4E852DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FuuqmwjadUT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:52:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E47B0852CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:52:46 +0000 (UTC)
Received: from ip5f5bd665.dynamic.kabel-deutschland.de ([95.91.214.101]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1iwV2T-0001Qo-Pj; Tue, 28 Jan 2020 17:52:37 +0000
Date: Tue, 28 Jan 2020 18:52:36 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200128175236.vnaaviccbl2klrci@wittgenstein>
References: <20200127175821.10833-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127175821.10833-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, oleg@redhat.com,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fork.c: Use RCU_INIT_POINTER()
 instead of rcu_access_pointer()
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

On Mon, Jan 27, 2020 at 11:28:21PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Use RCU_INIT_POINTER() instead of rcu_access_pointer() in
> copy_sighand().
> 
> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Applied, queued up for post rc1.

Thanks!
Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
