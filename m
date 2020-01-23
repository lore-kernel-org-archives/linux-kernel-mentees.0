Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A24C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:23:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BD321569
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs0hz3m7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BD321569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 86F8722624;
	Thu, 23 Jan 2020 17:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLYS23vDcuVj; Thu, 23 Jan 2020 17:23:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AD77122613;
	Thu, 23 Jan 2020 17:23:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97230C18DD;
	Thu, 23 Jan 2020 17:23:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB3EC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 773B622613
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPH9X3IhKhTt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:23:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id ACFE722219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:23:04 +0000 (UTC)
Received: from linux-8ccs (x2f7fea8.dyn.telefonica.de [2.247.254.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30AB1207FF;
 Thu, 23 Jan 2020 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579800184;
 bh=vdad4h34opYp5igmK3XVwdbMOblM1qfChkC2aQ7dLVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cs0hz3m7UAqKvsQ5oNLIQzdgRdSQjGmU0cMUw27DzycVvzfHfNH/nQ5z7PAO+W+5U
 c8OCWz5tPzB3HrmhpkQXB7fqizYL1b/ISqQRHpfOs1cEi7w0DDQRoFwjn5tUZsuRsX
 uDd89xMAqcCAODFElxaBDSxEYsTQskn/YEXoPMG0=
Date: Thu, 23 Jan 2020 18:22:58 +0100
From: Jessica Yu <jeyu@kernel.org>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200123172257.GA14784@linux-8ccs>
References: <20200122170447.20539-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122170447.20539-1-madhuparnabhowmik10@gmail.com>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] module.h: Annotate mod_kallsyms
	with __rcu
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

+++ madhuparnabhowmik10@gmail.com [22/01/20 22:34 +0530]:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>This patch fixes the following sparse errors:
>
>kernel/module.c:3623:9: error: incompatible types in comparison expression
>kernel/module.c:4060:41: error: incompatible types in comparison expression
>kernel/module.c:4203:28: error: incompatible types in comparison expression
>kernel/module.c:4225:41: error: incompatible types in comparison expression
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Hi Madhuparna,

Thanks, I can confirm this patch fixes the sparse warnings. I've
applied it to modules-next.

Jessica

>---
> include/linux/module.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/linux/module.h b/include/linux/module.h
>index bd165ba68617..dfdc8863e26a 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -429,7 +429,7 @@ struct module {
>
> #ifdef CONFIG_KALLSYMS
> 	/* Protected by RCU and/or module_mutex: use rcu_dereference() */
>-	struct mod_kallsyms *kallsyms;
>+	struct mod_kallsyms __rcu *kallsyms;
> 	struct mod_kallsyms core_kallsyms;
>
> 	/* Section attributes */
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
