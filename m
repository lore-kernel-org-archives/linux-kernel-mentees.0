Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73255C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07ABE849BE;
	Sat, 23 Jul 2022 14:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07ABE849BE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=d3v6kDUy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGXtKe04W01i; Sat, 23 Jul 2022 14:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 073D1849A4;
	Sat, 23 Jul 2022 14:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 073D1849A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D689EC0033;
	Sat, 23 Jul 2022 14:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 193DCC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E70D5416CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70D5416CD
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=d3v6kDUy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1UYQqQ2B3Gh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:05:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D545416BF
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D545416BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:05:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C950B8092D;
 Sat, 23 Jul 2022 14:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB10C341C0;
 Sat, 23 Jul 2022 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658585119;
 bh=2g5s13C+IFBQd9xKYRDH27YjqkKmXT8LzRfCOLtta2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d3v6kDUyyoOc2RLrQEdcJh8KRxU32gs+RlKKkJNJwfOPCw15HDLg7JGAjZEBwurps
 b8J9KVbEGG17e9nIMXn8ePxKwEV4ltEUozC2FWRSXaaij1DESR8mv0o9sWx6ab0Gnu
 zM+H7htPngHmRGV50lkndYupXy/GGXV4nilXaVnI=
Date: Sat, 23 Jul 2022 16:05:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
Message-ID: <YtwAHGISvlgXgXZM@kroah.com>
References: <20220723135035.199188-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723135035.199188-1-code@siddh.me>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Sat, Jul 23, 2022 at 07:20:35PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> In keyctl_watch_key, use kfree_rcu() for freeing watch and wlist
> as they support RCU and have an rcu_head in the struct definition.

That does not explain why this change is needed.  What problem does this
solve?  Why use RCU if you don't have to?  What functionality did you
just change in this commit and why?

And how was this tested?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
