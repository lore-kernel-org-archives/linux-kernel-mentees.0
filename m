Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ECEC35247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 16:51:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D8F217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 16:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmPL0gav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D8F217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9A0285B36;
	Wed,  5 Feb 2020 16:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UZtcMk67Cif; Wed,  5 Feb 2020 16:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8DDB824B0;
	Wed,  5 Feb 2020 16:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF966C1D81;
	Wed,  5 Feb 2020 16:51:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B8A6C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7465C85B36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSLPl508tvi7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:51:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C3CEE824B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 16:51:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c23so1110343plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ywEsvWm4XVLIMTnvEIQGcAo+zgmS5NmEL02AYmIK1Y8=;
 b=NmPL0gav3uJ5A/Mbh21U5I4QCRwUW32KYipdtdD6pSLUAI743KHd6WwwbypJkQ0Byd
 sn3Z+1bL0V+RloZmr7vJsfphoIlFkLPQOw0ox9euG87te7ZgLyq1hbw8cUrDMydZEGRv
 xuOsNvt1tU+0zpiqASKIGBox/QhiCx+3Zv9Y8p9EQULevVi2iOt3OqEmTh1Yaj6MTFO9
 M+3b+KyoqND1pHU7q1Dw3H+ITTJibRQ051CGVT4BGpH5i7e3S5vRysvEjiTSTkMwADNq
 qtARhG/UWh3aijEAitsUfjy8eYSFAP5OnHTulgheENbRoURrTQAUAQ75Duxy+z4O/Vvn
 TVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywEsvWm4XVLIMTnvEIQGcAo+zgmS5NmEL02AYmIK1Y8=;
 b=pD7zs0JgwdOgO0+hkxy9rw0dwBwxcLJBUNKA2DWBMoyiHW67HgROwaVnXsoDusPgwj
 vBl7AQDO5rPGUiblT89PZ6KecB1V1dPgybqr5tUgBCUcFkUpUrVi1aBdF6n/4PvH1RUX
 lC32kZ/ty2rG4oseZv5Xxq7LxvfDeyuYgXEk17xZl9/ldaqDCOWCLNPxMeQk+4iyufWB
 /FFzZqwboF3Wwi8eqh0egVsGGCSwmBJ4rCnDQ2/aNYzEQHErmxnenYKHao9PC+U8whUC
 OwqfNAQgpHpYWaFYwQTYOODtwbe0Xz+skLF8pYqz+0H3X+XorAvzYqpCrsQw+dsslgvD
 8a/Q==
X-Gm-Message-State: APjAAAXLvqim3C8FlkcHCnEeTcDQ1rursa/shN1mKHdSO6WxsHlE7lrP
 uK5bP/8XG0/qE+p1MOZcmyc=
X-Google-Smtp-Source: APXvYqxXmsQtDlHhBs00qKZgpGV/nHF2y5uD2anu+uCp67JH4gEJlJrFqNlzACA4NDaxUinEjbNAUw==
X-Received: by 2002:a17:902:a706:: with SMTP id
 w6mr36261822plq.79.1580921505290; 
 Wed, 05 Feb 2020 08:51:45 -0800 (PST)
Received: from workstation-portable ([103.211.17.109])
 by smtp.gmail.com with ESMTPSA id p17sm43132pfn.31.2020.02.05.08.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 08:51:44 -0800 (PST)
Date: Wed, 5 Feb 2020 22:21:38 +0530
From: Amol Grover <frextrite@gmail.com>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200205165138.GB22537@workstation-portable>
References: <20200205162319.28263-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205162319.28263-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, oleg@redhat.com,
 joel@joelfernandes.org, ebiederm@xmission.com, tj@kernel.org,
 christian.brauner@ubuntu.com, linux-kernel-mentees@lists.linuxfoundation.org,
 guro@fb.com
Subject: Re: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

On Wed, Feb 05, 2020 at 09:53:19PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> This patch fixes the following two sparse warnings caused due to
> accessing RCU protected pointer tsk->parent without rcu primitives.
> 
> kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1948:65:    expected struct task_struct *tsk
> kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
> kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1949:40:    expected void const volatile *p
> kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> kernel/signal.c:1949:40:    expected void const volatile *p
> kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  kernel/signal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 9ad8dea93dbb..3d59e5652d94 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	 * correct to rely on this
>  	 */
>  	rcu_read_lock();
> -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_access_pointer(tsk->parent)));
> +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_access_pointer(tsk->parent), user_ns),

Shouldn't rcu_dereference() OR rcu_dereference_check() be better suited
here? Since, rcu_access_pointer() omits all lockdep checks.

Thanks
Amol

>  				       task_uid(tsk));
>  	rcu_read_unlock();
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
