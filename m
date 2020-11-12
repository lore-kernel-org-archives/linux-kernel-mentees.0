Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5FC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 15:49:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AF020A8B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 15:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvp0o/BL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AF020A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F4CE87135;
	Thu, 12 Nov 2020 15:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QchG7xsh6YD; Thu, 12 Nov 2020 15:49:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 970BC86ECD;
	Thu, 12 Nov 2020 15:49:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F17C088B;
	Thu, 12 Nov 2020 15:49:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 190F4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 15:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E59C12040F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 15:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sroVB8D1D2yQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 15:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 2DD8220354
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 15:49:41 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m9so6487635iox.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDv8HfQx7Eb537dDMQlnL0wiXiNZWrOV/iNFhg0LT/E=;
 b=cvp0o/BLh6+Ocg+RZ80FLBNGghXBVcZ+DuVsSjZrZHE/A5r+uZAI6K62NaB6hfzkUy
 fjqGscJtCKrs/hBr41mg8t/8EM84uGJ2Hg0R7c7Ktrc9n6TCpXEBYpvDIJUWWC2Tg+jO
 yealBBGmXFdhiRMP6zgCxnC0xZKMu4QjeVpi42TdFt6/pX46PzDUd0YWHEUDX70SHDuY
 ijDsjM4CzrAp1YTSXwI9SvWXVDJ2GWH9cYmRlD0Xnqkfn9zfpboOPnTTqjHypoL2GMaj
 XRdmLgtLhuKd+wauavweb6mjv2nkYrJ70aBNKELNMFxGQlYTGJ5nr+yGCawERucSAf7Q
 yM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDv8HfQx7Eb537dDMQlnL0wiXiNZWrOV/iNFhg0LT/E=;
 b=dO5gmwl1Gtf1nr26QFN2nCMV3a10dEQiuzUPhMfBHqB8nzagCkWNAisiMJ+RXVGBhI
 XhiHvUCMBRk1kEMR3k+NwyWWLVOywTx4GpCn/P0z7FQM4YKeFYtUndvm5YBm8zhQc4bY
 a+LVXuZidU4a+6YuttUb7PUL4B0AKd4Ew55qgoqi2u1HF/1wLatMIIZSF3Amp/OWIpsZ
 FpkkUcmoUFAu6JcAhbcKw0aPDRs+fhRmXbYPoOEM5gctFZtKTY5FitZ/CHB81bHXKj94
 DMjWvkK7P2Vw/3/mpGZNyZ1HiQ/IgUxKritHHMzokT5P5JcpjO3xZ7WJ9GfvMsr0PklS
 R1lQ==
X-Gm-Message-State: AOAM531yetrrTOYaO+VXOydGwrBE6rr+rev0ohTe9B1VCxdaPQj+d47B
 pVncU+9jJMNG8J8KJI1xcylEzudxUip5FXFte4+9VoDfCYE=
X-Google-Smtp-Source: ABdhPJxIp+mjmyuI7v66hkoTtJbhXx89VhBLI3lEk2d4D8RR8LzhO9GgV2uJ2ibxxaDiCQZrVBMkKLLPI7XVqL8yFO0=
X-Received: by 2002:a05:6638:124d:: with SMTP id
 o13mr235938jas.98.1605196180354; 
 Thu, 12 Nov 2020 07:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20201112154330.35750-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201112154330.35750-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 12 Nov 2020 16:49:28 +0100
Message-ID: <CAKXUXMzaf4erZ8Bxe6QbNpRbjXuU61+QE5OS6jkX_Wi5qLJUzw@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Nov 12, 2020 at 4:43 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
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

Looks good. Do we have a quick evaluation on that?

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
