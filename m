Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36BCC2BA1E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 07:06:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767FC206F8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 07:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUl+6I4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 767FC206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1F7EE22FEE;
	Mon,  6 Apr 2020 07:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T541XHKflDfx; Mon,  6 Apr 2020 07:06:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 682C422F4C;
	Mon,  6 Apr 2020 07:06:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DF00C1AE2;
	Mon,  6 Apr 2020 07:06:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 536C2C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 07:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4798F85F98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 07:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQ5uQeopDi8a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 07:06:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3211385F7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 07:06:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id z3so6057357pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RqJfBxc+5hEXzJUkSWB0gPw7NrIyI3K3Pr3732qHYAQ=;
 b=fUl+6I4x7XwQcdmoCTE2Z0XeWKNZEAvwwQhxESe8sRcEQ6vn+AfhNO23bXM8aiWdRe
 wVnHoSlX0U3b04JnkGrI5Ay7r0HfzNA0pKXN6fKs/gP6RV4tnDNoiDyKyGKhADiOl43n
 F+mF6OdX/tADPC9HmEUR2PJJhzbFPdsXHduQuuFTWnIM3HbbkxMv3OvuJKYbTAl42H8N
 1djGWbVFtbtxKYMtodVAdgw7d1ViLwhPqusfpHjBZmhP8Wby1fHN6KWDj01D0FRMHbs2
 40LctGPDNwQdiPuTkW3RvZYYmwy5GjBoAHY3eo1S34N7o4Y+/bM9ACEMqEVOAq1Y+/ZZ
 d+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RqJfBxc+5hEXzJUkSWB0gPw7NrIyI3K3Pr3732qHYAQ=;
 b=pWDAtas3z6U4ukmcALHJegGlvPwDxf/cRZgBw0jwoGkZfhPf5u3eJHvZTOR4sl21Jt
 PnR2SHJGrPBYDX0JjkoPRi0V9R5Nbr5HpksX5OJtgeHRC/PRjRrrojYsPSSlVxg/PyBA
 NZEvuThoOBkcvC+M4G3e8zy4pa4QIp6J5QJaEmQGye0FiPzSjzemr37worg3ULdVzhNs
 wy9GJhYsK6Jy2zLK6lDXS4LnoN5BapC7PXyBxk4eJaU9WIcuuOJ3Ilm2cWRD+gjjnU3Y
 ic+xvLOVd6x9sIfNWJx3OTZCRxE+u4u3LRz0WOSyOdc0n/NIZ9y5UjSXUviXpWPTLR+3
 Ooqw==
X-Gm-Message-State: AGi0PuapUXXs/fXdZ2eql48Ndu+V5pRb7qiHUUEqsuXFnCk1fMELNaxt
 GXOblmztEDVkmGvHQy7vHeM=
X-Google-Smtp-Source: APiQypKNbF2E3D32XKuBDPJhhlvxxo8J2rW27s0dKvSTxEZx7hANy5tViHe3jOKRRTeN/AfHY6j/Qg==
X-Received: by 2002:a17:902:507:: with SMTP id 7mr19209367plf.42.1586156784681; 
 Mon, 06 Apr 2020 00:06:24 -0700 (PDT)
Received: from workstation-LAP.localdomain ([103.87.57.178])
 by smtp.gmail.com with ESMTPSA id m2sm11318884pjk.4.2020.04.06.00.06.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 00:06:23 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:36:12 +0530
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Message-ID: <20200406070612.GA240@workstation-LAP.localdomain>
References: <20200216172653.19772-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216172653.19772-1-frextrite@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jeremy Sowden <jeremy@azazel.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org,
 Florent Fourcot <florent.fourcot@wifirst.fr>, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] netfilter: ipset: Pass lockdep
	expression to RCU lists
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

On Sun, Feb 16, 2020 at 10:56:54PM +0530, Amol Grover wrote:
> ip_set_type_list is traversed using list_for_each_entry_rcu
> outside an RCU read-side critical section but under the protection
> of ip_set_type_mutex.
> 
> Hence, add corresponding lockdep expression to silence false-positive
> warnings, and harden RCU lists.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---

Hi David

Could you please go through this patch aswell? This patch was directed to 
preemptively fix the _suspicious RCU usage_ warning which is now also
being reported by Kernel Test Robot.

[   11.654186] =============================
[   11.654619] WARNING: suspicious RCU usage
[   11.655022] 5.6.0-rc1-00179-gdb4ead2cd5253 #1 Not tainted
[   11.655583] -----------------------------
[   11.656001] net/netfilter/ipset/ip_set_core.c:89 RCU-list traversed in non-reader section!!

Thanks
Amol

>  net/netfilter/ipset/ip_set_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
> index cf895bc80871..97c851589160 100644
> --- a/net/netfilter/ipset/ip_set_core.c
> +++ b/net/netfilter/ipset/ip_set_core.c
> @@ -86,7 +86,8 @@ find_set_type(const char *name, u8 family, u8 revision)
>  {
>  	struct ip_set_type *type;
>  
> -	list_for_each_entry_rcu(type, &ip_set_type_list, list)
> +	list_for_each_entry_rcu(type, &ip_set_type_list, list,
> +				lockdep_is_held(&ip_set_type_mutex))
>  		if (STRNCMP(type->name, name) &&
>  		    (type->family == family ||
>  		     type->family == NFPROTO_UNSPEC) &&
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
