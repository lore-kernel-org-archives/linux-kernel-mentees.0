Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4561C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 00:21:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA5D206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 00:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA5D206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4153388705;
	Sat,  1 Aug 2020 00:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4trMq+CyCCn; Sat,  1 Aug 2020 00:21:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EE9E886F9;
	Sat,  1 Aug 2020 00:21:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B347C004F;
	Sat,  1 Aug 2020 00:21:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9DBAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 00:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44ED12153B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 00:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pI54Py4my2wJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 00:21:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by silver.osuosl.org (Postfix) with ESMTP id 723A32043E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 00:21:44 +0000 (UTC)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 8E59372CCDC;
 Sat,  1 Aug 2020 03:21:42 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 61DA17CFBFC; Sat,  1 Aug 2020 03:21:42 +0300 (MSK)
Date: Sat, 1 Aug 2020 03:21:42 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200801002142.GA27762@altlinux.org>
References: <20200727213644.328662-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727213644.328662-1-yepeilin.cs@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Elvira Khabirova <lineprinter@altlinux.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] ptrace: Prevent kernel-infoleak
 in ptrace_get_syscall_info()
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

On Mon, Jul 27, 2020 at 05:36:44PM -0400, Peilin Ye wrote:
> ptrace_get_syscall_info() is copying uninitialized stack memory to
> userspace due to the compiler not initializing holes in statically
> allocated structures. Fix it by initializing `info` with memset().
> 
> Cc: stable@vger.kernel.org
> Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  kernel/ptrace.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> index 43d6179508d6..e48d05b765b5 100644
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -960,15 +960,17 @@ ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
>  			void __user *datavp)
>  {
>  	struct pt_regs *regs = task_pt_regs(child);
> -	struct ptrace_syscall_info info = {
> -		.op = PTRACE_SYSCALL_INFO_NONE,
> -		.arch = syscall_get_arch(child),
> -		.instruction_pointer = instruction_pointer(regs),
> -		.stack_pointer = user_stack_pointer(regs),
> -	};
> +	struct ptrace_syscall_info info;
>  	unsigned long actual_size = offsetof(struct ptrace_syscall_info, entry);
>  	unsigned long write_size;
>  
> +	memset(&info, 0, sizeof(info));
> +
> +	info.op	= PTRACE_SYSCALL_INFO_NONE;
> +	info.arch = syscall_get_arch(child);
> +	info.instruction_pointer = instruction_pointer(regs);
> +	info.stack_pointer = user_stack_pointer(regs);
> +

No, please don't do it this way.  If there is a hole in the structure that
the compiler is unable to initialize properly (and there is a 3-byte hole
in the beginning indeed), please plug the hole by turning it into
something that the compiler is capable of initializing.

Also, please do not forget to Cc authors of the commit you are fixing.


-- 
ldv
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
