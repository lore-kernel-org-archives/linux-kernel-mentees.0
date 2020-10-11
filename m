Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BFEC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 07:00:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 970DB207FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 07:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUPXy/4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 970DB207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 17C592E2FA;
	Sun, 11 Oct 2020 07:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umvjONEzCJhI; Sun, 11 Oct 2020 07:00:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 25D482E2E6;
	Sun, 11 Oct 2020 07:00:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A45CC0052;
	Sun, 11 Oct 2020 07:00:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 471D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 07:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E3A38794B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 07:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7A9+LnTR0oa5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 07:00:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 77F18877E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 07:00:48 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id n2so15182480oij.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxnxXLDIipmSCP6Uy/DF0N+b/osWRzH6DD1j1CyTg4c=;
 b=FUPXy/4gx/BWgRiKv13sEMvhrRbq4b2KlsoZc19Ki7aPYBcc61QxsKeay8MsERnm02
 55PSDlHn8RppPGsEHouAvO+pIpfLqTu45cUqO7DvnGj/ZleyigNAOYtpgCs+nSBUEeV8
 5sgq2VT44BaRc4YOtS6PYHRpPNRObPG8hzpWN+sQtokLPfduEWXF6Ct0l72uUfij0xt8
 O+jjHA0hKFvvr3cuq6nTjbjp1SnJ9n8MDYNda2yIzW0/v2F4YSrBK3HF7RvGLLQYGZr2
 VomAVYINMgW2UhkZ9khowQeTcsKGD/Z+GlvlrGsEqiJQV25bZWYaopiHs7O3lG1JKiZ9
 Ga0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxnxXLDIipmSCP6Uy/DF0N+b/osWRzH6DD1j1CyTg4c=;
 b=B/rVBQfjwTEwDoSEg1JwrmyZWkseUC9qr+Z9zU30kheMz5XfJSRxZrPlBREp5nori0
 B2RAPmf5EDL2G0+CGGa1jlse6lWpplTonKELEWPPAnWET61rPObl9cwDvr87imxvOrV+
 rqNSOe8V9BSvxhXThEoTEsM0S317iWnkjznpk18GI7+i8PJ3+Rn5Mx0ipNORysh1gvjx
 VtIg7iCT4zk8pZz/53RAhk3dFpOL7JwXmu35+VvX+h3ms9DZxKmSQudexmlEFx/+jR9B
 lAD/nQHVsG4msuvIqhJLyIr2yan4CD5qusI1Ctcz1aI9lj4zu+ZwGi73J9vlx5s8lF8S
 wmIw==
X-Gm-Message-State: AOAM5309YHz232TNJ2xskpaMGnnlkcSQBMeUdL5t/bADx3lDpN9dAF3A
 VeGgOSfVIbZlkjjvCuUDdSDKP8qBtmfMK1m8BRk=
X-Google-Smtp-Source: ABdhPJzXD46w/UPkloq414pAqKYAK1ZqXaAil1l+ED8gjbsBKxbslpayzvKjtGR+Rwao72Vb4B8z3cSfIo3Pm/GO0kQ=
X-Received: by 2002:aca:b2d7:: with SMTP id b206mr7687736oif.110.1602399647474; 
 Sun, 11 Oct 2020 00:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201011064348.14015-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 11 Oct 2020 12:30:23 +0530
Message-ID: <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
	exceptions to repeated word check
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

On Sun, Oct 11, 2020 at 12:14 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> The repeated word check generated false positives for
> the following pattern:
>
> "git git://..."
>
> This resulted in lots of warnings in the MAINTAINERS file
> which shouldn't have been generated.
>
> Fixed this issue by adding "git" to the exception list
> for repeated word check.
>
> In addition, modified $word_pattern to capture words which
> may contain a single letter like "a".
> This ensures that repeated word warning in cases like
> "This is a a repetition" are also generated.
>
> Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
>
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 124ff9432b51..0ef75d2fb5cf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
>         ["__ATTR", 2],
>  );
>
> -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
>
>  #Create a search pattern for all these functions to speed up a loop below
>  our $mode_perms_search = "";
> @@ -3364,7 +3364,7 @@ sub process {
>                                 }
>
>                                 next if ($first ne $second);
> -                               next if ($first eq 'long');
> +                               next if ($first =~ /(?:long|git)$/);
>
>                                 if (WARN("REPEATED_WORD",
>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> --
> 2.27.0
>

One more additional improvement to this would be to make
comparison case neutral.

Like:

 -  next if ($first ne $second);
+  next if (lc($first) ne lc($second));

What do you think?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
