Return-Path: <SRS0=sPDn=3N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EABC2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:26:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A392072C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjKprFmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A392072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1142F86C5E;
	Fri, 24 Jan 2020 04:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fUf1nKnNQcg; Fri, 24 Jan 2020 04:26:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1487086BB9;
	Fri, 24 Jan 2020 04:26:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE096C0176;
	Fri, 24 Jan 2020 04:26:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4DF7C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 952A3884EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bi--4l-5push
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:26:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 16D65884D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:26:21 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e11so487158pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 20:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ESSVHC6qV85e8H5wIqp30FQ6rrj3HanCaflPIZpS5p4=;
 b=sjKprFmI5+PynbYnEaH+yspbuyLdAbql3dsNyfASc9i/V4WnLGJNLX8PkReWZWxmSX
 UJpDaa95WQ6TOfGT8pV0i4/xfWk/enTJmSL+nxzS9NsUXqpPT0Ase/1tMHhjV9AQeHJS
 tZ3eVS/rVqnHyRlK17Ck4b9IpC6Gx4xd+RYSF2lrbubZ42ydLyFnim0XwgU+hS0F/CyA
 Rj1WahUr0qft/ln24gUFecseWvdTj8nABLi7TZMdJGA4Zy9vztUyB1rcGM1Ec3FV2d9G
 t+8W/4Z1dzG2o3aAPLkVI4LPMvMj2WRMnPu5jY17GEy31k9RhMkfnyuy+uVTB61E5gtv
 h37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ESSVHC6qV85e8H5wIqp30FQ6rrj3HanCaflPIZpS5p4=;
 b=uMChmG4a1/81HcBDwwCFP6RncQ9mYb+g/DTNbIJpzJC3PY9oDpSBnLuYixZu0T/EMM
 ktqYT3TB/MT1q4z8EwPhohuha1hFx/bpMz+Y4kQq+kaUUUCrdjtofwxup5+8c16MNPqi
 D2vW+yzIsBu7eHzrUxUCk2totys+7ChjgFX1+Ol7749CCnqEhh6dUcPmaa1qIpx5HtN8
 Jik284IVh4kwzePmvNWfdGC0ou4ADZtkZd5nYnNPyK/seE287ObYRzTEHu0pbrQ+dw5o
 gl8nzfXXCjKYE88GKh6rEmtdUF0utNB0pJz9HJvyw17uSJjCO0mytBJrtR++mBDVWqhx
 AYIA==
X-Gm-Message-State: APjAAAWcBXIA+02JzrR5RWxWKlvDzCY9OrL9882vgLgsP40ce9apd6D/
 oWtGOpEAk2B5XGn9qWhIyQ==
X-Google-Smtp-Source: APXvYqxprB70a0uP/R+rGUDMKzsz+0tnKdqYZd8ZDy2t+H61CeoOvFKKrX7ufnu84cM9HGFooDRwhQ==
X-Received: by 2002:a17:90a:6545:: with SMTP id
 f5mr1243695pjs.42.1579839980685; 
 Thu, 23 Jan 2020 20:26:20 -0800 (PST)
Received: from madhuparna-HP-Notebook ([2402:3a80:1ee5:e37b:72:f3a9:f673:9aea])
 by smtp.gmail.com with ESMTPSA id g9sm4381184pfm.150.2020.01.23.20.26.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 20:26:20 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 24 Jan 2020 09:56:12 +0530
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Message-ID: <20200124042612.GB23699@madhuparna-HP-Notebook>
References: <20200122170246.20177-1-madhuparnabhowmik10@gmail.com>
 <20200123160850.gcwoydrdpw6saotk@ca-dmjordan1.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123160850.gcwoydrdpw6saotk@ca-dmjordan1.us.oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: steffen.klassert@secunet.com, Herbert Xu <herbert@gondor.apana.org.au>,
 paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, linux-crypto@vger.kernel.org,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] padata.h: Annotate parallel_data
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

On Thu, Jan 23, 2020 at 11:08:50AM -0500, Daniel Jordan wrote:
> [add Herbert]
> 
> Hi Madhuparna,
> 
> On Wed, Jan 22, 2020 at 10:32:46PM +0530, madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > This patch fixes the following sparse errors:
> > kernel/padata.c:110:14: error: incompatible types in comparison expression
> > kernel/padata.c:520:9: error: incompatible types in comparison expression
> > kernel/padata.c:1000:9: error: incompatible types in comparison expression
> 
> This recent patch to padata in the cryptodev tree has fixed these sparse errors
> and is heading for mainline soon:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=bbefa1dd6a6d53537c11624752219e39959d04fb
>
Thank you for letting me know about this.

Regards,
Madhuparna

> Thanks,
> Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
