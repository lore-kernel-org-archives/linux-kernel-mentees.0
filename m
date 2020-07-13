Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5205C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 19:46:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10282068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 19:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvyteuH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B10282068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7B1712749A;
	Mon, 13 Jul 2020 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9CRU2BDzhYu; Mon, 13 Jul 2020 19:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B1FEC2535C;
	Mon, 13 Jul 2020 19:46:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8ED68C0888;
	Mon, 13 Jul 2020 19:46:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 324BAC0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29BF423B31
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sB3XrCIDlgGl
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:46:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id A9F722535C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 19:46:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z13so18062951wrw.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZXS7SPspEsDIKr84Gr8XUUMZoniRscoyAChgi6tI2uo=;
 b=pvyteuH+TjCtvRe38TMbZN08VxyMTMVPP3zbnnodjm9l5ljro/UQCnSs4/gx8h94Jz
 UPn20of8UZybJoA0rbM0DpXc/3dgZZa5LPeGBi5bWOb5KODleUbFfy39yvRSZby52LmY
 +K9iKcSkhtl2xqS4nKy06eG8gyf2tWtbSF1sEk4ZfCO0IkjzgN7xrrx5onMIyCncTlzn
 3kHjNBJjiXeuqJ1tWoRk9I2bt6E7d6a+9CgUjwL7AHZ093Cr0wg6jYveyLoGpfK/1x7d
 ilxEzLKYTvUdzR6S87Y+BKIlwQg8n2bRUqBb2iixOf2YBUPr1jjALUiY4OpvI0Glrmv7
 TwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZXS7SPspEsDIKr84Gr8XUUMZoniRscoyAChgi6tI2uo=;
 b=B2Vzb8WGJGo6NCwqekiS2OUr5sm26O6KZqGwpoEaYZH3/kTCIlWmUQpr1KQKbzBf0N
 dy1OxtP6hrx8bSxSU0NpF0abXQnH0i6iBAOihxpPxPyHE70wEsoSvHurx8jABi/ZISuL
 OAyToSLwPg6VmWedffAX+6c7PK936BaD0Zpa5YDibM1ftcwdvybFiGnf6S5jCGyzFh+v
 2RULxDHDtAaKbQ/32KFNof/yOVdPwAgMdJnCcP4k38sR5DfIeRpVhwwKQAUcZGV4VrFi
 rTt+or48bZGkUlvL1nr9LHUtMLzIhHkRWSRQemDOtGm6NHrIgS9XwND26IaqsZMkfzxC
 dYiw==
X-Gm-Message-State: AOAM533CA5HIkTkmmhhaB3tciicu7tNpDdvwbmGfaVySrEX+kMGfEgb4
 5KIL9/B7GZ1d7CNuDixJzG4=
X-Google-Smtp-Source: ABdhPJwfxCE/7mVnYk9Bem1xI8fDSjjc7EA89E8/7QFlWpdWsIa+/73BEubOyRfsqkhorbD7xts0qw==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr1168605wrm.271.1594669574116; 
 Mon, 13 Jul 2020 12:46:14 -0700 (PDT)
Received: from felia ([2001:16b8:2dae:2400:a50d:fbbf:27a0:1459])
 by smtp.gmail.com with ESMTPSA id 1sm808117wmf.21.2020.07.13.12.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:46:13 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 13 Jul 2020 21:46:12 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007132140160.11844@felia>
References: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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



On Mon, 13 Jul 2020, Mrinal Pandey wrote:

> In all the scripts, the SPDX license should be on the second line,
> the first line being the "sh-bang", but checkpatch issues a warning
> "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
> scripts that have SPDX license in the second line.
> 
> However, this warning is not issued when checkpatch is run on a file using
> `-f` option. The case for files has been handled gracefully by changing
> `$checklicenseline` to `2` but a corresponding check when running checkpatch
> on a commit hash is missing.
> 
> I noticed this false positive while running checkpatch on the set of
> commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
> a script file.
> 
> This check is missing in checkpatch since commit a8da38a9cf0e
> ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> when the corresponding rule was first commited.
> 
> Fix this by setting `$checklicenseline` to `2` when the diff content that
> is being checked originates from a script, thus, informing checkpatch that
> the SPDX license should be on the second line.
> 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..bbffd0c4449d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3218,6 +3218,9 @@ sub process {
>  		next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
>  
>  # check for using SPDX-License-Identifier on the wrong line number
> +		if ($realfile =~ /^scripts/) {
> +                    $checklicenseline = 2;
> +	        }

I think this is somehow wrong here. The check for checklicenseline = 2 
looks very different above.

Why does -f work and using a patch file not work?

Lukas


>  		if ($realline != $checklicenseline &&
>  		    $rawline =~ /\bSPDX-License-Identifier:/ &&
>  		    substr($line, @-, @+ - @-) eq "$;" x (@+ - @-)) {
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
