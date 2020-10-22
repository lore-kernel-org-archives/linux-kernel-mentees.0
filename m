Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606D1C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 12:58:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A7322267
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 12:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmY4QHGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A7322267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EEB8420656;
	Thu, 22 Oct 2020 12:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3AAsN9sWuao; Thu, 22 Oct 2020 12:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D97E720463;
	Thu, 22 Oct 2020 12:58:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9058C0052;
	Thu, 22 Oct 2020 12:58:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51C80C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3295D204F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGnwwrayrUZa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A081A20463
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:58:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id m128so1592196oig.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJ9ZJV6ixhrbH7SZAXvOT7PvKrJof79KxlrcHClSPG4=;
 b=nmY4QHGVckv5woUuDVL/kdkzp33E3xNhQUkERsOT+SNYAICFUXCQUAjDeWVhQNCGoz
 h4oLYAdnSTOSFzIlqPcCd6TYE3H3Fad6O7SCZ3J6BNV9qDwKtF5DexUM+vdEvj3PpWQF
 P392y4vCedGJL21QWkjz+ObO2BYZJTVLTVx5BpMT2dOMPC3nv9pLu8bxdOQ9A/PL5QLw
 dZVM/YagsqBnNkzUR38W7fiBIjmA8hWn1oQ9MPkIu6IzM7Icl1XQqKJ7n/EzMJpxGhbM
 7sK76XR8MmjJWOROFKizQDfYDSdAHa77KXy6V5tLl7hUfSwTTnt3pQi79sQyxN/C9UNf
 YsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJ9ZJV6ixhrbH7SZAXvOT7PvKrJof79KxlrcHClSPG4=;
 b=ScDlRv3VEkfmPiysmdovuVp2VA8eeM4M3APx/ESRfOlcR2AX0e6AEsIwQSaFhuzJ8K
 0WVw4HRZoEIvbjhd0MGm9/OCy/JNiZ8ZJbKGWFSzWiyGTtB7CG2Hgu0ZUH3GhJmJ0Oz2
 2WPBrS7J6bcDQEkVKy+bC68kbx7rFWy5zxdVIiJFcnmEO4h2WKDoFNtZq+u76c6wHsXO
 gvMdwSl8wOqLY14X4KjIUdHtJONE4CMRerhLWX9/A3C5DVXAqI5y/vUIJO44CmUUVWXi
 Aa52JlvoPxD796Vw/giaYZjX2B7Es4F78UxHETHMpb9rJNQ5ktyZ8MQLJksuf5AuZGxq
 Z+Lg==
X-Gm-Message-State: AOAM532P2aktS6x7S7zvVgQx9ydOssVKinaueoirze43/3vwjKi1bKGU
 H6LSzzF+nZTIFiIxTDIfgBrKndRHWpSa4fySx7g=
X-Google-Smtp-Source: ABdhPJyDJRhb4CwChoXDk2k77nAFccfVW8fC3LIkdqZ54Vldlka+HHIxK+sIt0ks1s5tYCkbG5vTalXDeCy8MKRUa/c=
X-Received: by 2002:aca:420a:: with SMTP id p10mr1321975oia.117.1603371488332; 
 Thu, 22 Oct 2020 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201022124741.620334-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201022124741.620334-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 22 Oct 2020 18:27:39 +0530
Message-ID: <CABJPP5AObU2e2u8Zcd1J7k80dSqGPYGXQ_0RQVduBogzg6XJSg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Oct 22, 2020 at 6:18 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
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
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 199 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 163 insertions(+), 36 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7e505688257a..869d9b2801cd 100755
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
> +                                            "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
> +                                       $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
> +
> +                               }
> +                       }
> +
> +                       # Check for __attribute__ format(scanf, prefer __scanf
> +                       if ($attr =~ /^_*format_*\s*\(\s*scanf\b/) {
> +                               if (WARN("PREFER_SCANF",
> +                                            "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
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
> +                                            "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
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

Hi Lukas,
This patch is followed from the discussion at:
https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/

checkpatch didn't check a lot of the attributes which are
declared in include/linux/compiler-attributes.h

Like __attribute__((__used__)) is defined as __used,
which is generally the preferred way unless there is
a reason not to.

So check for use of the __attribute__ definitions
and generate a warning if the shorthand is not used.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
