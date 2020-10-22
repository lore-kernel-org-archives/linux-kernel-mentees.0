Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57B7C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 15:00:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437BB24630
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 15:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7FBAVaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 437BB24630
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 990548782D;
	Thu, 22 Oct 2020 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1g7p6LxqbCD3; Thu, 22 Oct 2020 15:00:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61FD48744D;
	Thu, 22 Oct 2020 15:00:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A456C0052;
	Thu, 22 Oct 2020 15:00:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD2F4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C68BE8782D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i58qzrcp22FJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:00:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 64B628744D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:00:03 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e20so1727307otj.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Na6bxm+chNgXOcwmPypF257p4yeLALEUdxQCMprVnTQ=;
 b=F7FBAVaQOXFEOmb952HzKh6W2Kf9/TepWkQCOiSLmJnlzVWdr160wD8dUzQD3qIikR
 gXOeYltacN4lak71MuPkpUlaRvl2oJcgcCiymko+VQOFhcMSKhFBCjY0+Jjun8RPf/Wb
 DKkcrSfyWJgVOidRXJ/Mmr7Q4mlp+386se9V/2cbu7+BAuamniLM6FG8sccA4zzZbbIo
 nBAHy29Umx+i4KZIqKbyxpJ4fhZ5XueOUq0lRLuhuAAyRPRmaQnuTYQW28qO/GTbgat1
 g+SYELUTPuf7nl780nLZScilRZOWv2VvMiE5S/In9m92PmVOXoc3CRykglZCk2Xdv+r1
 /Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Na6bxm+chNgXOcwmPypF257p4yeLALEUdxQCMprVnTQ=;
 b=WEaH7Ok8sLsMafxPOv/3HoReLmEm0R27+cjbOw3rJQ3P6sC8tXXfNvaOAqb3IO/KRn
 1xaVh0xHPuS+DwweHL+z3Z48MCDdpoJGFVFyS5P10ESMa+JqBTyilZK1mZVC9rGIqVZ9
 30WiiPFbb7g6CN4smoOwIsoq1ZhqOCHqJ1XM7DfhtbPk7tr6MA92edqHbjLcrf/hiRuU
 kQ9rjp6JP+cN2s3Te7Sju0LgnC6DK1FXCfBcPmx9XxvjSraVpYsEAlyhIAivimmQXL8I
 B8itApXgfcJM/fBHNGxuFfyKT/tS5ezxfhLYgivz28xWXeydFGJq9cN5T1dYrVkwU75U
 uyNA==
X-Gm-Message-State: AOAM531E5OxR0dEzziFlDWxA6GvuN6VlEYf4/q+8P+t4H2/b0F4dCbq6
 Dq+qCwK0hUBEhHR2mT1ZgxXow8IbnnAvIzGTSyk=
X-Google-Smtp-Source: ABdhPJw+8r14rZtHIKwQLmsfTmrgWRlNjVUcEUW6qy/L8iV33GVB0yyieJKJpJoaMVh/rbbrvxnEmwWbWQOls25/+4k=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr2019577oth.215.1603378802137; 
 Thu, 22 Oct 2020 08:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201022145224.645538-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201022145224.645538-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 22 Oct 2020 20:29:32 +0530
Message-ID: <CABJPP5AQwRkT_2FozYxgTgUZ2RWS=k1TNN_QOvs6F5se-V-6ow@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
	attributes check to handle more patterns
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

