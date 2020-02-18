Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206ABC34026
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 09:12:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC84620659
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 09:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC84620659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABED384BF1;
	Tue, 18 Feb 2020 09:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mmkmgn9i5sIR; Tue, 18 Feb 2020 09:12:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBC4484D9F;
	Tue, 18 Feb 2020 09:12:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE5DCC08A0;
	Tue, 18 Feb 2020 09:12:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 520F4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 09:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4925520021
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 09:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xalRJA3RKap4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 09:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by silver.osuosl.org (Postfix) with ESMTPS id 37D6320020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 09:12:47 +0000 (UTC)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j3yvq-00087n-Kt; Tue, 18 Feb 2020 09:12:42 +0000
Date: Tue, 18 Feb 2020 10:12:41 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200218091241.mm7t2gtyilr63hij@wittgenstein>
References: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
Cc: kernel-janitors@vger.kernel.org, Will Drewry <wad@chromium.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andy Lutomirski <luto@amacapital.net>
Subject: Re: [Linux-kernel-mentees] [bug report] clone3: allow spawning
	processes into cgroups
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

On Tue, Feb 18, 2020 at 09:47:59AM +0300, Dan Carpenter wrote:
> Hello Christian Brauner,
> 
> The patch ef2c41cf38a7: "clone3: allow spawning processes into
> cgroups" from Feb 5, 2020, leads to the following static checker
> warning:
> 
> 	kernel/fork.c:2632 copy_clone_args_from_user()
> 	warn: unsigned 'args.cgroup' is never less than zero.

Thanks, good catch. This strikes me as a great patch for the
linux-kernel-mentees project so I've Cced the list.
I'll wait for about two weeks for a patch and if none has surfaced by
then I'll fix it myself.
For anyone wanting to fix this, please note that this patch sits in
Tejun's cgroup tree, i.e. your fix needs to be made against the
following tree:
https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git/log/?h=for-5.7

Thanks!
Christian

> 
> kernel/fork.c
>   2598  noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>   2599                                                struct clone_args __user *uargs,
>   2600                                                size_t usize)
>   2601  {
>   2602          int err;
>   2603          struct clone_args args;
>   2604          pid_t *kset_tid = kargs->set_tid;
>   2605  
>   2606          if (unlikely(usize > PAGE_SIZE))
>   2607                  return -E2BIG;
>   2608          if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
>   2609                  return -EINVAL;
>   2610  
>   2611          err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
>   2612          if (err)
>   2613                  return err;
>   2614  
>   2615          if (unlikely(args.set_tid_size > MAX_PID_NS_LEVEL))
>   2616                  return -EINVAL;
>   2617  
>   2618          if (unlikely(!args.set_tid && args.set_tid_size > 0))
>   2619                  return -EINVAL;
>   2620  
>   2621          if (unlikely(args.set_tid && args.set_tid_size == 0))
>   2622                  return -EINVAL;
>   2623  
>   2624          /*
>   2625           * Verify that higher 32bits of exit_signal are unset and that
>   2626           * it is a valid signal
>   2627           */
>   2628          if (unlikely((args.exit_signal & ~((u64)CSIGNAL)) ||
>   2629                       !valid_signal(args.exit_signal)))
>   2630                  return -EINVAL;
>   2631  
>   2632          if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
>                                                         ^^^^^^^^^^^^^^^
> This is a u64 so it can't be negative.  I'm not sure what was intended.
> 
>   2633                  return -EINVAL;
>   2634  
> 
> regards,
> dan carpenter
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
