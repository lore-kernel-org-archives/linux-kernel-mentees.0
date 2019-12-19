Return-Path: <SRS0=GqCC=2J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B120AC2D0C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 16:54:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8458A2146E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 16:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8458A2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3991087FA6;
	Thu, 19 Dec 2019 16:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aeLHShi91SeX; Thu, 19 Dec 2019 16:54:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75D8B87F94;
	Thu, 19 Dec 2019 16:54:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D11C1AE8;
	Thu, 19 Dec 2019 16:54:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C31EC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A98187F9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5x-VshTl7ly
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:53:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7971787F94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:53:58 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C8DD92E5;
 Thu, 19 Dec 2019 16:53:57 +0000 (UTC)
Date: Thu, 19 Dec 2019 09:53:56 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191219095356.4a3ad965@lwn.net>
In-Reply-To: <20191120192655.33709-1-dwlsalmeida@gmail.com>
References: <20191120192655.33709-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert fuse to RST
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

On Wed, 20 Nov 2019 16:26:55 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> 
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> -----------------------------------------------------------
> Changes in v2:
> -Copied FUSE maintainer (Miklos Szeredi)
> -Fixed the reference in the MAINTAINERS file
> -Removed some of the excessive markup in fuse.rst
> -Moved fuse.rst into admin-guide
> -Updated index.rst

So I have to confess that I've lost track of where we stand with this.
Holidays and moving house will do that...apologies.  In any case, I have a
couple of additional comments.

[...]

> -There's a control filesystem for FUSE, which can be mounted by:
> +There's a control filesystem for FUSE, which can be mounted by: ::
>  
>    mount -t fusectl none /sys/fs/fuse/connections

Please just do "...can be mounted by::"; it will do what you want.

> -Mounting it under the '/sys/fs/fuse/connections' directory makes it
> +Mounting it under the ``'/sys/fs/fuse/connections'`` directory makes it

There's still a lot of extra markup, and this seems like *way* too many
quotes... 

> -INTERRUPT requests take precedence over other requests, so the
> +*INTERRUPT* requests take precedence over other requests, so the
>  userspace filesystem will receive queued INTERRUPTs before any others.

Not sure you need to add that markup either, but beyond that...

> -The userspace filesystem may ignore the INTERRUPT requests entirely,
> -or may honor them by sending a reply to the _original_ request, with
> -the error set to EINTR.
> +The userspace filesystem may ignore the *INTERRUPT* requests entirely,
> +or may honor them by sending a reply to the *original* request, with
> +the error set to ``EINTR``.
>  
>  It is also possible that there's a race between processing the
>  original request and its INTERRUPT request.  There are two possibilities:
>  
> -  1) The INTERRUPT request is processed before the original request is
> +  #. The *INTERRUPT* request is processed before the original request is
>       processed
>  
> -  2) The INTERRUPT request is processed after the original request has
> +  #. The *INTERRUPT* request is processed after the original request has
>       been answered
>  
>  If the filesystem cannot find the original request, it should wait for
>  some timeout and/or a number of new requests to arrive, after which it
> -should reply to the INTERRUPT request with an EAGAIN error.  In case
> -1) the INTERRUPT request will be requeued.  In case 2) the INTERRUPT
> +should reply to the INTERRUPT request with an ``EAGAIN`` error.  In case
> +1) the ``INTERRUPT`` request will be requeued.  In case 2) the ``INTERRUPT``
>  reply will be ignored.

Here you are marking up the same term in a different way.  That can only
create confusion, which is generally not the goal for the docs.

Please make another pass and try to get the markup down to a minimum;
remember that the plain-text reading experience matters too.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
