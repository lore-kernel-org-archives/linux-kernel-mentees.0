Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDC7C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 02:29:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7982071A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 02:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="YdGbiaMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7982071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 700802150A;
	Wed, 27 Nov 2019 02:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sY4mvAcWVAD; Wed, 27 Nov 2019 02:29:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A4B0B20035;
	Wed, 27 Nov 2019 02:29:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9800BC1DDD;
	Wed, 27 Nov 2019 02:29:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9026C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 02:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A241A877E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 02:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6O+ZNZUHwXTt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 02:29:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1A683877B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 02:29:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y206so1565875pfb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 18:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NN2NK4AVnHEIbvB9lst01l+3zKuPHZoMQF6S334Sv9g=;
 b=YdGbiaMu/yoWaKdN4xLKKLWNKdEv4Ec2V5T+CBLpDakJdirXjnihGmEMfcfVHpU03y
 hbXNsp0s0xpC1m/qkIcZTQkwcSjocPq/hPYojNUH6Mc2LdAwueyJa25wJLmbLDyhQ7n3
 TICUTAr5viybVXfMWtNdFutu6P0ZtFSnMmR1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NN2NK4AVnHEIbvB9lst01l+3zKuPHZoMQF6S334Sv9g=;
 b=HkR3u/joCh0dE7DmXlWM+kMoTtqQgV7HrM+mi+u3eRmqj1L624+HGvRY0Uzwmwf6BX
 +VFeFJGZ2EGEf2kkbGnmR7esa2C6W6K+Jj3TK6+GJqXR+2D+BMYevBAepHVybSDR/cEi
 cSYMDm7Ik7d4Ddyl2CtdkyTnaN6JSVPATVfRR7tXGkLaTR0uISJ7MJJYbhwmaBVVl8+J
 oyDdv7ROagD/5CsTDvkuxo50Hy4LvaxboSVPnqdHJXavMvv/H1Zatm3T16r2kxsdQrRC
 bD/l9oCp9gGXRlppHVx8Lh4zEg1MmNXorceN1S3uxSrIUDLmNtxcj2dTnokSxmXgDlf8
 c8cQ==
X-Gm-Message-State: APjAAAXd2zH/rXddDG2/Ze0vnEkgyLCCi+U+3IfyyDvDvq7zEJAicfYD
 KgrCakNTebtkgHTagLDK+4Z1iQ==
X-Google-Smtp-Source: APXvYqx+HX61yjud9fIbZqiRcxDpx9y0e6bR1uba8VJ+HnNyYomcwswg1BHVEDSvG74B2G9ilx7NIQ==
X-Received: by 2002:a63:770c:: with SMTP id s12mr2129673pgc.25.1574821767441; 
 Tue, 26 Nov 2019 18:29:27 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id u7sm4370989pjx.19.2019.11.26.18.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 18:29:26 -0800 (PST)
Date: Tue, 26 Nov 2019 21:29:25 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191127022925.GB157739@google.com>
References: <20191126172723.GA12759@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126172723.GA12759@workstation-kernel-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kernel: audit.c: Add __rcu
	notation to RCU pointer
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

On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> add __rcu notation to RCU protected global pointer auditd_conn
> 
> Fixes multiple instances of sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/audit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..30e7fc9b8da2 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -102,12 +102,14 @@ struct audit_net {
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
> +RCU_INIT_POINTER(auditd_conn);

Looks like this causes a build error. Always please build test your patches
in the very least. And I also did not understand how RCU_INIT_POINTER can
even be used outside of a function. In C, executable code cannot be outside
functions.

Is doing the following not sufficient to fix the sparse issue?

thanks,

 - Joel

---8<-----------------------

diff --git a/kernel/audit.c b/kernel/audit.c
index 49b6049b26ac..c5d4b5a2dea1 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -108,8 +108,8 @@ struct auditd_connection {
 	struct net *net;
 	struct rcu_head rcu;
 };
-static struct auditd_connection __rcu *auditd_conn;
-RCU_INIT_POINTER(auditd_conn);
+static struct auditd_connection __rcu *auditd_conn = NULL;
+
 static DEFINE_SPINLOCK(auditd_conn_lock);
 
 /* If audit_rate_limit is non-zero, limit the rate of sending audit records
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
