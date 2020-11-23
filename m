Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A118C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:10:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDB72075A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv73mu8h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDB72075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14E7086746;
	Mon, 23 Nov 2020 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XctWBkoBfWSy; Mon, 23 Nov 2020 13:10:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B703386679;
	Mon, 23 Nov 2020 13:10:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3C2CC0891;
	Mon, 23 Nov 2020 13:10:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BACA0C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 838D120483
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voFT+8P9WzUD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:09:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C931E203DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:09:56 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r17so3889451ilo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 05:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oq5sX+R1NunAAqluQAKvfHT86kFmgLfnWRWt5eYsPPA=;
 b=Lv73mu8hz7HfYPWDegItVu+LBGjN7vU3uOjbQqIAPT9w6DeiVqSPzxzVoVnYB+45gI
 JIIpqrZUb7PnheZCi+oKWtkiUOTIpq7fjvSMZ9JkjYLuRA6c4Ah63x4sKctdDh9YrfUY
 rN5aRMyJIiVnCoixM/3sxCSxbLpPaw9/je+PIsJ0rwR4pnZqAzxJ9d85QMLyPmOxrZGC
 /A4OSoDBcJ+brk+lk4R030PatsSgVrTZSptD2GsRVQ7ompQpk75W4DWpBVjjVAYZqait
 okZiD2rc1rXxBYWD9y0/lX143WnJQbepZISUO4L7SK3QPmI5oKOFGHCV3RBPxNpnc4AM
 HxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oq5sX+R1NunAAqluQAKvfHT86kFmgLfnWRWt5eYsPPA=;
 b=mfu9aRNUrPqNh3QsdCO9Ge5/AyABEDQYsiya8xQyqiQDWrdt40D5LSv0opAdIS1+ff
 /iyHH/6ScXRLjsgXnyscr8evnLhYoTvghHixs/LOH2diXRFf7fnYvzO1EMWkkjqU/jAg
 wwTCG2W2KqRS4jdU3CX6/XKjZzhYcoS7/CwlLC+KupGxyONQA5FDme4jomRsn7GnpLEj
 TGIUXrVKy2tnf6uhht8a602hPS/2a6es8uCm8UuiPVfZx7mHnIoHSVZ8wYkER5qWOzBb
 kNoS5Y6/cYWktAKUv3s4QFZFZK2cgKwdf+jC9un+wjFXmULI9N7/USq/Qe3833+vwL/Q
 LHQg==
X-Gm-Message-State: AOAM531nliMZ0dMzNqZpCMHhYG7WAzVgMGX+5SJ4tqrIpcBzIqWw0yIe
 bjuKoo9jePe/MYTrVsYRGDwpIaSxLSb6Ao1wzPFJGJyzCIQ=
X-Google-Smtp-Source: ABdhPJyOUROs91qUWbuYDSqBkGk2/Vbz73HyVy1e7Br6UOKCYZASAu4UfQuo3xA5Pb6epb+ct9uOuZFmIl1MO+DDNUE=
X-Received: by 2002:a92:35d7:: with SMTP id c84mr28977134ilf.251.1606136995635; 
 Mon, 23 Nov 2020 05:09:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzfQn9qbSLKnBn+hMs4uqiPqzESXfOPocoLmkSvOZEKRQ@mail.gmail.com>
 <20201123122138.29260-1-yashsri421@gmail.com>
In-Reply-To: <20201123122138.29260-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 14:09:44 +0100
Message-ID: <CAKXUXMwP6_U3nY9yPLfZ9J3vq3FsBYd41mPfbZ1vY5xr11=GYQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Mon, Nov 23, 2020 at 1:21 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> styles.
>
> This warning occurs because of incorrect use of signature tags,
> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> signature tags, which may seem correct, but are not standard:
>
> 1) Requested-by (count: 48) => Suggested-by
> Rationale: In an open-source project, there are no 'requests', just
> 'suggestions' to convince a maintainer to accept your patch
>
> 2) Co-authored-by (count: 43) => Co-developed-by
> Rationale: Co-developed-by and Co-authored-by are synonyms
>
> 3) Analyzed-by (count: 22) / Analysed-by (count: 5) => Co-developed-by
> Rationale: Analyzing is a part of Software Development, so
> 'Co-developed-by' is perfectly fine, even if contributor did not create
> code
>
> 4) Improvements-by (count: 19) => Co-developed-by
>
> 5) Noticed-by (count: 11) => Reported-by
>
> 6) Inspired-by (count: 11) => Suggested-by
>
> 7) Verified-by (count: 8) => Tested-by
> Rationale: Used by a single user. On reading mailing list, it seems
> Tested-by might be a suitable alternative
>
> 8) Okay-ished-by (count: 8) => Acked-by
> Rationale: Used by a single user. On reading mailing list, it seems
> Acked-by must be suitable alternative
>
> 9) Acked-for-MFD-by (count: 6) => Acked-by
>
> 10) Reviewed-off-by (count: 5) => Reviewed-by
>
> 11) Proposed-by (count: 5) => Suggested-by
> Rationale: On observing the mailing list, this tag is always used for a
> maintainer. It seems that the changes might have been suggested by them
> and the tag is used as acknowledgement for the same
>
> 12) Fixed-by (count: 3) => Co-developed-by
> Rationale: Fixing bug is a part of Software Development, so
> 'Co-developed-by' is perfectly fine, even if contributor did not create
> code
>
> 13) Pointed-out-by (count: 3) / Pointed-at-by (count: 2) => Suggested-by
> Rationale: The tags are used for maintainers. It seems that the changes
> might have been suggested by them and the tag is used as acknowledgement
> for the same
> E.g., Pointed-at-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> 14) Suggestions-by (count: 3) => Suggested-by
>
> 15) Generated-by (count: 17) => remove the tag
> On observing the mailing list, this tag is always used for quoting the
> tool or script, which might have been used to generate the patch.
> E.g. Generated-by: scripts/coccinelle/api/alloc/kzalloc-simple.cocci
>
> 16) Celebrated-by (count: 3) => remove the tag
> This tag was used for only one commit. On observing mailing list, it seem
> like the celebration for a particular patch and changes.
>
> Provide a fix by:
> 1) replacing the non-standard signature with its standard equivalent
> 2) removing the signature if it is not required
>
> Also, improve warning messages correspondingly, providing users
> suggestions to either replace or remove the signature. Also provide
> suitable rationale to the user for the suggestion made.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>


