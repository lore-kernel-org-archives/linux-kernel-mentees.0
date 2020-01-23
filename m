Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8551C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:18:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8024D21D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDgwVBzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8024D21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48D7A884BF;
	Thu, 23 Jan 2020 17:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BKgZ6D1vLio; Thu, 23 Jan 2020 17:18:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE71F884A9;
	Thu, 23 Jan 2020 17:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C89D9C18DD;
	Thu, 23 Jan 2020 17:18:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E070C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6A1B1868A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYgQQ7UFJli4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:18:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EDDA986895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:18:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w62so1827702pfw.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J1JTF63Y6CzMxj8f1LiDzyUrvtnW4rRNEJCmiTqTTc0=;
 b=UDgwVBzZnhcvQaZx0mH//TdPlf3Gt4jyCzwd+rkzyX903/m4za7IhsqXAAQsQI3EBE
 THeC36+wxa5si4l/zbzlCngfI1/v/lXgk45ujsDWmJ3e9D2V+Y7mnHJ3YDEDWal64BF8
 Uk0folij7LXBqGQ//PcYaX7bVLorg82w9p5jXg4+xi7ykcDAH089kK/vBzB5oys/KdCY
 9Sp9iZByzaGLsfLlOROKHuM7lfcHaFzuh4SRY+O3hPYvE3IYjMfzoQkO5F6XMN7y4S8C
 CCZuAp6yS/bc3hM7Qq1oNI/aN2fn079sAhVOcRzOrIAeIYYW2Dp5tq8Mh8bdR8srVQr9
 NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J1JTF63Y6CzMxj8f1LiDzyUrvtnW4rRNEJCmiTqTTc0=;
 b=ZGso5HbDzdZH/3N7h0pXHmlfgjZ1OlGh7FKRJkdZacHFZlB3ug5FcDi/huDpEFYdeK
 sy6jJZkBaeBG8y5uNAhIguebE7NDC+5GjDwHxq2OBK6NwWTGPxkkkEiSFm0PmC+kJ79I
 GiM4TF95FE+jc0MMppMBtZECyU1y1j+0L4dYI5TIT2IOpNII6GuzbXUWEooZ9AToD10W
 feuDkJw3xc1kcAqd9O9tbmRBQO+26aTZdjmnuA3piwabfnLcHXH2gnI5Aq0wL61oJd4I
 w2VkjQG8g4Tmy/fqvH4IzdevIF0wVPz6w6KEmnPeJMYPZl9NLtlMsA5vfhkKZZ4UqI85
 uueA==
X-Gm-Message-State: APjAAAW0vaKy8kB60mQmIKdSDxqx4oIBMYgPxr6/46z2+JfyjLkhhrys
 FhZrr7QYwn4iJn7fXpKNpjo=
X-Google-Smtp-Source: APXvYqz7qTAcmw9UEgNAfy3malI6VgsOZj09ScBH7BYVJLdSqEWfjSTC8UICf4Yfm6wS7weR9FOztg==
X-Received: by 2002:a63:950c:: with SMTP id p12mr5161358pgd.85.1579799889566; 
 Thu, 23 Jan 2020 09:18:09 -0800 (PST)
Received: from workstation-portable ([103.211.17.138])
 by smtp.gmail.com with ESMTPSA id j9sm3338554pfn.152.2020.01.23.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 09:18:09 -0800 (PST)
Date: Thu, 23 Jan 2020 22:48:00 +0530
From: Amol Grover <frextrite@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 brouer@redhat.com, toke@redhat.com
Message-ID: <20200123171800.GC4484@workstation-portable>
References: <20200123120437.26506-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123120437.26506-1-frextrite@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep
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

On Thu, Jan 23, 2020 at 05:34:38PM +0530, Amol Grover wrote:
> head is traversed using hlist_for_each_entry_rcu outside an
> RCU read-side critical section but under the protection
> of dtab->index_lock.
> 
> Hence, add corresponding lockdep expression to silence false-positive
> lockdep warnings, and harden RCU lists.
> 
Fixes: 6f9d451ab1a3 ("xdp: Add devmap_hash map type for looking up devices by hashed index")
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/bpf/devmap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index 3d3d61b5985b..b4b6b77f309c 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -293,7 +293,8 @@ struct bpf_dtab_netdev *__dev_map_hash_lookup_elem(struct bpf_map *map, u32 key)
>  	struct hlist_head *head = dev_map_index_hash(dtab, key);
>  	struct bpf_dtab_netdev *dev;
>  
> -	hlist_for_each_entry_rcu(dev, head, index_hlist)
> +	hlist_for_each_entry_rcu(dev, head, index_hlist,
> +				 lockdep_is_held(&dtab->index_lock))
>  		if (dev->idx == key)
>  			return dev;
>  
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
