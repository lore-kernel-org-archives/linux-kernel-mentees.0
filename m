Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A392C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 07:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C0C40D24;
	Fri,  5 Aug 2022 07:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C0C40D24
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZENF4Pl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjiVS_IMbcBo; Fri,  5 Aug 2022 07:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ED95E40CC5;
	Fri,  5 Aug 2022 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED95E40CC5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6F6CC0033;
	Fri,  5 Aug 2022 07:16:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D93CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 151286F936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 151286F936
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=jZENF4Pl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_BVYip5WLL4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:16:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3405060E08
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3405060E08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:16:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82D21B8275D;
 Fri,  5 Aug 2022 07:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03770C433C1;
 Fri,  5 Aug 2022 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659683779;
 bh=pVVmulI7yI4CK6aTV3QyaslBwmz+G2X9eavrx06cU6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZENF4PlyknV8Xq4eLRWpsaLD7k9DL03M0OnEm0ZgeJCG2e+C6c2FmQkRpGxfhaKN
 QcI4O9H6v/VteiJjXbPcgf8ZUteF1Qv0r6/R5Y8iJ+y+IxUacyCYxpM4L6pEdheJyU
 9xq0FzrcSo8SvSLiEMdcNqpkII2iIX6Y+A6H0vW7mZ9EB/s2rTNECqbaGxsat4r4uF
 nk2wbd0UxQjqcD+TsL7Jswa/J7rucfCM4L5MNzCtvnB9E/RnyLU1p9FISFrhhF7S9F
 GiICqKj0QHURF7momLdJtgg3inVCOKbmN7GNhVNHhBWnCAv/sg/ef4t4RuDkLU7Msf
 m6lC29AsLlR5Q==
Date: Fri, 5 Aug 2022 00:16:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH 0/3] kernel/watch_queue: Clean up some code
Message-ID: <YuzDwa4otHkImo10@sol.localdomain>
References: <cover.1659618705.git.code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1659618705.git.code@siddh.me>
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

On Thu, Aug 04, 2022 at 07:00:21PM +0530, Siddh Raman Pant wrote:
> There is a dangling reference to pipe in a watch_queue after clearing it.
> Thus, NULL that pointer while clearing. This can be thought of as a v4 of
> the patches I had sent earlier.
> 
> This change renders wqueue->defunct superfluous, as the latter is only used
> to check if watch_queue is cleared. With this change, the pipe is NULL'd
> while clearing, so we can just check if the pipe is NULL.
> 
> Extending comment for watch_queue->pipe in the definition of watch_queue
> made the comment conventionally too long (it was already past 80 chars),
> so I have changed the struct annotations to be doxygen-styled, so that
> I can extend the comment mentioning that the pipe is NULL when watch_queue
> is cleared.
> 
> Siddh Raman Pant (3):
>   kernel/watch_queue: Remove dangling pipe reference while clearing
>     watch_queue
>   kernel/watch_queue: Improve struct annotation formatting
>   kernel/watch_queue: Remove wqueue->defunct and use pipe for clear
>     check
> 
>  include/linux/watch_queue.h | 95 +++++++++++++++++++++++++++----------
>  kernel/watch_queue.c        | 11 ++---
>  2 files changed, 75 insertions(+), 31 deletions(-)

I think patches 1 and 3 should be merged together.

Also, please use a consistent version number for all patches in the series.  You
have a version 1, version 2, and version 4 patch all in the same series, which
is very confusing.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
