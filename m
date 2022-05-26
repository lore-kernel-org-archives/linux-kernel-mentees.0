Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD6FC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 May 2022 14:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3D440B27;
	Thu, 26 May 2022 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3WU0FMgvP0h; Thu, 26 May 2022 14:54:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE6F404C8;
	Thu, 26 May 2022 14:54:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5494EC0039;
	Thu, 26 May 2022 14:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B4B2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 May 2022 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3473484632
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 May 2022 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHZaNoh0nnYF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 May 2022 14:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DAD5845F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 May 2022 14:54:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 608F161B50;
 Thu, 26 May 2022 14:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B38C385A9;
 Thu, 26 May 2022 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653576880;
 bh=hXEWABgFpEb92wPiah32bOUadWzKqqT8anhnxU8Zme4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gxnYoBkeS3NxwCgvDe4m6Dx0JZZwcrlaMoSIowVytmagQF0rks1f9f1xDRYzSIXTX
 8HQrs8k5K6JplK/SDHUPmhfhMOV2A/+Lr6uI1A1+2M1OEHHkuAuYD8JfWn2P9XKwQA
 oCiA4jgyxubHUWIjSdhwedpENiX0Kj2EIB5NA06J6GPofQFPHs14bzeMBW+S8kjkhR
 n2BKZmKtT+gLxF5kkqjQep8fS4ou/1syxNAdSDdo96tjmp2ZjVFi5pV/mI0RVQP2Kx
 7YCC201dH74AM+38Xn6Bu7C1myxh5NIlLNEFVGvgbh88CK7Jcq10KmzexW2uSAa/X8
 ikaMnv2jAcjew==
Date: Thu, 26 May 2022 23:54:35 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] kernel/trace: Initialize integer variable to prevent
 garbage return value
Message-Id: <20220526235435.59a1b3074ecfb30825824948@kernel.org>
In-Reply-To: <20220525112551.37e86da6@gandalf.local.home>
References: <20220522061826.1751-1-gautammenghani201@gmail.com>
 <20220525112551.37e86da6@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Gautam Menghani <gautammenghani201@gmail.com>, linux-kernel@vger.kernel.org,
 mingo@redhat.com, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, 25 May 2022 11:25:51 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Sat, 21 May 2022 23:18:26 -0700
> Gautam Menghani <gautammenghani201@gmail.com> wrote:
> 
> > Initialize the integer variable to 0 to fix the clang scan warning:
> > Undefined or garbage value returned to caller 
> > [core.uninitialized.UndefReturn]
> >         return ret;
> > 
> > Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> > ---
> >  kernel/trace/trace_boot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
> > index 0580287d7a0d..778200dd8ede 100644
> > --- a/kernel/trace/trace_boot.c
> > +++ b/kernel/trace/trace_boot.c
> > @@ -300,7 +300,7 @@ trace_boot_hist_add_handlers(struct xbc_node *hnode, char **bufp,
> >  {
> >  	struct xbc_node *node;
> >  	const char *p, *handler;
> > -	int ret;
> > +	int ret = 0;
> 
> Looks good to me. Masami, care to ack it?

Thanks! This looks good to me.

Fixes: 8993665abcce ("tracing/boot: Support multiple handlers for per-event histogram")
Cc: stable@vger.kernel.org
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> 
> -- Steve
> 
> >  
> >  	handler = xbc_node_get_data(hnode);
> >  
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
