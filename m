Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349A9C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 12:31:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF36B2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 12:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaaLsCCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF36B2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C51AC86E4F;
	Wed, 29 Jan 2020 12:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxgcLaT7n-Dl; Wed, 29 Jan 2020 12:31:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5EBE686E4E;
	Wed, 29 Jan 2020 12:31:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 563DEC0178;
	Wed, 29 Jan 2020 12:31:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDA30C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 12:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B5FA288075
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 12:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJhwtNC5l4RC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 12:31:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0467E87FA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580301059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVoGmnbnu+6R1pSCl0dLyuO7kwDWvlmj5m5kaifObZg=;
 b=ZaaLsCCub7Z4xmuXFeLEhSU6vMEN5NwNHeaaEzoCGXSXfKE2yartIajPJEYizEgjx4OzKw
 0tHjngx8fOA9hg1hJ6noOcdSHz77jk6jFckJoCfUUHZbt0nQzrLE8hLlsFM1cxtPc/hArq
 s2b45Xcm+NP7jE1nsGgYBWl4N2I+DT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-Q5wd-9RhPqyzHHEuMF8AeA-1; Wed, 29 Jan 2020 07:30:53 -0500
X-MC-Unique: Q5wd-9RhPqyzHHEuMF8AeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7238E800D41;
 Wed, 29 Jan 2020 12:30:51 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
 by smtp.corp.redhat.com (Postfix) with SMTP id 8A0695C1B5;
 Wed, 29 Jan 2020 12:30:49 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed, 29 Jan 2020 13:30:49 +0100 (CET)
Date: Wed, 29 Jan 2020 13:30:47 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200129123046.GA1726@redhat.com>
References: <20200128172008.22665-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128172008.22665-1-madhuparnabhowmik10@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: paulmck@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org, christian.brauner@ubuntu.com,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
	warnings
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

On 01/28, madhuparnabhowmik10@gmail.com wrote:
>
> kernel/exit.c:626:40: warning: incorrect type in assignment
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  kernel/exit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index bcbd59888e67..c5a9d6360440 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -623,8 +623,8 @@ static void forget_original_parent(struct task_struct *father,
>  	reaper = find_new_reaper(father, reaper);
>  	list_for_each_entry(p, &father->children, sibling) {
>  		for_each_thread(p, t) {
> -			t->real_parent = reaper;
> -			BUG_ON((!t->ptrace) != (t->parent == father));
> +			rcu_assign_pointer(t->real_parent, reaper);

Another case when RCU_INIT_POINTER() makes more sense (although to me it
too looks confusing). We didn't modify the new parent.

Oleg.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
