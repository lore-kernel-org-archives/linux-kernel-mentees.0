Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAFAC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 10:02:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81312078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 10:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqHU7RFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81312078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A0C986FCC;
	Mon,  5 Oct 2020 10:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXswFHEFQN94; Mon,  5 Oct 2020 10:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A078E86CB6;
	Mon,  5 Oct 2020 10:02:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D038C07FF;
	Mon,  5 Oct 2020 10:02:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BBC7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 10:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7ACA920470
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 10:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oub0pdB+YuY5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 10:02:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1463220400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 10:02:05 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id 4so2072865ooh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aGNJY1N+xv3ECllsfy4VYH0OZwB/DhC8S0nR2Z5DkZc=;
 b=JqHU7RFt2XNnmYE//lkfBMuL9hJFGSEXhEvRwviSWFJYdBfBcHAzIRoT4Qb8GbbGKv
 QIGYMww9sgfn07gpxUdSvzBBYzQv9T+KMhLasoZJwFGhvClzfbQ7KQFozug9N/GfJVDx
 q3fe0hnJaRIhxRZALt2gMDrBuVJ3uo1BQ+nZRBRvfICvs+R+EQqlOR4/mr8kETngDlhP
 L5UA4xxv5uuCCGjpiFzKO7Yp9LkDVuxUx9ADHmkVO/xjrgLDsZCuL+ROdjYCEH9Re8DZ
 o2e0bf4UQ6/RuBcauwWMfOtENwHYojKa8lHz/vzylI8s0u0YgnZEcGuk8FOsk6x0/Qip
 rYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGNJY1N+xv3ECllsfy4VYH0OZwB/DhC8S0nR2Z5DkZc=;
 b=LMC8Y+03X/YVxXz5T5mlXmG208zGKXymJ2ZpcFa+Zd6hukpYr17MB7PepR8D+Kckuv
 XNHUICAwuCqI3qs+4nwQDxJ7WekUwndSgc3xSDQZvUVo6T1SkUwREn8p3HahY440xlLT
 zRRIh8jt1soJsLBmtgb3/QiEb3GO4pJOgIeMHQZzq7gLpcK7dXC3gGE/Zfpix1h0gfvQ
 YzDcJ0hjxkVfMnG1+6/htYuc9dZSiaM4MTlV1/jUFkw74MXTkvDTSN4mDrq1BHuSOCVC
 bwuDEwaiBPeSijRWLNmgqzKBMfhBhtfQGQF9Zaly9Cmi9wnp4H29ZPRWgiJTGGLZ0oT7
 aO3g==
X-Gm-Message-State: AOAM533Chm28szHM9CDOCzpW/SFVXc3RlxS1mcxJCYqY+44sR+P6z8j7
 JvGTFUDPrHaD9ocQ/CvFTQmuHo3Qh4YWl+jHNss=
X-Google-Smtp-Source: ABdhPJw6A90WixETit5DayCjajn1G9JDABPgijlfw3R7lhWJ1PRhwmy+ETNm0jR5YaxfX9sWrZFobpxhw2SHN8Vtjsw=
X-Received: by 2002:a4a:e1ee:: with SMTP id u14mr11848743ood.53.1601892124815; 
 Mon, 05 Oct 2020 03:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201005095634.69713-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201005095634.69713-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 5 Oct 2020 15:31:42 +0530
Message-ID: <CABJPP5B6pxF_Fkd8-=k_Bw71UWwoE4vA18RsESTD4X9AhP=Ejg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new warnings to
	author signoff checks.
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

On Mon, Oct 5, 2020 at 3:27 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> The author signed-off-by checks are currently very vague.
> Cases like same name or same address are not handled separately.
>
> For example, running checkpatch on commit be6577af0cef
> ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> gives:
>
> WARNING: Missing Signed-off-by: line by nominal patch author
> 'John David Anglin <dave.anglin@bell.net>'
>
> The signoff line was:
> "Signed-off-by: Dave Anglin <dave.anglin@bell.net>"
>
> Clearly the author has signed off but with a slightly different version
> of his name. A more appropriate warning would have been to point out
> at the name mismatch instead.
>
> Introduced three new types of warnings:
>
> 1) Address matches, but names are different.
>    "James Watson <james@gmail.com>", "James <james@gmail.com>"
>
> 2) Name matches, but addresses are different.
>    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
>
> 3) Name matches, but addresses without mail extensions are same.
>    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
>
> For the 3rd class, a --strict check message is generated, and for the
> other two, warnings are generated.
>
> Link: https://lore.kernel.org/lkml/7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 54 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31624bbb342e..1380212f1a9d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2347,6 +2347,7 @@ sub process {
>         my $signoff = 0;
>         my $author = '';
>         my $authorsignoff = 0;
> +       my $author_sob = '';
>         my $is_patch = 0;
>         my $is_binding_patch = -1;
>         my $in_header_lines = $file ? 0 : 1;
> @@ -2674,9 +2675,34 @@ sub process {
>                 if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>                         $signoff++;
>                         $in_commit_log = 0;
> -                       if ($author ne '') {
> +                       if ($author ne ''  && $authorsignoff != 1) {
>                                 if (same_email_addresses($1, $author)) {
>                                         $authorsignoff = 1;
> +                               } else {
> +                                       my $ctx = $1;
> +                                       my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +                                       my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +                                       if ($email_address eq $author_address) {
> +                                               $author_sob = $ctx;
> +                                               $authorsignoff = 2;
> +                                       } elsif ($email_name eq $author_name) {
> +                                               $author_sob = $ctx;
> +                                               $authorsignoff = 3;
> +
> +                                               my $address1 = $email_address;
> +                                               my $address2 = $author_address;
> +
> +                                               if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> +                                                       $address1 = $1.$2;
> +                                               }
> +                                               if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> +                                                       $address2 = $1.$2;
> +                                               }
> +                                               if ($address1 eq $address2) {
> +                                                       $authorsignoff = 4;
> +                                               }
> +                                       }
>                                 }
>                         }
>                 }
> @@ -6891,9 +6917,29 @@ sub process {
>                 if ($signoff == 0) {
>                         ERROR("MISSING_SIGN_OFF",
>                               "Missing Signed-off-by: line(s)\n");
> -               } elsif (!$authorsignoff) {
> -                       WARN("NO_AUTHOR_SIGN_OFF",
> -                            "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +               } elsif ($authorsignoff != 1) {
> +                       # authorsignoff values:
> +                       # 0 -> missing sign off
> +                       # 1 -> sign off identical
> +                       # 2 -> addresses match, names different
> +                       # 3 -> names match, addresses different
> +                       # 4 -> names match, addresses excuding mail extensions (subaddresses) match
> +
> +                       my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
> +
> +                       if ($authorsignoff == 0) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                        "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +                       } elsif ($authorsignoff == 2) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                        "From:/Signed-off-by: email name mismatch:\n$sob_msg\n");
> +                       } elsif ($authorsignoff == 3) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                        "From:/Signed-off-by: email address mismatch:\n$sob_msg\n");
> +                       } elsif ($authorsignoff == 4) {
> +                               CHK("NO_AUTHOR_SIGN_OFF",
> +                                       "From:/Signed-off-by: email extension mismatch:\n$sob_msg\n");
> +                       }
>                 }
>         }
>
> --
> 2.27.0
>

Hi Lukas,
This is the updated patch with some style changes, and
Joe's suggestions.

Please let me know if I am missing something or if it is
ready to be sent back again to Joe and LKML.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
