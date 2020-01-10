Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DC4C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 18:09:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88ED3206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 18:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88ED3206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63DBD884DE;
	Fri, 10 Jan 2020 18:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-ya3A8GEClt; Fri, 10 Jan 2020 18:09:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E903D884DC;
	Fri, 10 Jan 2020 18:09:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4927C1796;
	Fri, 10 Jan 2020 18:09:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86C15C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 82DEB226B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDKEp4uzZuXa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:09:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by silver.osuosl.org (Postfix) with ESMTPS id CB885226A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:09:25 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1C4A577D;
 Fri, 10 Jan 2020 18:09:25 +0000 (UTC)
Date: Fri, 10 Jan 2020 11:09:23 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200110110923.31fc56e5@lwn.net>
In-Reply-To: <20191231185110.809467-1-dwlsalmeida@gmail.com>
References: <20191231185110.809467-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: markus.heiser@darmarit.de, linux-doc@vger.kernel.org, miklos@szeredi.hu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] Documentation: filesystems:
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

On Tue, 31 Dec 2019 15:51:10 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

So I note that the last non-typo-fix change to this document happened in
2006, which leads me to suspect that it might be just a wee bit out of
date.  Miklos, what's the story here?  Should we put a warning at the top?

Otherwise I really only have one other comment on the conversion...


>  .../filesystems/{fuse.txt => fuse.rst}        | 174 ++++++++----------
>  Documentation/filesystems/index.rst           |   1 +
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 80 insertions(+), 97 deletions(-)
>  rename Documentation/filesystems/{fuse.txt => fuse.rst} (79%)
> 
> diff --git a/Documentation/filesystems/fuse.txt b/Documentation/filesystems/fuse.rst
> similarity index 79%
> rename from Documentation/filesystems/fuse.txt
> rename to Documentation/filesystems/fuse.rst
> index 13af4a49e7db..aa7d6f506b8d 100644
> --- a/Documentation/filesystems/fuse.txt
> +++ b/Documentation/filesystems/fuse.rst
> @@ -1,41 +1,39 @@
> -Definitions
> -~~~~~~~~~~~
> +==============
> +FUSE
> +==============
>  
> -Userspace filesystem:
> +Definitions
> +===========
>  
> +``Userspace filesystem:``
>    A filesystem in which data and metadata are provided by an ordinary
>    userspace process.  The filesystem can be accessed normally through
>    the kernel interface.

I think that ``literal text`` should really only be used for literal text -
something that the user types, function names, etc.  Here you're defining a
term, which is different.  You could use **emphasis** as you have in other
places, but I also honestly think it doesn't need special markup at all.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
