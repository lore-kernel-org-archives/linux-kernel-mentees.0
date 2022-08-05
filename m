Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC62FC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 09:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FAD41C9B;
	Fri,  5 Aug 2022 09:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FAD41C9B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=a788DdDn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l39Pz2hFVbbX; Fri,  5 Aug 2022 09:36:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D55A741C8F;
	Fri,  5 Aug 2022 09:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D55A741C8F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C25FCC0033;
	Fri,  5 Aug 2022 09:36:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD8DBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C584A82A87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C584A82A87
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=a788DdDn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke46D_kCZn6v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:36:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F3E8125B
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F3E8125B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659692153; cv=none; d=zohomail.in; s=zohoarc; 
 b=e8TEMtLGWdvaN+wQZyT3nid9x9H52KceesT4LF/aXprbqVFGvnkFamzRHbUxCXVInKR1sF/J8vHtvD2elNhclA7fU+oEExzjU3jMMUt0QFODZPwJaQelvzYEYbcAnLd66+1UY7keDq6f+JlvGXR9lL/01Xc8sRFOBK1VrdVrusw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659692153;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ljhgzI/UF42hWnfoA4KaadY/VnflCDZrqOXQeik+4k4=; 
 b=YW/6kywpozQh5mHOMfZ6bANCeGZGJBACRGt1QvRdZuDozgR/Q1Go6ps9xugIQ5V92tOB6C6TAYk26mKUJEjU2s5gUd4fjQp2WNlMr8msuU0VTuB0GUaqum5GBpIS5sOfTTYLx3Q30M7xxOMzmNnt5NIg4E4ru2sNDnemFlLFhDY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659692153; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ljhgzI/UF42hWnfoA4KaadY/VnflCDZrqOXQeik+4k4=;
 b=a788DdDnnTYwwNEgkeNo6PlCJubYZK4nrWsaH3b/BshXQbsqkzKY6FzY9kqGT8jL
 UlDeS2Cfg7+KrDRF9NNtnqF1DsA3HPgfKA1B4Jg4DAkCqNtkUSFN4JYYnqUAf+k3GN3
 Djcu6mrZQbsKU1UAR7ET6isvaWDDveebxRlsY44s=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659692141228305.5750996748818;
 Fri, 5 Aug 2022 15:05:41 +0530 (IST)
Date: Fri, 05 Aug 2022 15:05:41 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <1826d5c4a90.282ac4bf118702.5300662644268737477@siddh.me>
In-Reply-To: <YuzFrzrTnTtUHMn/@sol.localdomain>
References: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
 <20220804144152.468916-1-code@siddh.me> <YuzFrzrTnTtUHMn/@sol.localdomain>
Subject: Re: [PATCH v2 3/3] kernel/watch_queue: Remove wqueue->defunct and
 use pipe for clear check
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: corbet <corbet@lwn.net>, rdunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, dhowells <dhowells@redhat.com>,
 edumazet <edumazet@google.com>,
 "christophe.jaillet" <christophe.jaillet@wanadoo.fr>,
 mchehab <mchehab@kernel.org>,
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 05 Aug 2022 12:54:31 +0530  Eric Biggers  wrote:
> Why is the READ_ONCE() needed?  Doesn't wqueue->lock protect wqueue->pipe?

We are changing the pointer while a notification can be potentially waiting to
be posted to the pipe. So a barrier is needed to prevent compiler magic from
reloading the value.

This was remarked by David Howells here:
https://lore.kernel.org/lkml/3558070.1658933200@warthog.procyon.org.uk/

> This isn't the correct block comment format; it should look like:
> 
>      /*
>       * This pipe will get freed by the caller free_pipe_info().
>       * Removing this reference also prevents new notifications.
>       */
> 
> - Eric
> 

Okay, will make the change.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
