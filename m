Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A87C25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Aug 2022 03:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B592440C6B;
	Wed, 17 Aug 2022 03:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B592440C6B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F19mXXKt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcDWW4nffxD9; Wed, 17 Aug 2022 03:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C98BA40C69;
	Wed, 17 Aug 2022 03:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98BA40C69
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6BCCC0032;
	Wed, 17 Aug 2022 03:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C012C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 03:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A23060671
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 03:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A23060671
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F19mXXKt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZDes6ifEfCx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 03:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4D5560F94
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4D5560F94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Aug 2022 03:04:44 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so654703pjf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QiKcqQGvDQZ0wwxsKELSH16ee9cOyYGIbKKc/TC2lac=;
 b=F19mXXKtLBf6iZVb6OJh9gOPy2/rtD0ZdnW872Bmp9Hgq+BfaOSiyncf8f8FFiLrbw
 sLarg712oGU6m+2FqBAfeZBbnhGkSb3XeZQNewvHJLO5r478kLea8UGdpnvAMfNP4yJO
 KMFnDg2SlEd8+kitF3MHDqBMUfQAENSy08qvPBIhRs04EljBxwF+MIK1XpCyVXjs60lB
 Jf+TqXCq5KkMty7fn0ol9jgro0js6yw5zYaOfv7JSQdwCHRC/+AdarciIMbXvdbfc1rr
 szGau58oFfpvcYt7HhTU5dtxXvr+yD2LAQVfFoBAm8M2Dkccy8NkyPtR0Ai9CmEteSSK
 zZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QiKcqQGvDQZ0wwxsKELSH16ee9cOyYGIbKKc/TC2lac=;
 b=A3Ywab0zCdiVeuNLAWI00REWkuOCYdxM7BHgJaiZ/pDpEGcPmR1Zatq65hlYcF2n/w
 MOafuEeJOGT6iJmN2AIjlA+EYSn06lHIavc+CGAPokG9+QMWXtmbxkkHDEp0JKZ7DOoQ
 1Yx/FYXFyaBmrm02BMXw40Az70b3f7beKkb/cNJXpZUm+3OfO6oXrLYWbQh+20D0t8WH
 IhqtRXYeHRwOgY7oYB1rDrSVem7lFEsk596pXhi7Vv5Ix1k4qefVGEgvn6R/BztRs9Ot
 jD48kdH/FjZ8G9mLYg3oliafREXa3FtwP9fHpRIGLfWE5E0X50sxU6U/ihuPN8zC9O5o
 dqpw==
X-Gm-Message-State: ACgBeo3Dx5KYSLdHLWNFWon8sXrvcvYXxQuD3WsTfpw4etG+nJNlBQYS
 B9mrAQDY7FuSRuQ0SaJ3So4=
X-Google-Smtp-Source: AA6agR4d1E+ey3zbI4IF5ML3Se7af3AMcCPqfC/gvLIVoMIKs1/GntGKkkoyWx9ncFVYNz/6oOMyYg==
X-Received: by 2002:a17:902:a3c7:b0:172:8db4:cc54 with SMTP id
 q7-20020a170902a3c700b001728db4cc54mr3998176plb.99.1660705484047; 
 Tue, 16 Aug 2022 20:04:44 -0700 (PDT)
Received: from localhost ([36.112.86.8]) by smtp.gmail.com with ESMTPSA id
 r15-20020a17090a0acf00b001f559e00473sm279356pje.43.2022.08.16.20.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 20:04:43 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: kuba@kernel.org
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
Date: Wed, 17 Aug 2022 11:00:13 +0800
Message-Id: <20220817030013.6574-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816183930.2328d46d@kernel.org>
References: <20220816183930.2328d46d@kernel.org>
MIME-Version: 1.0
Cc: songliubraving@fb.com, kafai@fb.com, jakub@cloudflare.com,
 daniel@iogearbox.net, linux-kernel@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, ast@kernel.org, dhowells@redhat.com, edumazet@google.com,
 yin31149@gmail.com, netdev@vger.kernel.org, kpsingh@kernel.org, yhs@fb.com,
 bpf@vger.kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Wed, 17 Aug 2022 at 07:44, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 16 Aug 2022 22:16:46 +0100 David Howells wrote:
> > So either __rcu_dereference_sk_user_data_with_flags_check() has to be a macro,
> > or we need to go with something like the first version of my patch where I
> > don't pass the condition through.  Do you have a preference?
>
> I like your version because it documents what the lock protecting this
> field is.
In my opinion, I still think we'd better refactor it to a more
geniric function, to avoid adding new functions when meeting
the same problem. However, if this is just a standalone problem,
maybe David's version shoule be better.

So maybe apply the David's version, and refactor it later when
meeting the same problem next time if needed.

On Wed, 17 Aug 2022 at 08:43, Martin KaFai Lau <kafai@fb.com> wrote:
>
> On Tue, Aug 16, 2022 at 04:44:35PM -0700, Jakub Kicinski wrote:
> >
> > One the naming - maybe just drop the _with_flags() ? There's no version
> > of locked helper which does not take the flags. And not underscores?
> I am also good with a shorter name.
I also agree, the name is really long.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
