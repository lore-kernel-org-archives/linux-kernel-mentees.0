Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71265C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 07:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32BD81440;
	Fri,  5 Aug 2022 07:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32BD81440
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mQEFtc/L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50BTL9du5uWk; Fri,  5 Aug 2022 07:24:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB698143B;
	Fri,  5 Aug 2022 07:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB698143B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08492C0033;
	Fri,  5 Aug 2022 07:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D7C5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B4941BFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B4941BFE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=mQEFtc/L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aNBpIc14D7K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:24:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D7241BB9
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19D7241BB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:24:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5719BB827E6;
 Fri,  5 Aug 2022 07:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3F0C433D6;
 Fri,  5 Aug 2022 07:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659684273;
 bh=RMb+yWMJ1lHFHETbxbrZ62eKVFujJ06xkZ15vBzWUnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQEFtc/Li2O2gDEp9OJGVemiJH3nK+nLMXaLaU7X0LXyuIWupMPuLDJKMuVQkgJ3S
 eH0Q1N4ocIF+OMYkf105iIgEGFr6KmH+5vVEeFQXc1cUnatiwLSHBajQIFEa5tN3qg
 O7sMRZa9P0GmgeDSs664HNqF30jidKP5KSSysEWAPvJ1ybJ3w3tAR9x3yMbuQ1E1Ps
 +9e+XtH3+FlP7N5sALovH6AyIcwZLqHERWqt0jpNKcrDSFcy4Il4qbJ+I8063aN9yx
 b79u6JGH3zSOCQZh7O8enor0+O5MKMlpkGpigtIFT+OeqDiAtqjrCRCZd8ZS2ke+5O
 WvX7gXQMTvrbg==
Date: Fri, 5 Aug 2022 00:24:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2 3/3] kernel/watch_queue: Remove wqueue->defunct and
 use pipe for clear check
Message-ID: <YuzFrzrTnTtUHMn/@sol.localdomain>
References: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
 <20220804144152.468916-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804144152.468916-1-code@siddh.me>
Cc: corbet@lwn.net, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, edumazet@google.com, christophe.jaillet@wanadoo.fr,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 04, 2022 at 08:11:52PM +0530, Siddh Raman Pant wrote:
>  static inline bool lock_wqueue(struct watch_queue *wqueue)
>  {
>  	spin_lock_bh(&wqueue->lock);
> -	if (unlikely(wqueue->defunct)) {
> +	if (unlikely(!READ_ONCE(wqueue->pipe))) {
>  		spin_unlock_bh(&wqueue->lock);
>  		return false;
>  	}

Why is the READ_ONCE() needed?  Doesn't wqueue->lock protect wqueue->pipe?

> +	/* This pipe will get freed by the caller free_pipe_info().
> +	 * Removing this reference also prevents new notifications.
> +	 */

This isn't the correct block comment format; it should look like:

	/*
	 * This pipe will get freed by the caller free_pipe_info().
	 * Removing this reference also prevents new notifications.
	 */

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
