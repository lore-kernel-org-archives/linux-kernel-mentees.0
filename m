Return-Path: <SRS0=sPDn=3N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B397C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:31:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3222071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4C/N7dZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3222071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D60486A22;
	Fri, 24 Jan 2020 04:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id px69rJZUdUTX; Fri, 24 Jan 2020 04:31:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8AF386AE2;
	Fri, 24 Jan 2020 04:31:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A51B7C0176;
	Fri, 24 Jan 2020 04:31:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB277C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9DCF885074
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0VCJxzdY5Gp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:31:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1D203876DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:31:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 6so371812pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 20:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vAi/KPd03pktMu80W5NnBp6vIHB4ASH6MsDJKtQDurE=;
 b=k4C/N7dZe/TMOaRdLeDTeD3N4gbKJp9jO141k9so9NNn2FFEp7NwMRw9tg0nHF2VI+
 S33kGt1IYfl082YG0Db/7zTYSya3CFz8CZ4ja+UsPQPtZo4hE6YVVyegRV6yw2WlYceg
 I6Ju++iLcb822zTTfrIiR4V9wVDGhvU1mjB83VwRkn4o0wzsLnLidr3kYjO8GlzSIG+r
 0sDqBjV3kft3F4hzBXT6TbmU2AAZ5qeFCGTdNySs3fPQKMxTEU1KIVG90yNL1Dm5uPon
 jxxvhF7bq7Lm9xEDT82sjh0lfzTJp56M+td9dnKCRDUVJ77k/hPtuOqV8PIucdqCE5wT
 Ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vAi/KPd03pktMu80W5NnBp6vIHB4ASH6MsDJKtQDurE=;
 b=qB15yLO/gB2cJRn2nW2TI0D75GNsWt54SQ0oxF8Cp88m8P4KX0IrL5fY0HiyBq+jlu
 siJS8+U0d/lPsJvdSTmPjuIvcXqTaI+MmD71agioGJd/RRHVbk0Ln/2A2s+Hvp01NcKa
 swcVC4a7H1ek6tcRpQ/hMbqJPJbJzjkszHh6S63iMIHP+Xv9TxN2hyOP4CoI+zH/ypNA
 wPBnA+D+3JYY9iUUr8mqxX7XBCqjR/k4/OmTI4ObW5FvHtwcMvQ+qA2diIxtFjBR6iDV
 IoguUITcqmwRmMGJcEnD1DaimDLkUuTcrZC0NHR0e8vR11KCpO7zoG21gT1u19AsQtar
 vAcg==
X-Gm-Message-State: APjAAAVSvbC7xHhV5kO3EM6f0R8mfxTMoZ8T5U/Yu4Lw+2l5ytDvr1yq
 8AvITR87Gr9f005jBMzfSA==
X-Google-Smtp-Source: APXvYqwIE6tTVfRLqcQR3euqy9sQFs/bkaoB4uaYCS+t/A3tlB9kn9l0qF1C84AXee8W9GbZZlfwLQ==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr1929780pgv.55.1579840277621; 
 Thu, 23 Jan 2020 20:31:17 -0800 (PST)
Received: from madhuparna-HP-Notebook ([2402:3a80:1ee5:e37b:72:f3a9:f673:9aea])
 by smtp.gmail.com with ESMTPSA id h6sm4271929pfo.175.2020.01.23.20.31.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 20:31:17 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 24 Jan 2020 10:01:10 +0530
To: Jessica Yu <jeyu@kernel.org>
Message-ID: <20200124043110.GD23699@madhuparna-HP-Notebook>
References: <20200122170447.20539-1-madhuparnabhowmik10@gmail.com>
 <20200123172257.GA14784@linux-8ccs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123172257.GA14784@linux-8ccs>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Jan 23, 2020 at 06:22:58PM +0100, Jessica Yu wrote:
> +++ madhuparnabhowmik10@gmail.com [22/01/20 22:34 +0530]:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > This patch fixes the following sparse errors:
> > 
> > kernel/module.c:3623:9: error: incompatible types in comparison expression
> > kernel/module.c:4060:41: error: incompatible types in comparison expression
> > kernel/module.c:4203:28: error: incompatible types in comparison expression
> > kernel/module.c:4225:41: error: incompatible types in comparison expression
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Hi Madhuparna,
> 
> Thanks, I can confirm this patch fixes the sparse warnings. I've
> applied it to modules-next.
>
Thank you Jessica.

Regards,
Madhuparna

> Jessica
> 
> > ---
> > include/linux/module.h | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index bd165ba68617..dfdc8863e26a 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -429,7 +429,7 @@ struct module {
> > 
> > #ifdef CONFIG_KALLSYMS
> > 	/* Protected by RCU and/or module_mutex: use rcu_dereference() */
> > -	struct mod_kallsyms *kallsyms;
> > +	struct mod_kallsyms __rcu *kallsyms;
> > 	struct mod_kallsyms core_kallsyms;
> > 
> > 	/* Section attributes */
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