On Thu, Oct 22, 2020 at 8:22 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> It is generally preferred that the macros from
> include/linux/compiler_attributes.h are used, unless there
> is a reason not to.
>
> Checkpatch currently checks __attribute__ for each of
> packed, aligned, printf, scanf, and weak. Other declarations
> in compiler_attributes.h are not handled.
>
> Add more definitions to the attribute check.
> The following patterns are added:
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
>  scripts/checkpatch.pl | 199 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 163 insertions(+), 36 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7e505688257a..968adcb15793 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6155,50 +6155,177 @@ sub process {
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
> +                   $line =~ /\b__attribute__\s*\(\s*\((.*)\)\s*\)/) {
> +                       my $attr = trim($1);
>
> -# Check for __attribute__ aligned, prefer __aligned
> -               if ($realfile !~ m@\binclude/uapi/@ &&
> -                   $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
> -                       WARN("PREFER_ALIGNED",
> -                            "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
> -               }
> +                       # Check for __attribute__ alias, prefer __alias
> +                       if ($attr =~/^_*alias_*/) {
> +                               WARN("PREFER_ALIAS",
> +                                    "__alias(symbol) is preferred over __attribute__((alias(#symbol)))\n" . $herecurr);
> +                       }
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
> +                       # Check for __attribute__ aligned(size), prefer __aligned(size)
> +                       if ($attr =~/^_*aligned_*\(/) {
> +                               WARN("PREFER_ALIGNED",
> +                                    "__aligned(size) is preferred over __attribute__((__aligned__(size)))\n" . $herecurr);
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
> +                       # Check for __attribute__ aligned, prefer __aligned_largest
> +                       if ($attr =~/^_*aligned_*$/) {
> +                               WARN("PREFER_ALIGNED_LARGEST",
> +                                    "__aligned_largest is preferred over __attribute__((__aligned__))\n" . $herecurr);
> +                       }
>
> +                       # Check for __attribute__ always_inline, prefer __always_inline
> +                       if ($attr =~/^_*always_inline_*/) {
> +                               WARN("PREFER_ALWAYS_INLINE",
> +                                    "__always_inline is preferred over __attribute__((__always_inline__))\n" . $herecurr);
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
> +                       # Check for __attribute__ assume_aligned, prefer __assume_aligned
> +                       if ($attr =~/^_*assume_aligned_*/) {
> +                               WARN("PREFER_ASSUME_ALIGNED",
> +                                    "__asume_aligned(a, ...) is preferred over __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ cold, prefer __cold
> +                       if ($attr =~ /^_*cold_*/) {
> +                               WARN("PREFER_COLD",
> +                                    "__cold is preferred over __attribute__((__cold__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ const, prefer __attribute_const
> +                       if ($attr =~ /^_*const_*/) {
> +                               WARN("PREFER_CONST",
> +                                    "__attribute_const is preferred over __attribute__((__const__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ copy, prefer __copy
> +                       if ($attr =~ /^_*copy_*/) {
> +                               WARN("PREFER_COPY",
> +                                    "__copy(symbol) is preferred over __attribute__((__copy__(symbol)))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ desginated_init, prefer __designated_init
> +                       if ($attr =~ /^_*designated_init_*/) {
> +                               WARN("PREFER_DESIGNATED_INIT",
> +                                    "__designated_init is preferred over __attribute__((__designated_init__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ externally_visible, prefer __visible
> +                       if ($attr =~ /^_*externally_visible_*/) {
> +                               WARN("PREFER_VISIBLE",
> +                                    "__visible is preferred over __attribute__((__externally_visible__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ format(printf, prefer __printf
> +                       if ($attr =~ /^_*format_*\s*\(\s*printf/) {
> +                               if (WARN("PREFER_PRINTF",
> +                                        "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
> +
> +                               }
> +                       }
> +
> +                       # Check for __attribute__ format(scanf, prefer __scanf
> +                       if ($attr =~ /^_*format_*\s*\(\s*scanf\b/) {
> +                               if (WARN("PREFER_SCANF",
> +                                        "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
> +                               }
> +                       }
> +
> +                       # Check for __attribute__ gnu_inline, prefer __gnu_inline
> +                       if ($attr =~ /^_*gnu_inline_*/) {
> +                               WARN("PREFER_GNU_INLINE",
> +                                    "__gnu_inline is preferred over __attribute__((__gnu_inline__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ malloc, prefer __malloc
> +                       if ($attr =~ /^_*malloc_*/) {
> +                               WARN("PREFER_MALLOC",
> +                                    "__malloc is preferred over __attribute__((__malloc__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ mode, prefer __mode
> +                       if ($attr =~ /^_*mode_*/) {
> +                               WARN("PREFER_MODE",
> +                                    "__mode(x) is preferred over __attribute__((__mode__(x)))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ no_caller_saved_registers, prefer __no_caller_saved_registers
> +                       if ($attr =~ /^_*no_caller_saved_registers_*/) {
> +                               WARN("PREFER_NO_CALLER_SAVED_REGISTERS",
> +                                    "__no_caller_saved_registers is preferred over __attribute__((__no_caller_saved_registers__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ noclone, prefer __noclone
> +                       if ($attr =~ /^_*noclone_*/) {
> +                               WARN("PREFER_NOCLONE",
> +                                    "__noclone is preferred over __attribute__((__noclone__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ fallthrough, prefer fallthrough
> +                       if ($attr =~ /^_*fallthrough_*/) {
> +                               WARN("PREFER_FALLTHROUGH",
> +                                    "fallthrough is preferred over __attribute__((__fallthrough__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ noinline, prefer noinline
> +                       if ($attr =~ /^_*noinline_*/) {
> +                               WARN("PREFER_NOINLINE",
> +                                    "noinline is preferred over __attribute__((__noinline__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ nonstring, prefer __nonstring
> +                       if ($attr =~ /^_*nonstring_*/) {
> +                               WARN("PREFER_NONSTRING",
> +                                    "__nonstring is preferred over __attribute__((__nonstring__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ noreturn, prefer __noreturn
> +                       if ($attr =~ /^_*noreturn_*/) {
> +                               WARN("PREFER_NORETURN",
> +                                    "__noreturn is preferred over __attribute__((__noreturn__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ packed, prefer __packed
> +                       if ($attr =~ /^_*packed_*/) {
> +                               WARN("PREFER_PACKED",
> +                                    "__packed is preferred over __attribute__((__packed__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ pure, prefer __pure
> +                       if ($attr =~ /^_*pure_*/) {
> +                               WARN("PREFER_PURE",
> +                                    "__pure is preferred over __attribute__((__pure__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ section, prefer __section
> +                       if ($attr =~ /^_*section_*\s*\(\s*("[^"]*")/) {
> +                               my $old = substr($rawline, $-[1], $+[1] - $-[1]);
> +                               my $new = substr($old, 1, -1);
> +                               if (WARN("PREFER_SECTION",
> +                                        "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
> +                               }
> +                       }
> +
> +                       # Check for __attribute__ unused, prefer __always_unused or __maybe_unused
> +                       if ($attr =~ /^_*unused_*/) {
> +                               WARN("PREFER_UNUSED",
> +                                    "__always_unused or __maybe_unused is preferred over __attribute__((__unused__))\n" . $herecurr);
> +                       }
> +
> +                       # Check for __attribute__ used, prefer __used
> +                       if ($attr =~ /^_*used_*/) {
> +                               WARN("PREFER_USED",
> +                                    "__used is preferred over __attribute__((__used__))\n" . $herecurr);
>                         }
>                 }
>
> --
> 2.27.0
>
Hi,
This patch is meant to add handling of more __attribute__ shorthands
from include/linux/compiler_attributes.h.

I am a bit worried about the code size though. Is it better altogether
to have a shared function for parameterized/non parameterized
__attribute__ arguments? Might have to categorize the macros then.

What do you think is better?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
