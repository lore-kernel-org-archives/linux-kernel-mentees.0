Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326FDC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 05:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CCF60FBC;
	Fri,  4 Aug 2023 05:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CCF60FBC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cPxCnF3e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPDoc2Q7RP1N; Fri,  4 Aug 2023 05:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A181D60F9C;
	Fri,  4 Aug 2023 05:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A181D60F9C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70818C0071;
	Fri,  4 Aug 2023 05:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2510DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 05:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CC7160F7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 05:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC7160F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXo4J3uEL-XH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 05:01:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FAC560F6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 05:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAC560F6E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4574161383;
 Fri,  4 Aug 2023 05:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58969C433C8;
 Fri,  4 Aug 2023 05:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691125314;
 bh=ayVx67NI7whJIEYM/PRTa+Z5Dqnme7NKXeSusGW3xoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cPxCnF3eK2hlZbSFjh/cXLqmvBWOJsXEZJ6gv1SmPMfdNreoNc/jZwvWlcVS3CPHV
 G8bg68ve2U+2olqN3F48L9mH52Gex/LYAN5lRgHS4cV8DH0g+VvAqqpYMRG5oeQ6QU
 TaPKASXVXbp5mK3/ce8xuMmKkjQ7kSCF08W0X//Y=
Date: Fri, 4 Aug 2023 07:01:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH v2] ipc:msg: replace one-element array with
 flexible-array member
Message-ID: <2023080434-angrily-colossal-22b5@gregkh>
References: <20230804041949.5724-1-rauji.raut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804041949.5724-1-rauji.raut@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Thu, Aug 03, 2023 at 09:19:49PM -0700, Atul Raut wrote:
> One-element arrays are obsolete, and flexible
> array members have taken their place. So, in
> struct compat_msgbuf, replace the one-element
> array with a flexible-array member.
> 
> This fixes warnings such as:
> ./ipc/msg.c:981:6-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> ---
>  ipc/msg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ipc/msg.c b/ipc/msg.c
> index fd08b3cb36d7..ee6af4fe52bf 100644
> --- a/ipc/msg.c
> +++ b/ipc/msg.c
> @@ -978,7 +978,7 @@ SYSCALL_DEFINE4(msgsnd, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
>  
>  struct compat_msgbuf {
>  	compat_long_t mtype;
> -	char mtext[1];
> +	char mtext[];
>  };
>  
>  long compat_ksys_msgsnd(int msqid, compat_uptr_t msgp,
> -- 
> 2.34.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
