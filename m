Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70157C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 10:31:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC50620756
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 10:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBf76nxF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC50620756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32BCC867E3;
	Wed, 11 Nov 2020 10:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KS8Jx5vHDTcC; Wed, 11 Nov 2020 10:31:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54C8D867B6;
	Wed, 11 Nov 2020 10:31:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39F2BC088B;
	Wed, 11 Nov 2020 10:31:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5B76C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 10:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9BF198720B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 10:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B8DjNYAmX9m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 10:31:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CC7E08708D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 10:31:07 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id z2so1486577ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 02:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xBSaTVNMPfPGHhUMYI+hLxMazSzPKmRe0TGeaaYm9k0=;
 b=NBf76nxF8SYIXnF1uxIp6uEJk1vKHazjN5TMSYYJlKXeCPRNA3pnhuMtd0P1ZNSpME
 3mja89cGywM7iTDWtb3OdMU2Avz9uX7px03SspZYe5GkejHSzqHKxGmfn4g8tOPegQtx
 SbhG9IPeQNhP7TITrcAw7vLteIANRbifk1YnO3ewF9yVMk9Hx7HnLY9m1bPiSYVZReZ3
 ZcULoQDJ5pn8p8nr8hQAAqiEwzy5eV2D8IgC3stZ384ebbCI3jPaohUfoycuUOStnNxl
 scCt8LtnWmvreD9qMP5xUhBcXoQGW4l1SjYiT1BH6jDGIQovDaV7kqAjDVgD6cb8NKMb
 vH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBSaTVNMPfPGHhUMYI+hLxMazSzPKmRe0TGeaaYm9k0=;
 b=Bfn0ckKN6KP3QCMB2HFXCV/Ov8PWjXOeqKpCXdOprbP2H22V/fZot7U9PJQYOeexUf
 dbVX+imuyVcIfE+e3JE8iUOUXeDdJdnYB1pTdI+uMhqnMhZ7t7DtCuXYGgbgZQqQmAYP
 W8xT8jHmLsw8RJ9S4+bQsKC5ikRe3gtNE/TDvTe/i/jDi62v/bus9B6O6LoQ5VVqHlZs
 csoKLHUsk+FK2Btc/0ixe5BN0wUDLGeSIp8SlBeJDc5j7sH9q/sYZl3hH7nhlUVy1fq1
 OI0FhJR5/Ni6rP6yszLBup+chWxOAw4XIdSHSnjjTQUfBCF90M5kiagaPK+Kx1EjdajY
 o20w==
X-Gm-Message-State: AOAM531XXdXHF6jVDR71/UZ8TnQ0cKcnZTfadjMcID2Cu2GBbbj49gky
 ECZ1FxH26fzCLJjKJ3BWw10RNAgo2M7B5FtgT0Y=
X-Google-Smtp-Source: ABdhPJz4jKYLr4F43q8xNORwFZsZCagRvl3wgei5q+sYGOnSxVMPwutCYElFaUeTKeaIzpu07E2zccDIiIQQro5noPU=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr17208165ilq.64.1605090667090; 
 Wed, 11 Nov 2020 02:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20201111090143.9230-1-yashsri421@gmail.com>
In-Reply-To: <20201111090143.9230-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 11 Nov 2020 11:30:58 +0100
Message-ID: <CAKXUXMzg6Wg310s-N8hWOEiXFkg1ZAga+NkFQkFQ5_bS16TLnA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for MISSING_SIGN_OFF
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

On Wed, Nov 11, 2020 at 10:01 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns us if there is no 'Signed-off-by' line
> for the patch.
>
> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> Completely remove --version flag") reports this error:
>
> ERROR: Missing Signed-off-by: line(s)
>
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the patch separator line. Also avoid this error for
> the commits where some typo is present in the sign off.
>
> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> for quirk") we get missing sign off as well as bad sign off for:
>
> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>
> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> signature and avoid MISSING_SIGN_OFF
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> Add space after 'if'
> Add check for $patch_separator_linenr to be greater than 0
>
>  scripts/checkpatch.pl | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..ac7e5ac80b58 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,8 @@ sub process {
>
>         my $last_blank_line = 0;
>         my $last_coalesced_string_linenr = -1;
> +       my $patch_separator_linenr = 0;
> +       my $non_standard_signature = 0;
>
>         our @report = ();
>         our $cnt_lines = 0;
> @@ -2755,6 +2757,10 @@ sub process {
>                 if ($line =~ /^---$/) {
>                         $has_patch_separator = 1;
>                         $in_commit_log = 0;
> +                       # to add missing sign off line before diff(s)
> +                       if ($patch_separator_linenr == 0) {
> +                               $patch_separator_linenr = $linenr;
> +                       }
>                 }
>
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> @@ -2775,6 +2781,9 @@ sub process {
>                         if ($sign_off !~ /$signature_tags/) {
>                                 WARN("BAD_SIGN_OFF",
>                                      "Non-standard signature: $sign_off\n" . $herecurr);
> +
> +                               # to avoid missing_sign_off error as it most probably is just a typo
> +                               $non_standard_signature = 1;
>                         }
>                         if (defined $space_before && $space_before ne "") {
>                                 if (WARN("BAD_SIGN_OFF",
> @@ -7118,9 +7127,12 @@ sub process {
>                       "Does not appear to be a unified-diff format patch\n");
>         }
>         if ($is_patch && $has_commit_log && $chk_signoff) {
> -               if ($signoff == 0) {
> -                       ERROR("MISSING_SIGN_OFF",
> -                             "Missing Signed-off-by: line(s)\n");
> +               if ($signoff == 0 && !$non_standard_signature) {
> +                       if (ERROR("MISSING_SIGN_OFF",
> +                                 "Missing Signed-off-by: line(s)\n") &&
> +                           $fix && $patch_separator_linenr > 0) {
> +                               fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
> +                       }

Maybe I am already digging too much in the details... however:

I think it should still warn about a Missing Signed-off-by: even when
we know there is a $non_standard_signature. So, checkpatch simply
emits two warnings; that is okay in that case.

It is just that our evaluation shows that the provided fix option
should not be suggested when there is a $non_standard_signature
because we actually would predict that there is typo in the intended
Signed-off-by tag and the fix that checkpatch would suggest would not
be adequate.

Joe, what is your opinion?

Aditya, it should not be too difficult to implement the rule that way, right?


>                 } elsif ($authorsignoff != 1) {
>                         # authorsignoff values:
>                         # 0 -> missing sign off
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
