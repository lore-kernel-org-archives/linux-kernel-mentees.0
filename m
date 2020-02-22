Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDD4C35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 12:18:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B52206EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 12:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B52206EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 24C7C2010D;
	Sat, 22 Feb 2020 12:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Av2bNZcoPjq2; Sat, 22 Feb 2020 12:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A0ECE20396;
	Sat, 22 Feb 2020 12:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A786C1D81;
	Sat, 22 Feb 2020 12:18:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC6ADC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAE768639B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dy-HpNqxcrG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0D4618362E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 12:18:13 +0000 (UTC)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j5TjN-0004Bh-RQ; Sat, 22 Feb 2020 12:18:01 +0000
Date: Sat, 22 Feb 2020 13:18:01 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
References: <20200222001513.43099-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222001513.43099-1-colin.king@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>,
 Christian Brauner <christian@brauner.io>
Subject: Re: [Linux-kernel-mentees] [PATCH][next] clone3: fix an unsigned
 args.cgroup comparison to less than zero
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

On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The less than zero comparison of args.cgroup is aways false because
> args.cgroup is a u64 and can never be less than zero.  I believe the
> correct check is to cast args.cgroup to a s64 first to ensure an
> invalid value is not copied to kargs->cgroup.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: ef2c41cf38a7 ("clone3: allow spawning processes into cgroups")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, Colin.
Dan has reported this issue a few days prior on the janitors list so he
likely should get a 
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
too. I've been sending Dan's bug report to the kernel-mentee list too in
case someone wanted to fix it there. So I'm Ccing them again here so
they know someone's working on this!

> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 67a5d691ffa8..98513a122dd1 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2635,7 +2635,7 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>  		     !valid_signal(args.exit_signal)))
>  		return -EINVAL;
>  
> -	if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> +	if ((args.flags & CLONE_INTO_CGROUP) && (s64)args.cgroup < 0)

I think my code here needs a little more fixing. I'm doing

	if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
		return -EINVAL;

and then later

	*kargs = (struct kernel_clone_args){
		.cgroup		= args.cgroup,
	};

blindly casting from a u64 in struct clone_args to an int in struct
kernel_clone_args. I think we want to check that we're within a sane
range. Maybe something like:

diff --git a/kernel/fork.c b/kernel/fork.c
index 2diff --git a/kernel/fork.c b/kernel/fork.c
index 2853e258fe1f..dca4dde3b5b2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
                     !valid_signal(args.exit_signal)))
                return -EINVAL;

-       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
+       if ((args.flags & CLONE_INTO_CGROUP) &&
+           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))
                return -EINVAL;

        *kargs = (struct kernel_clone_args){

Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
