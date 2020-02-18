Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0603C34031
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 22:51:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF0322B48
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 22:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="D6s6qOgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF0322B48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3391C204B2;
	Tue, 18 Feb 2020 22:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1L4Hi82MvW8; Tue, 18 Feb 2020 22:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A36D7203F0;
	Tue, 18 Feb 2020 22:51:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EF09C1D84;
	Tue, 18 Feb 2020 22:51:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7905AC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 681E58782A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gGjUE06-Vbf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:51:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C366087866
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 22:50:26 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r21so26767986edq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 14:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=41cGzlU4cjOdIvYsB+FQ4XEqSVKoQUwQYSLczOx+4g8=;
 b=D6s6qOgHjccdc5oGSjGRqwxlUW6kIZZPog/sURVbWHbS3Cb2XZFtNtalcUDhRwfi6c
 KMZWzKfrC9mjM8IfBy+t8tO2xdGQO+8QNww/Q4b2NHygytY/qtPrMxTkYbL31pcagluO
 5zNenTvZ3/qZYgulcelTOG5nWniaGs4zafcOmLeLMRy2p4ka8WukVSjL2QbDzZoR7r2o
 G4BZaqyM+UQLcIWT4GWLsdbZuUM0A0rLKMIi8L4q3+EFdxfNpMA7fI42E44VacWDurBQ
 ym1Xbj1x8Si0Qj39ehvo8PwoG3gAd3+PghuaUB5/p8U6zX+Gq6Uq67SUYkmfbAPYZszj
 0S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41cGzlU4cjOdIvYsB+FQ4XEqSVKoQUwQYSLczOx+4g8=;
 b=tuVjJCeuYgLHANWElUSUq7EA2AUN+I/EnPthWx1EH7hvmMtWdXQg8NeT5g88rvf1vf
 30wit86QFH/2MDqlgCKrxHxR2/l4mSbvhobnzU8vUGvdvfysNs1bnHgZMrmFlBFejb+a
 8K53eK6itDWBn+akjRP7dPdXmtqagQc/2dyESJUrkdIFhyTvGnsWmt3q7cWDENzJ/hnI
 8RFWFpw20QQU5Yxck4Ecsl78rmdEtCY2lHYNMbCsFz5riDm6PD6fh4dHLk8cg5nNFrhf
 9GEaAXJXZysHgfueBUKWsiHhYtxO/hrhXzRWCN+zOYkDaMDb7iDet2VI+DmshnAkEnnJ
 AmmQ==
X-Gm-Message-State: APjAAAWRMCvTr5cxeUGiy6834Uby1hAiQ0pO97hYY56AfLSFOEgflftB
 jpC9T/FcE4GY2hB+5VNoMRK6pYrk8h81l40TV/fF
X-Google-Smtp-Source: APXvYqyhhYGjJi44BuMzGcIPQERfVr3yRw9OSPDNrlzTgybuGmGK43HZ9IiGu1tLojzYp++JzNqAIROsoipZq7DV9xU=
X-Received: by 2002:a17:906:198b:: with SMTP id
 g11mr21930378ejd.271.1582066224967; 
 Tue, 18 Feb 2020 14:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20200218184132.20363-1-madhuparnabhowmik10@gmail.com>
In-Reply-To: <20200218184132.20363-1-madhuparnabhowmik10@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Feb 2020 17:50:14 -0500
Message-ID: <CAHC9VhShJnD-YnGNN7eYK3k5B3uJd7KVmG4oATboqWGXvFuv5w@mail.gmail.com>
To: madhuparnabhowmik10@gmail.com
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] netlabel_domainhash.c: Use
	built-in RCU list checking
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

On Tue, Feb 18, 2020 at 1:42 PM <madhuparnabhowmik10@gmail.com> wrote:
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
>  net/netlabel/netlabel_domainhash.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Same as with the other patch.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/netlabel/netlabel_domainhash.c b/net/netlabel/netlabel_domainhash.c
> index f5d34da0646e..a1f2320ecc16 100644
> --- a/net/netlabel/netlabel_domainhash.c
> +++ b/net/netlabel/netlabel_domainhash.c
> @@ -143,7 +143,8 @@ static struct netlbl_dom_map *netlbl_domhsh_search(const char *domain,
>         if (domain != NULL) {
>                 bkt = netlbl_domhsh_hash(domain);
>                 bkt_list = &netlbl_domhsh_rcu_deref(netlbl_domhsh)->tbl[bkt];
> -               list_for_each_entry_rcu(iter, bkt_list, list)
> +               list_for_each_entry_rcu(iter, bkt_list, list,
> +                                       lockdep_is_held(&netlbl_domhsh_lock))
>                         if (iter->valid &&
>                             netlbl_family_match(iter->family, family) &&
>                             strcmp(iter->domain, domain) == 0)
> --
> 2.17.1

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
