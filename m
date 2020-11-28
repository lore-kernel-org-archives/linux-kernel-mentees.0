Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F01C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 19:04:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD4020771
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 19:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw4VjAK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD4020771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9704E87FE2;
	Sat, 28 Nov 2020 19:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU4qBQBinZEI; Sat, 28 Nov 2020 19:04:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FCA087D24;
	Sat, 28 Nov 2020 19:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 471BCC163C;
	Sat, 28 Nov 2020 19:04:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D130C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F219887EC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6cq8qY-7kBI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F6A487D24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:04:54 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d8so12129481lfa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 11:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNduoI8qKkOaqH9OplqR6gXUvNyU96HOmEaMo4UKo28=;
 b=Fw4VjAK0k2f45/RyAk2L6rCTO70B40EJ4WLuGHfpk+S9nr7lGeetJhQoNpM/MM+Qfl
 xgy9F1GB6aSvrPTSWlh6mxHQSpaYn2wJodn3RNDEbkS3WtwLNltmvKXYjpuAx48dXwYq
 v8t+OSNz4LWPKAYf1OUS04kUV4SitUoIbQ36p4POV3m9j9/S1tpj+t9z9HRT1+LRkX23
 p07a9KqESn7T0K093YAZf0JZyjSQh39yKHa6w4Bfnkngo0C89SiBdrbpYDgCO/1+1mXY
 2BYLTWgP+oX90p9BbyYVUHalhlt/Ioph1gXtq/L2obhvYukSdfoo144SvYkQ7yswXV9m
 g+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNduoI8qKkOaqH9OplqR6gXUvNyU96HOmEaMo4UKo28=;
 b=bfO1lTKA2mYUrui7Mrvh694GD7pfgo+R3zNMhOTyCL9dH1VRgDfMGmz05EH+sgbUUk
 GgTR6gUMXKK7fokQCXEnNXMqmSHe+iJudtysG+XCA1Gl4e6rn1/oY0mSM2PM6Cb+CmOH
 60QH/lQDlTIixP5WrXl5o1Gruy+cnCiw9PTU4vspUsjctE4vBR5xo/Op/J/I/P4a+lhF
 FpZtb+6Tt6L7keSc0z8N6Hjv6fhBh94byOEfweIEaJqx7Mr5N6T2reV5+DLLeplBTOuR
 5lOc4xoi3oxGZWohF0DN/xJC6VqTKjTzHs8uR3DJgeqxAfbQsIY8i1wsgYkjhowzSja8
 1Cmg==
X-Gm-Message-State: AOAM530wktdluMYVoJyqChIYibDviE7l1FuL8X4TPUqNRSss0y62zxXf
 ws16fagseD0grWHWlWHLyLCDVgAzRPN5rqOD8Fk=
X-Google-Smtp-Source: ABdhPJwT9+uvMLE6epWApcdZ1uhE14NXm3aK/qKbLRVPvaGFy3VqUEOPbnSZ2ZV642WtZIxrVQ7fuAps1M2gqjpK48Y=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr5985287lfh.148.1606590292006; 
 Sat, 28 Nov 2020 11:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20201128173850.66509-1-dwaipayanray1@gmail.com>
 <55d38c770a3316a3c67f5380ffb8ed37540900da.camel@perches.com>
In-Reply-To: <55d38c770a3316a3c67f5380ffb8ed37540900da.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 29 Nov 2020 00:34:40 +0530
Message-ID: <CABJPP5AodovE61WiEup_191pVwptEzg8sVuG6QxeMVbM94wpNw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
 unnecessary use of %h[xudi] and %hh[xudi]
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

> Here was what I tried:
>
> There are uses like %#06hh", so # was addedto the format block
> and multiple line uses were also inspected.
>
>
>  scripts/checkpatch.pl | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..b985b6b37ba8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6027,6 +6027,29 @@ sub process {
>                              "Avoid logging continuation uses where feasible\n" . $herecurr);
>                 }
>
> +# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functions
> +               if (defined $stat &&
> +                   $line =~ /\b$logFunctions\s*\(/ &&
> +                   index($stat, '"') >= 0) {
> +                       my $lc = $stat =~ tr@\n@@;
> +                       $lc = $lc + $linenr;
> +                       my $stat_real = get_stat_real($linenr, $lc);
> +                       pos($stat_real) = index($stat_real, '"');
> +                       my $lineoff = substr($stat_real, 0, pos($stat_real)) =~ tr/\n//;
> +                       while ($stat_real =~ /[^"%]*(%[#\d\.\*\-]*(h+)[idux])/g) {
> +                               my $pspec = $1;
> +                               my $h = $2;
> +                               if (WARN("UNNECESSARY_MODIFIER",
> +                                        "Integer promotion: '$h' use in '$pspec' is unnecessary\n" . "$here\n$stat_real\n") &&
> +                                   $fix &&
> +                                   $fixed[$fixlinenr + $lineoff] =~ /^\+/) {
> +                                       my $nspec = $pspec;
> +                                       $nspec =~ s/h//g;
> +                                       $fixed[$fixlinenr + $lineoff] =~ s/\Q$pspec\E/$nspec/;
> +                               }
> +                       }
> +               }
> +
>  # check for mask then right shift without a parentheses
>                 if ($perl_version_ok &&
>                     $line =~ /$LvalOrFunc\s*\&\s*($LvalOrFunc)\s*>>/ &&
>

Thanks, I will modify the block according to this and send it back to you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
