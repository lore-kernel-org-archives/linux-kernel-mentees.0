Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C0AC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:02:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F25220DD4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n48NUl5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F25220DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE9AA86102;
	Tue, 17 Nov 2020 09:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAXgOOSBPZ1f; Tue, 17 Nov 2020 09:02:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EDCF85CF2;
	Tue, 17 Nov 2020 09:02:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04BADC0891;
	Tue, 17 Nov 2020 09:02:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 888F4C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7721785D57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N60EYTFZwUua
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:02:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2AA986715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:02:09 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j23so4474007iog.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 01:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTgFYXdRcUA/kfaWbj6/eqFFzg8k4aTqCR1MVL/gqko=;
 b=n48NUl5s9a1SQDp0ObwoGLtgq4g0AXefrMzSAwCERy/EWIzvp8mcw+mXGjrI4n/8Nw
 KdV4z4MFNBaEA8uigQ1VyGNQ4CRIS0SAgM9ryUbhM4qifcllkV6JMMWf/GSwCAFufIwf
 xR2jV2Enq6Hm/n/sfasP8Rt+w3IicV95pNb3hJNDowpLzr0/O++jwYP/wPMtEo9m5UXq
 bwwpLStAnyjKhrLD+74b497kPaGtXhushChr6FeIDF0FYzWN8IbxKyPfNBUbvuDI4RFa
 rO/0bDwEcjP2iFuNX7iNQDhLHJbNRxhW50c03hc2iW95ZtfOJqF0JRrRLLDQHKVTagTc
 LyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTgFYXdRcUA/kfaWbj6/eqFFzg8k4aTqCR1MVL/gqko=;
 b=r8XMYUbepQSMbp3DoLdKBaELige7JCEm8lycknnBIhTJYJmulfpyn24VEVMKW76lFX
 z90TEW1aKdjOELDK6R0NmQONXedIr3XFszGBChbU2yJPDzwNB5tzD9bpPyR/L6+c+4jn
 TCn5JSSSclBEEgicdUxmNR81UgIzIxJbFOkREpAjoEXpsOAW1yWyIY1fFnrfm5DRHMYf
 VH+w4rsCIMENYxnvSc06ntzLRBhtv07gTQd1iCEGN7LJ+TOnWHHpdEyvoQJK1XVcehhm
 5Y6Q55N4PRipjKUQMrmOL8HPP3R4dbeZM+94rS95M2hx9FhnJCXV3HxcqX95qP6nsGq0
 ytxw==
X-Gm-Message-State: AOAM533inisCyH15gaTcdQvufqTBwI6ZYnvf5+GNPRlBLkRsWWsX6vTQ
 hOcmuDfcDXFEgSKJJ7oTMsw4bnH1WYeNPytIcrs=
X-Google-Smtp-Source: ABdhPJx22VTzuO9N2SoMTbB9RFjI5H4tgiiCg64UdbdSy2uNbDuLWvYvfAUaJ2tLyRSU0Ez6o3ELOd/UUXUgEbJfyQI=
X-Received: by 2002:a6b:c047:: with SMTP id q68mr10743208iof.189.1605603729011; 
 Tue, 17 Nov 2020 01:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20201117085553.52583-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201117085553.52583-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 10:01:58 +0100
Message-ID: <CAKXUXMzM8AYPWkCKXnTRQG-a03Jh+HDCF=pGAjEsg9ah0odG2A@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

On Tue, Nov 17, 2020 at 9:56 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Brace style misuses of the following types are now
> corrected:
>
> int foo(int bar,
>         int baz) { bar++;
>     return bar + baz;
> }
>
> int foo(int bar,
>         int baz) {
>     return bar + baz;
> }
>
> if (bar &&
>     baz)
> {   bar++;
>     baz++;
> }
>
> if (bar &&
>     baz)
> {
>     bar++;
>     baz++;
> }
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Looks good to me. How did you test this? Did you run on a couple of
files in the kernel repository?


> ---
>  scripts/checkpatch.pl | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0da6422cd0fd..8da6cde20c68 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3937,9 +3937,23 @@ sub process {
>                         #print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
>
>                         if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
> -                               ERROR("OPEN_BRACE",
> -                                     "that open brace { should be on the previous line\n" .
> -                                       "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
> +                               if (ERROR("OPEN_BRACE",
> +                                         "that open brace { should be on the previous line\n" .
> +                                               "$here\n$ctx\n$rawlines[$ctx_ln - 1]\n") &&
> +                                   $fix) {
> +                                       my $line1 = $rawlines[$ctx_ln - 2];
> +                                       my $line2 = $rawlines[$ctx_ln - 1];
> +                                       fix_delete_line($ctx_ln - 2, $line1);
> +                                       fix_delete_line($ctx_ln - 1, $line2);
> +
> +                                       my $fixedline = rtrim($line1) . " {";
> +                                       fix_insert_line($ctx_ln - 1, $fixedline);
> +                                       $fixedline = $line2;
> +                                       $fixedline =~ s/^(.\s*)\{\s*/$1\t/;
> +                                       if ($fixedline !~ /^\+\s*$/) {
> +                                               fix_insert_line($ctx_ln - 1, $fixedline);
> +                                       }
> +                               }
>                         }
>                         if ($level == 0 && $pre_ctx !~ /}\s*while\s*\($/ &&
>                             $ctx =~ /\)\s*\;\s*$/ &&
> @@ -6659,16 +6673,30 @@ sub process {
>                         my $ok = 0;
>                         my $cnt = statement_rawlines($stat);
>                         my $herectx = $here . "\n";
> +                       my $cur_ln = $linenr - 1;
>                         for (my $n = 0; $n < $cnt; $n++) {
>                                 my $rl = raw_line($linenr, $n);
>                                 $herectx .=  $rl . "\n";
>                                 $ok = 1 if ($rl =~ /^[ \+]\{/);
>                                 $ok = 1 if ($rl =~ /\{/ && $n == 0);
>                                 last if $rl =~ /^[ \+].*\{/;
> +                               $cur_ln++;
>                         }
>                         if (!$ok) {
> -                               ERROR("OPEN_BRACE",
> -                                     "open brace '{' following function definitions go on the next line\n" . $herectx);
> +                               if (ERROR("OPEN_BRACE",
> +                                         "open brace '{' following function definitions go on the next line\n" . $herectx) &&
> +                                   $fix && $rawlines[$cur_ln] =~ /^\+/) {
> +                                       fix_delete_line($cur_ln, $rawlines[$cur_ln]);
> +                                       my $fixed_line = $rawlines[$cur_ln];
> +                                       $fixed_line =~ /(^.*\)\s*)\{(.*)$/;
> +                                       my $line1 = rtrim($1);
> +                                       my $line2 = $2;
> +                                       fix_insert_line($cur_ln, $line1);
> +                                       fix_insert_line($cur_ln, "\+{");
> +                                       if ($line2 !~ /^\s*$/) {
> +                                               fix_insert_line($cur_ln, "\+\t" . trim($line2));
> +                                       }
> +                               }
>                         }
>                 }
>
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
