Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B51C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 21:19:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B83512068E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 21:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="k5OBlfOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B83512068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DE3885CFF;
	Mon,  2 Dec 2019 21:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJgj_U7ahLnY; Mon,  2 Dec 2019 21:19:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9CCC385722;
	Mon,  2 Dec 2019 21:19:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89191C1798;
	Mon,  2 Dec 2019 21:19:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44DF7C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 21:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 40D57203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 21:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef14zdWyGiH0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 21:19:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 82D8B2034B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 21:19:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x28so382532pfo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BDFi2KtUfHoxYhQyKwF8j1ECcKUBGo4/hE4QVcfZiuY=;
 b=k5OBlfOUiouOhGL4KZyw41pLaH30PzkB5d3ZDqtGV/Ol3dKliwN57h0InITL0WL2vX
 Ss72U23D08CWmhSmsy1She1V1pEOZy2IVux+qSo1YzkuqPk88MpxiAZbVyHawT8fqQWi
 pcmXULt3qf+94Pauot0hTlG85A4cOlnm+Fscg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BDFi2KtUfHoxYhQyKwF8j1ECcKUBGo4/hE4QVcfZiuY=;
 b=ca6YZ4BAfrfjF+uJbnJvbdBgIyXHJCyTI2FJpU+JrwpnSFEHRGjUCoejyLspVijsXJ
 VNVivOZh6qV8iBGZ80kkCskF88lwKNNFdrNFP5yy0qRNcDdC4pgJuQLRSD+EWpUH+Ckf
 vqdm31h2JxvdgMp9INraDUPJ3J6Y2fZsPS26ah+bnhM+k928JNE63SkDDEkpSC2qzfYz
 V+tL016aPzuyGDsN0qvnRjeU5F7Cidg9md/R4Kc1CeI1nH5e5WG9+LcSFAXB3xKBTDol
 J25+XumHq3YgmzpAXTSzO7Z4BZfCMBSRkkqudKs5kcvuYrXrI8aEElDyUZC7cywSzXs3
 Ooog==
X-Gm-Message-State: APjAAAVr6cSvnbKWiYdrJyEUw3bj0M+1Nu3P1kEh02vwms9oLWMxn+Gd
 4zgR8M+DUEzJ64pipuLufnmg3A==
X-Google-Smtp-Source: APXvYqxSoc2SCTWEE4t/98ajNaXkB89lCMxgkBxngI0eYX8ZLLrTxHxWP3ZysSCHCSy6mvVMxbj+MQ==
X-Received: by 2002:a62:5807:: with SMTP id m7mr743978pfb.180.1575321558967;
 Mon, 02 Dec 2019 13:19:18 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id a26sm398874pff.155.2019.12.02.13.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 13:19:16 -0800 (PST)
Date: Mon, 2 Dec 2019 16:19:15 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191202211915.GF17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191201183347.18122-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Moore <paul@paul-moore.com>, paulmck@kernel.org,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 rcu@vger.kernel.org, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] kernel: audit.c: Add __rcu
	annotation to RCU pointer
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

Good idea to CC the following on RCU patches:
Paul McKenney
Steven Rostedt
(Any others on the RCU maintainers list).
And, the list: rcu@vger.kernel.org

Could anyone Ack the patch? Looks safe and straight forward.

On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> Add __rcu annotation to RCU-protected global pointer auditd_conn.
> 
> auditd_conn is an RCU-protected global pointer,i.e., accessed
> via RCU methods rcu_dereference() and rcu_assign_pointer(),
> hence it must be annotated with __rcu for sparse to report
> warnings/errors correctly.
> 
> Fix multiple instances of the sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
> v3:
> - update changelog to be more descriptive
> 
> v2:
> - fix erroneous RCU pointer initialization
>  
>  kernel/audit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..ff7cfc61f53d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -102,12 +102,13 @@ struct audit_net {
>   * This struct is RCU protected; you must either hold the RCU lock for reading
>   * or the associated spinlock for writing.
>   */
> -static struct auditd_connection {
> +struct auditd_connection {
>  	struct pid *pid;
>  	u32 portid;
>  	struct net *net;
>  	struct rcu_head rcu;
> -} *auditd_conn = NULL;
> +};
> +static struct auditd_connection __rcu *auditd_conn;
>  static DEFINE_SPINLOCK(auditd_conn_lock);
>  
>  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> -- 
> 2.24.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
