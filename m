Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2698C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 11:48:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4D5206F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 11:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrYY6EEw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4D5206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C624787294;
	Tue, 24 Nov 2020 11:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB9CyN8FlDmQ; Tue, 24 Nov 2020 11:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B54086762;
	Tue, 24 Nov 2020 11:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26040C163C;
	Tue, 24 Nov 2020 11:48:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 160A5C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1032E87294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yk+Sd-RsX2LT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E8BE786762
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 11:48:18 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i18so21623216ioa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKxo1uCEXZfJ1h6RmHS/XrTdgLzwe5GORyY4K29QqO4=;
 b=CrYY6EEwlG1visNYoYbSpqla3aABS9L+m8HZN4bo9DqmLghzp2+eWQMo6yBqMMyDTr
 7c9WUtSJpGpxGOKYpz7uJMYJicy2B2aLhhtN3GjU5PQp5er67EGnjB4mNjp9SF2X0mjU
 qBFDvoOUG3DCaGGna8irZgYnDbx8MHcIsLZVDklgf+Zb5EFqgNBgcTnAPrkDDM3dzl2D
 4h9hGuloI+x3GSy3Hyk4njvNm67uqFdWY2PNuejBP7XX5d+F6NspEMCe/R4IgtkufckG
 rBbm+XLeEtp5Pt+eYlUFy8WNGyurdd919fq8uH7GSgOo/brrvvWQ977gaAAyi5Vndg1G
 yxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKxo1uCEXZfJ1h6RmHS/XrTdgLzwe5GORyY4K29QqO4=;
 b=MzNO50LnDSTfNs/bu/P++Z59OLrzzgVBsRZYew+4qO31cUGQHpRsg6y9NvzjGMzF3N
 6ThU9zQNKL+rEX/x3MkiSAKgaNdPpawOly8dZspxns4kQYQOizX0r90fOf5HUA2fYARz
 oMvy6/PUqYTyUlnzDc2LO4wPLUasdQGeUXYz4a5G/nyPDxFnHoALmZx4KGGxGztPzooy
 fciL7rPcYnCFtKtyhiKk5NXUZM7tCckk0AmtuV58HXZBR5HFaoYnETeZoFvtbVu+6scW
 a6v5bVI8bzXkQMR7c/84ecV2ZfZKqAgA9kp+rbkvKRFbwxtKgNQUd5ozEPmJF9PrToDZ
 kcqw==
X-Gm-Message-State: AOAM532OXmHBOEqCLNQe8ZYKU4mzQqe3Cfd7GpoewDt2jASI0/n07eRX
 UzBm320XSmT13eILmyhA18Kghb6AAfymEAcgNMc=
X-Google-Smtp-Source: ABdhPJwisgU+efhFl4T0h2IV9n/RJ367+D2iscfJ7+ODgoAkFt6VpUw/TzOTxprn717J4iPS8eDFQ6BhGpCa6yehyUY=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr3748421iom.102.1606218498126; 
 Tue, 24 Nov 2020 03:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20201124111659.16854-1-yashsri421@gmail.com>
In-Reply-To: <20201124111659.16854-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 24 Nov 2020 12:48:07 +0100
Message-ID: <CAKXUXMxJwx9m6WMiJ+_vi8vifJYqO8gB-he7s_92P4012Lvpkw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
 warning msg for Non-standard signature
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

