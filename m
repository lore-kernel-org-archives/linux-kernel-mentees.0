Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3A5C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 07:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC676F93A;
	Fri,  5 Aug 2022 07:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC676F93A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=azUJW5HY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYs3xTK5sWGQ; Fri,  5 Aug 2022 07:22:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CFA6160E32;
	Fri,  5 Aug 2022 07:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA6160E32
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0F97C0033;
	Fri,  5 Aug 2022 07:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EA68C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7816F939
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7816F939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nNqmAMopvhD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:22:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45BC60E32
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D45BC60E32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:22:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35583B80DE4;
 Fri,  5 Aug 2022 07:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924BEC433D7;
 Fri,  5 Aug 2022 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659684133;
 bh=7u3HxRp5NFkFE+bl2pbrO1Vom3p6Ci1YJ5qGLzvW4kE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=azUJW5HYl58q1jtoW4R7du9BvdG+qkRb7prxjH+hedfeH0LmF3zZCxUUe+xDopn4R
 WJ/drZzI97s3LMWdGFFxeaq9CIB/7HPxRx9dY2OaYzOI+J3zI8TTCkSZrl22v0+mfy
 KSMO02rpN6P995pDym/k/rwdDRvyz79An4JOD1boHBR3bulgkQOoLWNEEFLLcx8mcT
 Sp7YKaUVQNlUbxJcvx0r+FON07ySnLVMCNOwbAKdmDt0iik34ZYW51BdACFDSYhokR
 ZIi6wFKueDQbygGVQy9R85SZwNNohoPPc6nQc89nkK7rEs2aitDagfzNZF4C+Oxw/Z
 0TdtHLp5Pgreg==
Date: Fri, 5 Aug 2022 00:22:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH 2/3] kernel/watch_queue: Improve struct annotation
 formatting
Message-ID: <YuzFIx36zDXX0z/0@sol.localdomain>
References: <cover.1659618705.git.code@siddh.me>
 <6bac2d4c2b50d921eb16fa5344ffe258be90c651.1659618705.git.code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bac2d4c2b50d921eb16fa5344ffe258be90c651.1659618705.git.code@siddh.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Thu, Aug 04, 2022 at 07:00:23PM +0530, Siddh Raman Pant wrote:
> Improve formatting struct annotations in watch_queue.h, so that they
> fall in the preferred 80 character limit.
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

This patch isn't just fixing overly long lines, but rather is introducing
kerneldoc comments and documenting things that weren't documented before.
That's fine, but please make the commit message accurately describe the patch.

> diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
> index fc6bba20273b..c99c39ec6548 100644
> --- a/include/linux/watch_queue.h
> +++ b/include/linux/watch_queue.h
> @@ -18,57 +18,103 @@
>  
>  struct cred;
>  
> +/**
> + * watch_type_filter - Filter on watch type

If you're going to use kerneldoc comments, they should be correctly formatted.
This is not, since it's missing the word struct.  You can run this command to
see the kerneldoc warnings:

	./scripts/kernel-doc -v -none include/linux/watch_queue.h

> + * @lock: Spinlock

Please make sure that comments provide useful information and don't just repeat
what the code says.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
