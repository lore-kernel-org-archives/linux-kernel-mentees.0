Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3608DC3404C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 22:49:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC5C24125
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 22:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="Ih8OVG9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC5C24125
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C167D8653D;
	Tue, 18 Feb 2020 22:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iu1l0+BlbhKm; Tue, 18 Feb 2020 22:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53B6A864C5;
	Tue, 18 Feb 2020 22:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 368B4C1D84;
	Tue, 18 Feb 2020 22:49:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0717EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F35028653D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZ7Ppc7dESYP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:49:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3186B8649A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:49:09 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r18so26762795edl.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 14:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6bGLfW+S3PbTSNe7BlkqXOXTsrm4VZ4lQdamKUPW64=;
 b=Ih8OVG9omwJ6Rxw+SlKjwczxNf0k2Ng94CvXCZbV3YDaX3UQbLCeVFJCDBgE+/TbWa
 949c1MNdpMLpcyDXtROzVlkZqcqThZvj3dhD1ALAKRu2iuAubkhK1t55o+Mi/JGULJQA
 Do0mKi+fIwpeSajmK6ZtYgsGWtcp2ixmaSSIN7Z+3VM59asG03lUut8OZYU+OftobKN/
 FARxahH/c9osR5/SjqCdrfiIcl3zufcnKdJwz8aagy+PHbiKJZq82UM0DiByhRA429++
 amw4egh1MaKmoNsfmmEllJZPFRXMrhRAJ3PBPBSRTfXKHz76UknYvpsHjXKYCfr9H+iG
 sLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6bGLfW+S3PbTSNe7BlkqXOXTsrm4VZ4lQdamKUPW64=;
 b=aurq/QkB9yCZ6TlEziVo0eZzNb64Lxrj2pgse1FAJZjdSEjhE3a/+2vAYpDAn3MwI/
 kNqXFk/SBb31m9LF2Nt7LTOLJs3i1x08pHA21vfwZ0Y06GFIh5CQHI79MpjExktYD50O
 E9nBAr78KSX/KJbdEh2IBYooZxmKsdBjP7wT3p/3J2s/BvHSV6tYIXq6jXSDISS7XsxJ
 8U0ggAmky/m2Zb+gWVxoF96oPJeIjj+2JEDDsY52+7xSSB4egMdP7kZOUvvqdhnzBIFY
 CVRPIhu/pclmzDir9ADUPaa/9AHr8MvTiuinJyGFrfTUgksRgBDX6NMydMCYCCXTLLpU
 yOsw==
X-Gm-Message-State: APjAAAXJjhauIRwhLQU+HyWUwcTcHEHZ63hkEIDZvwePKYxK6XzJ+RgE
 YIfmOKB0HI2FnJ//uryd65kXc5yvdKFzRwec3w3h
X-Google-Smtp-Source: APXvYqyL9+hoGiE8tChYcCVk+t7iqdIxiz2N27oHXffytLSJrvsGhrrkoMyf4wu5HG59PmlYeN3uSH1WjtWg9WFGERg=
X-Received: by 2002:a17:906:f251:: with SMTP id
 gy17mr21225090ejb.308.1582066147205; 
 Tue, 18 Feb 2020 14:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20200218181718.7258-1-madhuparnabhowmik10@gmail.com>
In-Reply-To: <20200218181718.7258-1-madhuparnabhowmik10@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Feb 2020 17:48:56 -0500
Message-ID: <CAHC9VhSzqccDgt2EAPqVmTFCcETrKrkUDRoL-2YzzSFGfYJGQg@mail.gmail.com>
To: madhuparnabhowmik10@gmail.com
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: netlabel: Use built-in RCU
	list checking
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

On Tue, Feb 18, 2020 at 1:17 PM <madhuparnabhowmik10@gmail.com> wrote:
>
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
> list_for_each_entry_rcu() has built-in RCU and lock checking.
>
> Pass cond argument to list_for_each_entry_rcu() to silence
> false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> by default.
>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  net/netlabel/netlabel_unlabeled.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Not that this has much bearing since it's already been merged, but for
what it's worth ...

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index d2e4ab8d1cb1..77bb1bb22c3b 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -207,7 +207,8 @@ static struct netlbl_unlhsh_iface *netlbl_unlhsh_search_iface(int ifindex)
>
>         bkt = netlbl_unlhsh_hash(ifindex);
>         bkt_list = &netlbl_unlhsh_rcu_deref(netlbl_unlhsh)->tbl[bkt];
> -       list_for_each_entry_rcu(iter, bkt_list, list)
> +       list_for_each_entry_rcu(iter, bkt_list, list,
> +                               lockdep_is_held(&netlbl_unlhsh_lock))
>                 if (iter->valid && iter->ifindex == ifindex)
>                         return iter;
>
> --
> 2.17.1

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
