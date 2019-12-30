Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494A1C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 19:30:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2808620722
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 19:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2808620722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0358885C4B;
	Mon, 30 Dec 2019 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B28oRoj3EvUL; Mon, 30 Dec 2019 19:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6432785701;
	Mon, 30 Dec 2019 19:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59046C1796;
	Mon, 30 Dec 2019 19:30:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 277C3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0EBD98610F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyOygfXbESR0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:30:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F91E85CE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:30:49 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id CA1B42B4;
 Mon, 30 Dec 2019 19:30:48 +0000 (UTC)
Date: Mon, 30 Dec 2019 12:30:47 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191230123047.72ebabff@lwn.net>
In-Reply-To: <8a7e8fa26c2997d9286174da78e2d85b46e0626a.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
 <8a7e8fa26c2997d9286174da78e2d85b46e0626a.1577681164.git.dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 4/8] Documentation: convert
 nfsd-admin-interfaces to ReST
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

On Mon, 30 Dec 2019 01:55:58 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Convert nfsd-admin-interfaces to ReST and move it into admin-guide.
> Content remains mostly untouched.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  Documentation/admin-guide/nfs/index.rst       |  1 +
>  .../nfs/nfsd-admin-interfaces.rst}            | 19 +++++++++----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  rename Documentation/{filesystems/nfs/nfsd-admin-interfaces.txt => admin-guide/nfs/nfsd-admin-interfaces.rst} (70%)
> 
> diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
> index 498652a8b955..c73ba9c16b77 100644
> --- a/Documentation/admin-guide/nfs/index.rst
> +++ b/Documentation/admin-guide/nfs/index.rst
> @@ -8,4 +8,5 @@ NFS
>      nfs-client
>      nfsroot
>      nfs-rdma
> +    nfsd-admin-interfaces
>  
> diff --git a/Documentation/filesystems/nfs/nfsd-admin-interfaces.txt b/Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
> similarity index 70%
> rename from Documentation/filesystems/nfs/nfsd-admin-interfaces.txt
> rename to Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
> index 56a96fb08a73..7f8c64ad7632 100644
> --- a/Documentation/filesystems/nfs/nfsd-admin-interfaces.txt
> +++ b/Documentation/admin-guide/nfs/nfsd-admin-interfaces.rst
> @@ -1,5 +1,6 @@
> +==================================
>  Administrative interfaces for nfsd
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +==================================
>  
>  Note that normally these interfaces are used only by the utilities in
>  nfs-utils.
> @@ -13,18 +14,16 @@ nfsd/threads.
>  Before doing that, NFSD can be told which sockets to listen on by
>  writing to nfsd/portlist; that write may be:
>  
> -	- an ascii-encoded file descriptor, which should refer to a
> -	  bound (and listening, for tcp) socket, or
> -	- "transportname port", where transportname is currently either
> -	  "udp", "tcp", or "rdma".
> +	#. an ascii-encoded file descriptor, which should refer to a
> +	   bound (and listening, for tcp) socket, or
> +	#. "transportname port", where transportname is currently either
> +	   "udp", "tcp", or "rdma".

So here we actually had bullets, I think it would be best to leave them
that way.

Let's focus on getting the series up to this point ready, then we can look
at the later patches.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
