Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20ADC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:37:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516672222F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgQlXiQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516672222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AB4A877CE;
	Fri, 13 Nov 2020 13:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgpC+ZvsfRYu; Fri, 13 Nov 2020 13:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C84387484;
	Fri, 13 Nov 2020 13:37:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88004C0891;
	Fri, 13 Nov 2020 13:37:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D738C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 45619877CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Tktsl9hpzt2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:37:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F65C87484
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:37:38 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id l12so8509153ilo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 05:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AEhHlPj/3At4rCVZ3doELq0KCFho2fq+gmKFWZRtOg=;
 b=dgQlXiQwvn49c1XSyh36l4vM9pZju2BOLbscdwSdOal0jGc6FTarv0JsEF4lkjNQIF
 FcjPPyGdDnsVLEuqAaXMQKVs9PKiTr5lHNJuWKZzxehWH9v8alk5Ot0DAweMMu0yOY8T
 RvbLxGBKqCJED7/XwYaxAy0/bAMW/aUTHMtVzClSNbuLF9evRzag+Mr0rgWYQ+QS0myX
 DwcUsUOZ5z81bN+SWKNA/4lkZkeo7j/uaZdhyYFVlSNpxQDH1LzHVI3w+OS6UseCSvTl
 +F5iGivDimiNzDohAAsgGeP5LBMg7lY4nrjyzsIVrCpyTB/0nXkzCAxSV4xhvHMBrOdK
 QXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AEhHlPj/3At4rCVZ3doELq0KCFho2fq+gmKFWZRtOg=;
 b=gVvS6ZZ+P1XolMAMkcU7Ah6gaYbxswmQu7z83jX0BNQCjtmOgUuzlqPqJMO555gmP1
 /6OydCs4Bn7yflNHQb5kK4kJhIchA7ocgkZQgHR/rgyMFcb3nX2/POhq8lC5xJNj1rMx
 KpviEForyl+8mGL9hjbkEnng8MGzU1pPpb7oMDqvhUn5tsj8ULTzi8jLoxzUDFfR5TON
 ih1Fnuq7sJgwt9xBfREsCqn+o4EXONzGJVfjatZ2/Hg14FeXIO6GyhVOxeYT/BkAw3gn
 M01NeX4mcMRt1o4A8Ddyl7RfdbUgEeGn6Bj5Ax+Lh9Lo5COo5j+1i6j27Imm/+6UDpKC
 Ryuw==
X-Gm-Message-State: AOAM530Fyo979hKslRmIdF7EqiVOYDHBlLQCjcF5n0/1Fgtz0rL3VjMU
 blkrRZ4OgxIxi0B0q3V3DcBuPjD6iRaMwP7Ub4c=
X-Google-Smtp-Source: ABdhPJzQCeJxUjqNl8C6r8N8AYjiWiZWZGbj/CHsMl1PkqvObWlxXUxlDHxCG18m57Wf03t9oPyqdQPKIUi2krUTaP8=
X-Received: by 2002:a92:600e:: with SMTP id u14mr1734328ilb.221.1605274657789; 
 Fri, 13 Nov 2020 05:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113123101.29057-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201113123101.29057-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 13 Nov 2020 14:37:27 +0100
Message-ID: <CAKXUXMxS-hF=j8wbwzc4d3x_guaUPs+WH=pK_QAJPEHmxg=5vA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

On Fri, Nov 13, 2020 at 1:31 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Commit extraction in checkpatch fails in some cases.
> One of the most common false positives is a split line
> between "commit" and the git SHA of the commit.
>
> Improve commit handling to reduce false positives.
>
> Improvements:
> - handle split line between commit and git SHA of commit.
> - fix handling of split commit description.
>
> A quick evaluation of 50k commits from v5.4 showed that
> the GIT_COMMIT_ID errors dropped from 1032 to 897. Most
> of these were split lines between commit and its hash.
>

Can you send me the file of the evaluation, e.g., all contexts (two
lines above and two lines below) around the warned line in the commits
where the GIT_COMMIT_ID dropped?

Then, I can do a quick sanity check as well.

Lukas

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 024514946bed..f5ba2beac008 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2990,6 +2990,16 @@ sub process {
>                         if ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
>                                 $orig_desc = $1;
>                                 $hasparens = 1;
> +                       } elsif ($line =~ /^\s*[0-9a-f]{5,}\s+\("([^"]+)"\)/i &&
> +                                defined $rawlines[$linenr-2] &&
> +                                $rawlines[$linenr-2] =~ /\bcommit\s*$/i) {
> +                               $line =~ /^\s*[0-9a-f]{5,}\s+\("([^"]+)"\)/i;
> +                               $orig_desc = $1;
> +                               $hasparens = 1;
> +                               $space = 0;
> +                               $short = 0 if ($line =~ /\b[0-9a-f]{12,40}/i);
> +                               $long = 1 if ($line =~ /\b[0-9a-f]{41,}/i);
> +                               $case = 0 if ($line =~ /\b[0-9a-f]{5,40}[^A-F]/ && $rawlines[$linenr-2] =~ /\b[Cc]ommit\s*$/);
>                         } elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
>                                  defined $rawlines[$linenr] &&
>                                  $rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
> @@ -3001,7 +3011,9 @@ sub process {
>                                 $line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
>                                 $orig_desc = $1;
>                                 $rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
> -                               $orig_desc .= " " . $1;
> +                               my $split_desc = $1;
> +                               $split_desc = " $split_desc" if ($line =~ /[\w\,\.]$/);
> +                               $orig_desc .= $split_desc;
>                                 $hasparens = 1;
>                         }
>
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
