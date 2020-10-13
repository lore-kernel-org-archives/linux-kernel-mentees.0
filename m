Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9185AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 05:21:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E381120872
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 05:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwIk7N+S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E381120872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D2F6879A2;
	Tue, 13 Oct 2020 05:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fe+hCJgSU9Dt; Tue, 13 Oct 2020 05:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 269D0879A3;
	Tue, 13 Oct 2020 05:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07092C07FF;
	Tue, 13 Oct 2020 05:21:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E212CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C9793879A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI8NYe0kSeBt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CBB43879A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:21:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h5so12295904wrv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 22:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=peSFniKnlhqXrsoOzqfy6P6ubn9O/3V+k6qm3EJkahA=;
 b=WwIk7N+SVovf9keLC57B/d6rnhT8TEq5EQTt391PMaE1j2Rt/ND/1y0lNXUkh2QpF0
 ijLgQvWo4oME1PUqvuJiSc9uS0MPCh8sXvvUMJDVG/LlYeAepezw5pRHAJBJjTHpKo4I
 JX4Eqcs4iNkCCmI3mj/qKq9NV2qDXtrBt/YDnpAgWb1ywiFTvZQjVKq7Y1YSHSYRPUqb
 a3vKvGqb721CGk5xJfFZzAG3NemzlqQClxuTfM8qg7XQGs5yO0gjzfCuURJfPqVDbJAr
 OZzGHeAmmxvC+9ddY9SmGGYfRi16g1ptwGB7BbVIFLe7vtUxGHjKoOKHzm+RbEXIcaM/
 vv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=peSFniKnlhqXrsoOzqfy6P6ubn9O/3V+k6qm3EJkahA=;
 b=F/kfFYQ3CtNQtRuO1Ah2mQyMAdRkJBo1Bunpw3jjFZf/FbbQKyx+YkfNdwLV3hAPWd
 iLGDSoFN9OyR9h0XeBq74WlRl9wYxw4yodnOqd/WVe1k9qKM0kTNB/jlGb4K6eniLFxM
 0ezbEJLog/0k/lFCGp5ZXYfFiC11IBzfKpsWvmxo4Y018La07eJxp+L+sMFkZifyh2J8
 fmlDgFR1Q+Qyt37dRPxHXvZhx8HURiXmbfxDGjrZTHuqBvvONoq8C5GFi3UUI2UpTr8p
 B/E5Bqn/rnGzi9o6mnXucS4Kg69ooZdfK2ZNcW4zKHpStbaFrz2xDNuUFZcIwM3ZLrvo
 4d6A==
X-Gm-Message-State: AOAM5326f2YSmOXvXwKAnsBUG+xc5LA3HzU+yAg+Q6baovOf+3vbIj0X
 7A4xwIvtpi+xTnUlxJx7KQM=
X-Google-Smtp-Source: ABdhPJwc8MiRki/HiIyXz1WlwpkpBj9HS3pyyQi4jPFjnpzjXGmDSKy28ekf6BJ227ka93ShroUHtg==
X-Received: by 2002:adf:e685:: with SMTP id r5mr36240207wrm.340.1602566506084; 
 Mon, 12 Oct 2020 22:21:46 -0700 (PDT)
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
 by smtp.gmail.com with ESMTPSA id u195sm3479858wmu.18.2020.10.12.22.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 22:21:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 07:21:37 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20201013034307.5520-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010130717490.14590@felia>
References: <20201013034307.5520-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix missing
	whitespace in formatted email
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



On Tue, 13 Oct 2020, Dwaipayan Ray wrote:

> commit 0c01921 ("checkpatch: add new warnings to author signoff checks.")

s/commit/Commit/

you should have a 12-char sha here.

Did you checkpatch.pl your patch?

> introduced new checks for author sign off. The format_email procedure
> was modified to add comment blocks to the formatted email. But no
> space was added between email address and the mail comment.
> 
> This caused issues in some cases where the email was in the form

Can you be more specific than "Caused issues"?

Use present tense.

> of "author@example.com (Comment block)". The formatted email removed
> the space at the end of address.
> 
> An evaluation on checkpatch brought up this case. For example,
> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
> the following warning was reported:
> 
> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> system concerns)' might be better as 'David.Laight@aculab.com(big endian
> system concerns)'
> 
> Resolved this by adding a single space in between the address and comment
> when the extracted comment is not empty.
>

Use imperative.

Maybe you add a Fixes: tag referring to the original commit?

 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 124ff9432b51..6000addf1af3 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1201,7 +1201,9 @@ sub format_email {
>  	} else {
>  		$formatted_email = "$name$name_comment <$address>";
>  	}
> -	$formatted_email .= "$comment";
> +	if ("$comment" ne "") {
> +		$formatted_email .= " $comment";
> +	}
>  	return $formatted_email;
>  }
>  
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
