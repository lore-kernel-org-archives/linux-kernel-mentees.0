Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA91C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 01:28:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6BE20838
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 01:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGWdNGvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6BE20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 728D886EFF;
	Sat,  1 Aug 2020 01:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PqQww4DMyZi; Sat,  1 Aug 2020 01:28:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7716386EFD;
	Sat,  1 Aug 2020 01:28:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BCCAC0050;
	Sat,  1 Aug 2020 01:28:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5EECC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 01:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D46B882AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 01:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGQ+itbBg3-t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 01:28:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D241288275
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 01:28:09 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e5so10420771qth.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R7S9crGkSS+zqKV+6akgjVw/AncewqiAu9qufG43ZRg=;
 b=MGWdNGvG/aOp4sfcJNv9ej1bqPcyavBaerB+JRyI7t8uLrCovVqmRKcPD1uuesEusk
 0j9Wt+msOoIvdm+dldTktOMUtsoXcShCNG5wp+MuOynQPyVqRxWu1ylr0X65BnRUQxDZ
 TDvNAjWeAuF2K3ewYReTC1YgwUXRqZXuMKotqLSja/lQePnureOJtpItKp4KOF52f2R+
 46EU23VbTQWiRZL+CBCOA89oZRlwoPWkIBjs22I9NzI/6dRX+ugZBjscqdF29ftmz1rF
 td4N2M2Vn+bNwNwzCHEjGkmu1RaPZtTUjwUUU7HxZ7qeOvdM1zVg1nCejSXouGJAWQo8
 7DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R7S9crGkSS+zqKV+6akgjVw/AncewqiAu9qufG43ZRg=;
 b=g838XAWRiNbk+Ir2PiTPj6JXhJZSBn3FvUYWEO+jw5qDn33+6Lj87TcUktmZT+P7mE
 8OcJyjuSI7kRsR+lnIO8xyW0md5+UOAS8/YspfcHiCPFY5L4iasx5kRPtDU8TbmdE8ZL
 VjTgjRp0zGbZi+jREVMAlVluKsuK7ul9xMgVAAuREAJbHO9kidB3dBf68IfLEV8bNX6u
 tAf2iyzZZEb3ivP6G0koReOn/O6oCPUljNwzYqO7v0iRNktYoFYnr3kXr8+mNxYXD14y
 x+hYRu+TlpBCzdbaBAjIYoqkikQOISTBcZeSEGLGjZyGdUjhS4ekGM+cl8DB2qkd6lG/
 Jr+Q==
X-Gm-Message-State: AOAM532+3JJZnrjvP50BukeH6L/ZHzxCTodd9rK8BsHTfZKHQDv9zHV3
 q/xVfW4Nymutjjeolkvvcg==
X-Google-Smtp-Source: ABdhPJzHkgeXS0w0cpyOPKzY+6am7auQymCChpQrw8/7uitwJAiROxAIfoTnmyhkUUcR2IRCfBQDxA==
X-Received: by 2002:ac8:65cd:: with SMTP id t13mr6681148qto.368.1596245288751; 
 Fri, 31 Jul 2020 18:28:08 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id r6sm8484023qkc.43.2020.07.31.18.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 18:28:08 -0700 (PDT)
Date: Fri, 31 Jul 2020 21:28:04 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Message-ID: <20200801012804.GA220239@PWN>
References: <20200727213644.328662-1-yepeilin.cs@gmail.com>
 <20200801002142.GA27762@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801002142.GA27762@altlinux.org>
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

On Sat, Aug 01, 2020 at 03:21:42AM +0300, Dmitry V. Levin wrote:
> On Mon, Jul 27, 2020 at 05:36:44PM -0400, Peilin Ye wrote:
> > ptrace_get_syscall_info() is copying uninitialized stack memory to
> > userspace due to the compiler not initializing holes in statically
> > allocated structures. Fix it by initializing `info` with memset().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  kernel/ptrace.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> > index 43d6179508d6..e48d05b765b5 100644
> > --- a/kernel/ptrace.c
> > +++ b/kernel/ptrace.c
> > @@ -960,15 +960,17 @@ ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
> >  			void __user *datavp)
> >  {
> >  	struct pt_regs *regs = task_pt_regs(child);
> > -	struct ptrace_syscall_info info = {
> > -		.op = PTRACE_SYSCALL_INFO_NONE,
> > -		.arch = syscall_get_arch(child),
> > -		.instruction_pointer = instruction_pointer(regs),
> > -		.stack_pointer = user_stack_pointer(regs),
> > -	};
> > +	struct ptrace_syscall_info info;
> >  	unsigned long actual_size = offsetof(struct ptrace_syscall_info, entry);
> >  	unsigned long write_size;
> >  
> > +	memset(&info, 0, sizeof(info));
> > +
> > +	info.op	= PTRACE_SYSCALL_INFO_NONE;
> > +	info.arch = syscall_get_arch(child);
> > +	info.instruction_pointer = instruction_pointer(regs);
> > +	info.stack_pointer = user_stack_pointer(regs);
> > +
> 
> No, please don't do it this way.  If there is a hole in the structure that
> the compiler is unable to initialize properly (and there is a 3-byte hole
> in the beginning indeed), please plug the hole by turning it into
> something that the compiler is capable of initializing.

I see. I will do that and send a v2.

> Also, please do not forget to Cc authors of the commit you are fixing.

Sorry, I forgot about that. Thank you for pointing it out!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
