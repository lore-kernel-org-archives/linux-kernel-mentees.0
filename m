Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89547C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 20:20:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5C622276
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 20:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiGJIZxt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C5C622276
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9BE61869D5;
	Sat, 24 Oct 2020 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M+TOBK-AVEVG; Sat, 24 Oct 2020 20:20:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EFB786990;
	Sat, 24 Oct 2020 20:20:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DEBCC088B;
	Sat, 24 Oct 2020 20:20:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3540EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 20:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 31449872F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 20:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnRY0G0BZ7-6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 20:20:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FC3087267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 20:20:42 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u17so6342175oie.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VG0Yc/GlRSlgn6rbhnDixnyqF/KHMumMevzsRNu/XRA=;
 b=CiGJIZxtm4Ivj7gUdpRMEJE8/XhDFWdkcF6CaKL076yEJKuUtouOaz71Qvb0OTWMzb
 3FMepYAE8EaL/m6DfVEis1icUbho+fr0mpPH8fgYHrkbo6zlVjBCUjlYYdOc19TbN4P1
 CSgcQkpfO20DiCvGMPwOcKK4Ve7Z+hBjH8/wXwuaZOgUJ8dmwAH/kBKls5xokiIlkTGt
 nI+RcwbC22U5iCkxZvFilKEzJPa7cyOJc0oGONB5vvYpYORLo+uIt0QMz8efxjMx4CZi
 jB6jiV0rpNp8OP7TWveRbQlsJQ8sSEMOU6/3HYjjqAcR9wPMAGA628qFW4iix8sTnwSL
 O42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VG0Yc/GlRSlgn6rbhnDixnyqF/KHMumMevzsRNu/XRA=;
 b=INp7mUprSphi2yWwGX4LVrHe/1cq/cqNRSWLUQfM1OjEq0akXFgd+7M9Lb6b6r5Cyg
 EhyfCfUnhT8e8Ga7sjrwTgUVtg+nvxezomG5MWEm2cibxZ1bli1L9RCS9+57JLJbcqX2
 sQdV9038IwXL2Fdq5pCzFJM3bvKgWPihhO7T1Rej87URxIbPa3zBol0AhaOgNZcjHXT0
 tmaR9b0uGYXy2PKITAZHKAHmU/hfCff6aN91mQXAe0uOXMoxtmwcYjuEaE0CAVhbiVgS
 Rstvy4b4HkgwKvnbLKwmpR2wPtsTZtplkZS9O+WVkhiYCSv1pCVcA/JgGItX2daMLKY5
 EIWg==
X-Gm-Message-State: AOAM532AzkqR7kl8Ee+VCkwQCuVR39Skpqhi/KuehTQ+FReuNO2T7v2/
 MQOsIBk7eab+WQ+l894hBsQFopcwhOEFh5W1JUM=
X-Google-Smtp-Source: ABdhPJyHjPrEKBTi1fy3q/eFBSSVUjWLnk8yqoNO9OkvyEAfWwXwKUn6YXtwvDySdHHzXHW5gFCjVF06KdyDIz+7Zho=
X-Received: by 2002:aca:2101:: with SMTP id 1mr7430348oiz.110.1603570841059;
 Sat, 24 Oct 2020 13:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201024090557.45092-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201024090557.45092-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 01:50:11 +0530
Message-ID: <CABJPP5AoeDvRRe0WGReHTXqgzSe1=3_iz=jtpRiHp1BiMc6=kw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: extend attributes
	check to handle more patterns
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

