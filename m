Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01551C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 15:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CD48272D;
	Wed, 25 May 2022 15:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOvLqiVSuwbL; Wed, 25 May 2022 15:25:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BB2C68267F;
	Wed, 25 May 2022 15:25:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9726AC0032;
	Wed, 25 May 2022 15:25:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DC70C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 15:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B04F41C9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 15:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3QGWM48PMtV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 15:25:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7644F41C9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 15:25:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5888260DBC;
 Wed, 25 May 2022 15:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122B3C385B8;
 Wed, 25 May 2022 15:25:52 +0000 (UTC)
Date: Wed, 25 May 2022 11:25:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] kernel/trace: Initialize integer variable to prevent
 garbage return value
Message-ID: <20220525112551.37e86da6@gandalf.local.home>
In-Reply-To: <20220522061826.1751-1-gautammenghani201@gmail.com>
References: <20220522061826.1751-1-gautammenghani201@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Masami Hiramatsu <mhiramat@kernel.org>, mingo@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Sat, 21 May 2022 23:18:26 -0700
Gautam Menghani <gautammenghani201@gmail.com> wrote:

> Initialize the integer variable to 0 to fix the clang scan warning:
> Undefined or garbage value returned to caller 
> [core.uninitialized.UndefReturn]
>         return ret;
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  kernel/trace/trace_boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
> index 0580287d7a0d..778200dd8ede 100644
> --- a/kernel/trace/trace_boot.c
> +++ b/kernel/trace/trace_boot.c
> @@ -300,7 +300,7 @@ trace_boot_hist_add_handlers(struct xbc_node *hnode, char **bufp,
>  {
>  	struct xbc_node *node;
>  	const char *p, *handler;
> -	int ret;
> +	int ret = 0;

Looks good to me. Masami, care to ack it?

-- Steve

>  
>  	handler = xbc_node_get_data(hnode);
>  

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
