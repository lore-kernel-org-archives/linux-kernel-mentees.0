Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDDAC04A68
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jul 2022 08:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3113F8333F;
	Thu, 28 Jul 2022 08:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3113F8333F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6e9Vtqn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Drrs4xj4NQxu; Thu, 28 Jul 2022 08:11:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E45B82D07;
	Thu, 28 Jul 2022 08:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E45B82D07
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EACAC0035;
	Thu, 28 Jul 2022 08:11:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FFD9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 08:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D177E832D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 08:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D177E832D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfakYRQuoYed
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 08:11:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0565782D07
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0565782D07
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 08:11:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1047DB81F69;
 Thu, 28 Jul 2022 08:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E9C433D6;
 Thu, 28 Jul 2022 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658995878;
 bh=c23ZgkhJmhmN1wnP5D1JbbpVm4WFz2aOVz5hhH/OAds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z6e9VtqnnXePXNjtw/HfVPKcu1t2JMIo6Iv9/mcYraldHi3VQmAugHjzmBeHVwKJ0
 EcnRRZBaYls2zcLrnVc1N90lnqVy2u0IwgA7ZTzu1OYDIFUbOR/px12dG6syjgta5T
 YqDUOCRtt4vEkZJ02v/sq5ezmt3GO7kkWCoIR9tNq5rD68ewo0db8PiUZaLdlvHQar
 CKP3cFp3dpSkig2mT1gUfpQ8CfPrveelpo7RK8+F5wybjDK3yVoNMrr2qcKBfdZj98
 SoqtG4M6AkV06JNl6Z+4pCe3X7ZKy5Ec/VALfOZdfs48PHwzoCVk/HVj16BEz0wN3R
 aQTXlXvF8zkbQ==
Date: Thu, 28 Jul 2022 11:11:15 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
Message-ID: <YuJEozyceOKQ63/6@kernel.org>
References: <20220723135035.199188-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723135035.199188-1-code@siddh.me>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
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

On Sat, Jul 23, 2022 at 07:20:35PM +0530, Siddh Raman Pant wrote:
> In keyctl_watch_key, use kfree_rcu() for freeing watch and wlist
> as they support RCU and have an rcu_head in the struct definition.
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

Applies to any patch: the commit message should *clearly* describe

1. What is wrong in the current code *behaviour*.
2. Why does the code change save the day.

> ---
>  security/keys/keyctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 96a92a645216..087fbc141cfd 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -1832,9 +1832,9 @@ long keyctl_watch_key(key_serial_t id, int watch_queue_fd, int watch_id)
>  	}
>  
>  err_watch:
> -	kfree(watch);
> +	kfree_rcu(watch, rcu);
>  err_wlist:
> -	kfree(wlist);
> +	kfree_rcu(wlist, rcu);
>  err_wqueue:
>  	put_watch_queue(wqueue);
>  err_key:
> -- 
> 2.35.1
> 
> 

BR, Jarkko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