On Tue, Nov 24, 2020 at 12:17 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
> styles.
>
> A large number of these warnings occur because of typo mistakes in
> signoffs.
> An evaluation over v4.13..v5.8 revealed that out of 539 warnings due to
> Non-standard signatures, 85 are due to typo mistakes.
>
> Eg. running checkpatch on commit da785a87787c ("ARM: bcm2835: Fix
> integer overflow in rpi_firmware_print_firmware_revision()") reports
> this warning:
>
> WARNING:Non-standard signature: Revieved-by:
> Revieved-by: Petr Mladek <pmladek@suse.com>
>
> Here the signoff 'Reviewed-by' is misspelt.
>

Again, it is better to provide a summary of the overall evaluation
instead of a single example,

> Provide a fix by calculating levenshtein distance for the signoff over

it is a signature tag, not the signoff.

> all the standard signatures and suggest a fix if the distance for any
> signature is less than or equal to 2.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> applied on my last patch and next-20201120
>

Joe, might ack this one and reject the other; so you might need to rebase later.

For the discussion with Joe now that is fine, though.

Other than that, it looks good.

>  scripts/checkpatch.pl | 73 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b018deecec1a..2198360eebbd 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,77 @@ our $signature_tags = qr{(?xi:
>         Cc:
>  )};
>
> +sub get_min {
> +       my (@arr) = @_;
> +       my $len = scalar @arr;
> +       if((scalar @arr) < 1) {
> +               # if underflow, return
> +               return;
> +       }
> +       my $min = $arr[0];
> +       for my $i (0 .. ($len-1)) {
> +               if ($arr[$i] < $min) {
> +                       $min = $arr[$i];
> +               }
> +       }
> +       return $min;
> +}
> +
> +sub get_edit_distance {
> +       my ($str1, $str2) = @_;
> +       my $len1 = length($str1);
> +       my $len2 = length($str2);
> +       # two dimensional array storing minimum edit distance
> +       my @distance;
> +       for my $i (0 .. $len1) {
> +               for my $j (0 .. $len2) {
> +                       if ($i == 0) {
> +                               $distance[$i][$j] = $j;
> +                       }
> +                       elsif ($j == 0) {
> +                               $distance[$i][$j] = $i;
> +                       }
> +                       elsif (substr($str1, $i-1, 1) eq substr($str2, $j-1, 1)) {
> +                               $distance[$i][$j] = $distance[$i - 1][$j - 1];
> +                       }
> +                       else {
> +                               my $dist1 = $distance[$i][$j - 1]; #insert distance
> +                               my $dist2 = $distance[$i - 1][$j]; # remove
> +                               my $dist3 = $distance[$i - 1][$j - 1]; #replace
> +                               $distance[$i][$j] = 1 + get_min($dist1, $dist2, $dist3);
> +                       }
> +               }
> +       }
> +       return $distance[$len1][$len2];
> +}
> +
> +sub get_standard_signature {
> +       my ($sign_off) = @_;
> +       $sign_off = lc($sign_off);
> +       $sign_off =~ s/\-//g; # to match with formed hash
> +       my @standard_signature_tags = (
> +               'signed-off-by:', 'co-developed-by:', 'acked-by:', 'tested-by:',
> +               'reviewed-by:', 'reported-by:', 'suggested-by:', 'to:', 'cc:'
> +       );
> +       # setting default values
> +       my $standard_signature = 'signed-off-by';
> +       my $min_edit_distance = 20;
> +       my $edit_distance;
> +       foreach (@standard_signature_tags) {
> +               my $signature = $_;
> +               $_ =~ s/\-//g;
> +               $edit_distance = get_edit_distance($sign_off, $_);
> +               if ($edit_distance < $min_edit_distance) {
> +                       $min_edit_distance = $edit_distance;
> +                       $standard_signature = $signature;
> +               }
> +       }
> +        if($min_edit_distance<=2) {
> +               return ucfirst($standard_signature);
> +        }
> +       return "";
> +}
> +
>  our %standard_signature_fix = (
>         "Requested-by:" => {
>                 suggestion => "Suggested-by:",
> @@ -2848,7 +2919,7 @@ sub process {
>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
>
>                         if ($sign_off !~ /$signature_tags/) {
> -                               my $suggested_signature = "";
> +                               my $suggested_signature = get_standard_signature($sign_off);
>                                 my $rationale = "";
>                                 if (exists($standard_signature_fix{$sign_off})) {
>                                         $suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
