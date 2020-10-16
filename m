Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8ECC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 18:22:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B982076A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 18:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbsyyuWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B982076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0623C88D33;
	Fri, 16 Oct 2020 18:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTgX6WFB61h5; Fri, 16 Oct 2020 18:22:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7923087B72;
	Fri, 16 Oct 2020 18:22:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 491CBC07FF;
	Fri, 16 Oct 2020 18:22:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2881BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 107E988D33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oamk3B5CgMkB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 62A4087B72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:22:46 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u17so3462287oie.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2vom37JljnkaIu4AwQH50qvUpccp/u0DY8lAVgCFA/A=;
 b=WbsyyuWRVDWUp81rZqaK6dfN7vBM4uRTUAxy9st+COmEbgKOpxIaWOLQKfd0Q+NyrZ
 WiqbPFagwGk1+eXZ9qKdUY1Wd5z0n4fyEr3lmT6mwRduaA6cwtNJfUUC8GWceztOr70I
 UtJjJDaG/vheL7SieOemd/YEVwbaq/wgckJaECrhl4WupZwTKESs8i0qSXrDE19NcE2b
 8lFWJh3ahEXro4djFkqkgQ8GUeuhr6X37GRXcjbt5AvxUzoUKw+u5/X0rPHUo8D62CRf
 lHGBl4bhuUgkqTqnQ917qiOXTLQIji14OYiS78srk4Wynjgl9FXiR/MLZFm4++usXa1p
 BsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2vom37JljnkaIu4AwQH50qvUpccp/u0DY8lAVgCFA/A=;
 b=tYqeckWWSepDFZaDzqD1id2KlJ1zMrsX5Tabrisj5ETazNHVftDtlmYaPbwXPwPr9Z
 nRy7scQ/JrU4lzhbcdDojZMEv8R5hbPkOwtkacdGvqGgcGghwCxrHtWBKJaWv8vpodW+
 tpK8JkdRK/zTMHGaJaStMhKEKtGHRzDmXue5Wm2xRE4+Hy6lgN9oqybUSNGtTOhJyBE/
 rKAcIU+sjIDjXfsYk3aNF1QBKeoaaNOEnoEE196UJTduFYie4EN9doCzKv2Bvvvn41X5
 lfYpSIvi28TTjbWYQDgKW5baO+wo6Ws4cWIrqlO1SexfNONVonKCGvMrp1Fz5XjUt5fi
 AYsQ==
X-Gm-Message-State: AOAM533hRtXnNT2zwqnLGoKpYX+CjlfmVHLuCXKx1Kaw3pHMSaNWfEMq
 1TOL5cmIEuxU++uj/tBQzErkYdb4esMiyD+eRpk=
X-Google-Smtp-Source: ABdhPJzXm8iofX+8W3xE/uPnh5/TTOmYX9ApaTIfG03M7+1ZWDdzpQW5yfrGVuyXb+NMcOWHZDkiiv88+IWeaRxhij8=
X-Received: by 2002:aca:420a:: with SMTP id p10mr3213468oia.117.1602872565404; 
 Fri, 16 Oct 2020 11:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201016181613.129843-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201016181613.129843-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 16 Oct 2020 23:52:18 +0530
Message-ID: <CABJPP5AwiEQNypApE_5svF6Rqb3YU=cZ_=V+KW494uC_LHDMXg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new exceptions
	to repeated word check
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

On Fri, Oct 16, 2020 at 11:46 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> moved the repeated word test to check for more file types. But after
> this, if checkpatch.pl is run on MAINTAINERS, it generates several
> new warnings of the type:
>
> WARNING: Possible repeated word: 'git'
>
> For example:
> WARNING: Possible repeated word: 'git'
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git
>
> So, the pattern "git git://..." is a false positive in this case.
>
> There are several other combinations which may produce a wrong
> warning message, such as "@size size", "Begin; begin", etc.
>
> Extend repeated word check to compare the characters before and
> after the word matches. If the preceding or succeeding character
> belongs to the exception list, the warning is avoided.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f1a4e61917eb..82497a71ac96 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -595,6 +595,7 @@ our @mode_permission_funcs = (
>  );
>
>  my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> +my $punctuation_chars = '[,:;@\.\-]';
>
>  #Create a search pattern for all these functions to speed up a loop below
>  our $mode_perms_search = "";
> @@ -3065,6 +3066,21 @@ sub process {
>                                 next if ($first ne $second);
>                                 next if ($first eq 'long');
>
> +                               # check for character before and after the word matches
> +                               my $ca_first = substr($rawline, $-[1]-1, 1);
> +                               my $cb_first = substr($rawline, $+[1], 1);
> +                               my $ca_second = substr($rawline, $-[2]-1, 1);
> +                               my $cb_second = substr($rawline, $+[2], 1);
> +
> +                               if ($ca_first ne $ca_second || $cb_first ne $cb_second) {
> +                                       if ($ca_first =~ /$punctuation_chars/ ||
> +                                           $ca_second =~ /$punctuation_chars/ ||
> +                                           $cb_first =~ /$punctuation_chars/ ||
> +                                           $cb_second =~ /$punctuation_chars/) {
> +                                               next;
> +                                       }
> +                               }
> +
>                                 if (WARN("REPEATED_WORD",
>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
>                                     $fix) {
> --
> 2.27.0
>
Hi,
This patch is followed from the discussion at
https://lore.kernel.org/linux-kernel-mentees/7d8c7d80aa7b0524cca49a6dfe24e878bea6ab12.camel@perches.com/
, where Joe suggested that instead of hard coding the
particular words, we can check the surrounding
characters instead for punctuations and ingore them.

Please let me know if any changes are needed.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
