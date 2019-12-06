Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0FAC2D0BF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 00:04:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5A72173E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 00:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MF82HqQX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5A72173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 99E74204F4;
	Fri,  6 Dec 2019 00:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVJvjJKcllui; Fri,  6 Dec 2019 00:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F3D09204C6;
	Fri,  6 Dec 2019 00:04:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0981C1D7C;
	Fri,  6 Dec 2019 00:04:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FD65C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 00:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 62369204F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 00:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6bEpapKBg4w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 00:04:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B3376204C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 00:04:46 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 864BD2173E;
 Fri,  6 Dec 2019 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575590686;
 bh=AHTJZcpN/qDv+wbWaTsS7NjJKUfm6INqxec1a3pa6FY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=MF82HqQXjxBVUdoCFnI8bNTstmeIMs1kGG0nx6Gei8RsgBLcHa6KrsYm55riGFZou
 IAcf5bo6L0J9oDd8x8lYIPGK7UpZEsHGeh8nYBzxW1IhvVDEf1iXj5VErZk3EsdcB0
 2yO1G34RiaaCIotKCsq3SkUnQoSxAGmmvmdoTVzc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 564BD3522782; Thu,  5 Dec 2019 16:04:46 -0800 (PST)
Date: Thu, 5 Dec 2019 16:04:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191206000446.GW2889@paulmck-ThinkPad-P72>
References: <20191205185352.1957-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205185352.1957-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, josh@joshtriplett.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] include: linux: rculist_nulls:
 Change docbook comment headers
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Dec 06, 2019 at 12:23:52AM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch changes the docbook comment "head for your list"
> to "head of the list".
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

I applied both with some updates to the subject line and commit log.
Could you please double-check for errors on my part?

							Thanx, Paul

> ---
>  include/linux/rculist_nulls.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
> index 517a06f36c7a..bea311c884b3 100644
> --- a/include/linux/rculist_nulls.h
> +++ b/include/linux/rculist_nulls.h
> @@ -104,7 +104,7 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
>   * hlist_nulls_for_each_entry_rcu - iterate over rcu list of given type
>   * @tpos:	the type * to use as a loop cursor.
>   * @pos:	the &struct hlist_nulls_node to use as a loop cursor.
> - * @head:	the head for your list.
> + * @head:	the head of the list.
>   * @member:	the name of the hlist_nulls_node within the struct.
>   *
>   * The barrier() is needed to make sure compiler doesn't cache first element [1],
> @@ -124,7 +124,7 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
>   *   iterate over list of given type safe against removal of list entry
>   * @tpos:	the type * to use as a loop cursor.
>   * @pos:	the &struct hlist_nulls_node to use as a loop cursor.
> - * @head:	the head for your list.
> + * @head:	the head of the list.
>   * @member:	the name of the hlist_nulls_node within the struct.
>   */
>  #define hlist_nulls_for_each_entry_safe(tpos, pos, head, member)		\
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