Looks good to me. Let us propose this to Joe for review.

Also, you can already start working on the related feature for
providing fixes based on the edit distance.

With both features, we can probably fix all non-standard signatures...

Lukas

> ---
> changes in v2: replace commit specific example with brief evaluation
>
> changes in v3: provide rationale to users for every signature tag suggestion;
> modify commit message describing arrival to conclusion in a structured way
>
>  scripts/checkpatch.pl | 101 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fdfd5ec09be6..575ff8efb0eb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,81 @@ our $signature_tags = qr{(?xi:
>         Cc:
>  )};
>
> +our %standard_signature_fix = (
> +       "Requested-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "In an open-source project, there are no 'requests', just 'suggestions' to convince a maintainer to accept your patch",
> +       },
> +       "Co-authored-by:" => {
> +               suggestion => "Co-developed-by:",
> +               rationale => "Co-developed-by and Co-authored-by are synonyms",
> +       },
> +       "Analyzed-by:" => {
> +               suggestion => "Co-developed-by:",
> +               rationale => "Analyzing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +       },
> +       "Analysed-by:" => {
> +               suggestion => "Co-developed-by:",
> +               rationale => "Analysing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +       },
> +       "Improvements-by:" => {
> +               suggestion => "Co-developed-by:",
> +               rationale => "Performing improvements are a part of Software Developement, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +       },
> +       "Noticed-by:" => {
> +               suggestion => "Reported-by:",
> +               rationale => "Reported-by and Noticed-by are synonyms",
> +       },
> +       "Inspired-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> +       },
> +       "Verified-by:" => {
> +               suggestion => "Tested-by:",
> +               rationale => "Tested-by and Verified-by are synonyms",
> +       },
> +       "Okay-ished-by:" => {
> +               suggestion => "Acked-by:",
> +               rationale => "Acked-by is the standard signature tag for recording your approval",
> +       },
> +       "Acked-for-MFD-by:" => {
> +               suggestion => "Acked-by:",
> +               rationale => "Acked-by is the standard signature tag for recording your approval",
> +       },
> +       "Reviewed-off-by:" => {
> +               suggestion => "Reviewed-by:",
> +               rationale => "Reviewed-by is the standard signature tag for recording your approval",
> +       },
> +       "Proposed-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "Proposing changes is same as suggesting changes, so Suggested-by seems perfectly fine",
> +       },
> +       "Fixed-by:" => {
> +               suggestion => "Co-developed-by:",
> +               rationale => "Fixing bug is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +       },
> +       "Pointed-out-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "Pointing out certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> +       },
> +       "Pointed-at-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "Pointing at certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> +       },
> +       "Suggestions-by:" => {
> +               suggestion => "Suggested-by:",
> +               rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> +       },
> +       "Generated-by:" => {
> +               suggestion => "remove",
> +               rationale => "Signature tags are used to acknowledge users for their contributions. It is advised to describe about tools in commit description instead",
> +       },
> +       "Celebrated-by:" => {
> +               suggestion => "remove",
> +               rationale => "Signature tags are used to acknowledge users for their contributions. This tag may not be required at all",
> +       },
> +);
> +
>  our @typeListMisordered = (
>         qr{char\s+(?:un)?signed},
>         qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2848,30 @@ sub process {
>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
>
>                         if ($sign_off !~ /$signature_tags/) {
> -                               WARN("BAD_SIGN_OFF",
> -                                    "Non-standard signature: $sign_off\n" . $herecurr);
> +                               my $suggested_signature = "";
> +                               my $rationale = "";
> +                               if (exists($standard_signature_fix{$sign_off})) {
> +                                       $suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
> +                                       $rationale = $standard_signature_fix{$sign_off}{'rationale'};
> +                               }
> +                               if ($suggested_signature eq "") {
> +                                       WARN("BAD_SIGN_OFF",
> +                                            "Non-standard signature: $sign_off\n" . $herecurr);
> +                               }
> +                               elsif ($suggested_signature eq "remove") {
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                               "Non-standard signature: $sign_off. Please consider removing this signature tag. $rationale\n" . $herecurr) &&
> +                                       $fix) {
> +                                               fix_delete_line($fixlinenr, $rawline);
> +                                       }
> +                               }
> +                               else {
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                               "Non-standard signature: $sign_off. Please use '$suggested_signature' instead. $rationale\n" . $herecurr) &&
> +                                       $fix) {
> +                                               $fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
> +                                       }
> +                               }
>                         }
>                         if (defined $space_before && $space_before ne "") {
>                                 if (WARN("BAD_SIGN_OFF",
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
