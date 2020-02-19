Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436F2C34056
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 19:35:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CF4208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 19:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc7Q51d4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03CF4208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C5DE920780;
	Wed, 19 Feb 2020 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 495V-2smN+hb; Wed, 19 Feb 2020 19:35:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 04A0320764;
	Wed, 19 Feb 2020 19:35:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0705C1D81;
	Wed, 19 Feb 2020 19:35:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BC76C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A85A87987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBvCZBRUVEM6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 19:35:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1E5E8791E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 19:35:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z12so606536pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 11:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TJB87GoDSDS5eCfiA9gR2g0zVyeNrrkXgkcpdklcL2M=;
 b=oc7Q51d4YtnLDYX2A8TMQ4xesXFWl/2DkhyK9OtaG4kMy1ZgusJRqiFamcQiJGi0rg
 MuVDKajG3ccLjKItJx2pa9geyOXV47tNaRRrbhEwosVyy7i8VgOXgH+TwDkkyAhCdJyj
 UCg97xx1zK8zKMI0zx0FCsuKGtD9sXjcYqbnx5oh9yl18U2K69FDVINvmwRTU6/WIuXS
 2d6vCTA5oHxt5TNszR1QauvOoa3TEmMDGqnYs9JybovKNIYzVJ7G9FOPJ7tmznoHZrrh
 9j5t4Vr6fScLrX2RqlPAdPpHtUX5xVHEGaWAXHQ8ZB2POu30f+PO45Ca8HVeruDma89U
 6iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TJB87GoDSDS5eCfiA9gR2g0zVyeNrrkXgkcpdklcL2M=;
 b=QG3pGrq4zcxNPhiop/kq7vy0KaRyDhbMtH5kOatj2awpjWtaPSiQMEKQGZ4MgkdYqE
 4Fr8JXK69V436m0mViGZfsqUdtAlRaxGS9tLxjfWBR52s/9lqDi1TjvgJoDNjAa3BXvy
 dPlyFyDppo3pHp2sadU1dWP9CzJnHJ0IqJ3OGgmf/kW1YMMjG8ZuCkHctAPdfQtqfgLR
 4BOVkheACEaMolfAhS79pGtnUx2oncuIVaa176Jqcq8e+FkiDYX7WA6UsIQNG+y+xobD
 BGsIHnn18GQY2EixGYIfcLuBmf3vSRJvPuNNer93VbJrElzopsMdJdY+M8gGqCrVDvZ6
 PBhw==
X-Gm-Message-State: APjAAAUG34Gm4ziTyiar+JHIhSBTxlk+2Vp2rvYTuusK4E6dvw8myl6t
 Oqv0c11DJ+8AMbudR7T+q64=
X-Google-Smtp-Source: APXvYqyyBPvcc8/naWU80PgrHTXcoA9XhyHQ5ElORvavw1J+a39LkzWU+BOh5AzpGgS/xmgSXmXm+w==
X-Received: by 2002:aa7:9f88:: with SMTP id z8mr28015192pfr.220.1582140925152; 
 Wed, 19 Feb 2020 11:35:25 -0800 (PST)
Received: from [172.20.2.64] (rrcs-24-43-226-3.west.biz.rr.com. [24.43.226.3])
 by smtp.gmail.com with ESMTPSA id
 l26sm492514pgn.46.2020.02.19.11.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 11:35:24 -0800 (PST)
To: Amol Grover <frextrite@gmail.com>, Eric Dumazet <edumazet@google.com>,
 "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>
References: <20200219100545.27397-1-frextrite@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <b628d0ad-e066-46f5-5746-74dfba1816a8@gmail.com>
Date: Wed, 19 Feb 2020 11:35:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219100545.27397-1-frextrite@gmail.com>
Content-Language: en-US
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] tcp: Pass lockdep expression to
	RCU lists
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



On 2/19/20 2:05 AM, Amol Grover wrote:
> tcp_cong_list is traversed using list_for_each_entry_rcu
> outside an RCU read-side critical section but under the protection
> of tcp_cong_list_lock.
>

This is not true.

There are cases where RCU read lock is held,
and others where the tcp_cong_list_lock is held.

I believe you need to be more precise in the changelog.

If there was a bug, net tree would be the target for this patch,
with a required Fixes: tag.

Otherwise, if net-next tree is the intended target, you have to signal
it, as instructed in Documentation/networking/netdev-FAQ.rst

Thanks.

 
> Hence, add corresponding lockdep expression to silence false-positive
> warnings, and harden RCU lists.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  net/ipv4/tcp_cong.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
> index 3737ec096650..8d4446ed309e 100644
> --- a/net/ipv4/tcp_cong.c
> +++ b/net/ipv4/tcp_cong.c
> @@ -25,7 +25,8 @@ static struct tcp_congestion_ops *tcp_ca_find(const char *name)
>  {
>  	struct tcp_congestion_ops *e;
>  
> -	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
> +	list_for_each_entry_rcu(e, &tcp_cong_list, list,
> +				lockdep_is_held(&tcp_cong_list_lock)) {
>  		if (strcmp(e->name, name) == 0)
>  			return e;
>  	}
> @@ -55,7 +56,8 @@ struct tcp_congestion_ops *tcp_ca_find_key(u32 key)
>  {
>  	struct tcp_congestion_ops *e;
>  
> -	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
> +	list_for_each_entry_rcu(e, &tcp_cong_list, list,
> +				lockdep_is_held(&tcp_cong_list_lock)) {
>  		if (e->key == key)
>  			return e;
>  	}
> @@ -317,7 +319,8 @@ int tcp_set_allowed_congestion_control(char *val)
>  	}
>  
>  	/* pass 2 clear old values */
> -	list_for_each_entry_rcu(ca, &tcp_cong_list, list)
> +	list_for_each_entry_rcu(ca, &tcp_cong_list, list,
> +				lockdep_is_held(&tcp_cong_list_lock))
>  		ca->flags &= ~TCP_CONG_NON_RESTRICTED;
>  
>  	/* pass 3 mark as allowed */
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