On Sat, Oct 24, 2020 at 2:36 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> It is generally preferred that the macros from
> include/linux/compiler_attributes.h are used, unless there
> is a reason not to.
>
> checkpatch currently checks __attribute__ for each of
> packed, aligned, printf, scanf, and weak. Other declarations
> in compiler_attributes.h are not handled.
>
> Add a generic test to check the presence of such attributes.
> Some attributes require more specific handling and are kept
> separate.
>
> New attributes which are now handled are:
>
> __alias__(#symbol)
> __always_inline__
> __assume_aligned__(a, ## __VA_ARGS__)
> __cold__
> __const__
> __copy__(symbol)
> __designated_init__
> __externally_visible__
> __gnu_inline__
> __malloc__
> __mode__(x)
> __no_caller_saved_registers__
> __noclone__
> __fallthrough__
> __noinline__
> __nonstring__
> __noreturn__
> __pure__
> __unused__
> __used__
>
> Link: https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 105 +++++++++++++++++++++++++++---------------
>  1 file changed, 69 insertions(+), 36 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7e505688257a..01d83d345b4c 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6155,50 +6155,83 @@ sub process {
>                         }
>                 }
>
> -# Check for __attribute__ packed, prefer __packed
> +# Check for compiler attributes
>                 if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
> -                       WARN("PREFER_PACKED",
> -                            "__packed is preferred over __attribute__((packed))\n" . $herecurr);
> -               }
> +                   $line =~ /__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
> +                       my $attr = $1;
> +                       $attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
> +
> +                       my %attr_list = (
> +                               "alias"                         => "__alias",
> +                               "aligned"                       => "__aligned",
> +                               "always_inline"                 => "__always_inline",
> +                               "assume_aligned"                => "__assume_aligned",
> +                               "cold"                          => "__cold",
> +                               "const"                         => "__const",
> +                               "copy"                          => "__copy",
> +                               "designated_init"               => "__designated_init",
> +                               "externally_visible"            => "__visible",
> +                               "fallthrough"                   => "fallthrough",
> +                               "gnu_inline"                    => "__gnu_inline",
> +                               "malloc"                        => "__malloc",
> +                               "mode"                          => "__mode",
> +                               "no_caller_saved_registers"     => "__no_caller_saved_registers",
> +                               "noclone"                       => "__noclone",
> +                               "noinline"                      => "noinline",
> +                               "nonstring"                     => "__nonstring",
> +                               "noreturn"                      => "__noreturn",
> +                               "packed"                        => "__packed",
> +                               "pure"                          => "__pure",
> +                               "used"                          => "__used"
> +                       );
> +
> +                       if ($attr =~ /^(\w+)\s*(${balanced_parens})?/) {
> +                               my $curr_attr = $1;
> +                               my $params = '';
> +                               $params = $2 if defined($2);
> +                               $curr_attr =~ s/^[\s_]+|[\s_]+$//g;
> +
> +                               if (exists($attr_list{$curr_attr})) {
> +                                       my $new = $attr_list{$curr_attr};
> +                                       WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +                                            "$new$params is preffered over __attribute__(($attr))\n" . $herecurr);
> +                               }
> +                       }
>
> -# Check for __attribute__ aligned, prefer __aligned
> -               if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
> -                       WARN("PREFER_ALIGNED",
> -                            "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
> -               }
> +                       # Check for __attribute__ format(printf, prefer __printf
> +                       if ($attr =~ /^_*format_*\s*\(\s*printf/) {
> +                               if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +                                        "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
>
> -# Check for __attribute__ section, prefer __section
> -               if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(.*_*section_*\s*\(\s*("[^"]*")/) {
> -                       my $old = substr($rawline, $-[1], $+[1] - $-[1]);
> -                       my $new = substr($old, 1, -1);
> -                       if (WARN("PREFER_SECTION",
> -                                "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
> -                           $fix) {
> -                               $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
> +                               }
>                         }
> -               }
>
> -# Check for __attribute__ format(printf, prefer __printf
> -               if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf/) {
> -                       if (WARN("PREFER_PRINTF",
> -                                "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
> -                           $fix) {
> -                               $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
> +                       # Check for __attribute__ format(scanf, prefer __scanf
> +                       if ($attr =~ /^_*format_*\s*\(\s*scanf\b/) {
> +                               if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +                                        "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
> +                               }
> +                       }
>
> +                       # Check for __attribute__ section, prefer __section
> +                       if ($attr =~ /^_*section_*\s*\(\s*("[^"]*")/) {
> +                               my $old = substr($rawline, $-[1], $+[1] - $-[1]);
> +                               my $new = substr($old, 1, -1);
> +                               if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +                                        "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
> +                               }
>                         }
> -               }
>
> -# Check for __attribute__ format(scanf, prefer __scanf
> -               if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\b/) {
> -                       if (WARN("PREFER_SCANF",
> -                                "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
> -                           $fix) {
> -                               $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
> +                       # Check for __attribute__ unused, prefer __always_unused or __maybe_unused
> +                       if ($attr =~ /^_*unused/) {
> +                               WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +                                    "__always_unused or __maybe_unused is preferred over __attribute__((__unused__))\n" . $herecurr);
>                         }
>                 }
>
> --
> 2.27.0
>
Hi,
In this version there is only one generic test for both parameterized
and non parameterized attributes.

And four attribute checks are kept separate and unaltered from the
original implementation. Those are the format(printf/scanf), section
and unused(which can be resolved to __always_unused or __maybe_unused).

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
