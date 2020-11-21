Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2098C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:52:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBE52224A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1qLDp0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBE52224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 835F486D8A;
	Sat, 21 Nov 2020 09:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9AVwwqRt4aL; Sat, 21 Nov 2020 09:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82AAE86D62;
	Sat, 21 Nov 2020 09:52:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D6E0C163C;
	Sat, 21 Nov 2020 09:52:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CFD2C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3748086D64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1s-W8F7dNVnP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:52:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 71B7786D62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:52:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m13so12538575ioq.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWOKyhMY9nx+PNHgXM5qC/gBgIKBQc141NLInLFRYlk=;
 b=W1qLDp0a1nAGi3qAF9dvDHlH60HGJjnjv3uYW4UijUdgIWJYK01gXJbuiY1yCU9j7d
 059zIphjTl8XwVPCkjuHPffETZLscLifn9CFT1aVFndAJe2lad1YG48WUs7D5qBtPd63
 rtayN5A+rHc8fVAZ/2+FI+mkDxLNPWNLchU5/ZnlBi0P+OyT6c7NvL874hIIDwT25JDL
 PEoR/v+L1lITtx2Ww6zmcNcRLc1gxqSEhMOqA8KDr8LwHStvBDgD3/EkwGGbA4Rs7nOl
 +jqRGmATYNWx9NUfdmVhM5zU1IgyZ9D+ZwCbqm5PfqRCXUZX1oIiQuGDeT5WReedofxL
 hzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWOKyhMY9nx+PNHgXM5qC/gBgIKBQc141NLInLFRYlk=;
 b=RTMPzxQ0h0uvsv5AYb+7BYSj9O9SiR76mam9bkHTKxN5UDNsuSHZ6dPkdh3nihClGg
 25UJ7jKvR7zKDFfhHVliE1K7vSvHvyWCpJUFstMcUGRH75qave5mgugWTvHcAXkGRS6B
 BfCA5fhtWdcNSb3ZdNfwPArJ5NpCGBK34Da6VAIAwds6sgQ5bHwgoGGGRImVtniqVAUx
 qDioM7nqs9nGpeAggi1UFWmuNDORzna5REXHPJFp0Ri+/tJRoKrUgjpB7Ncu+UN5u6qW
 I3mg/wqXbCoDKB6j3vIOmncs0vr+/xGm3soF1I/0MrhCOHUhRCB3av/MFJc0QPosVF5x
 y8Gw==
X-Gm-Message-State: AOAM53229ODum0wSsxEEk1D2a9HcmKn8Dl0Eo2Em24VIpSg0QhRDS4Wp
 B5uVfjPgW3nb4o0WCsK1Pp6lvZD6KeBvt2Ls2mc=
X-Google-Smtp-Source: ABdhPJyTvV1Mfi94notwWc8cGJ1UNdx0PypOlbOFd20Ylp5DAoJUGizmLX/xQCx7oi2+foNLigRj7fGnzP1A3CLljZo=
X-Received: by 2002:a05:6638:124d:: with SMTP id
 o13mr22007060jas.98.1605952372646; 
 Sat, 21 Nov 2020 01:52:52 -0800 (PST)
MIME-Version: 1.0
References: <4230063e-48b5-8b0c-c92c-fc3e16b5ddb4@gmail.com>
 <20201121045827.12175-1-yashsri421@gmail.com>
In-Reply-To: <20201121045827.12175-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 21 Nov 2020 10:52:41 +0100
Message-ID: <CAKXUXMzfQn9qbSLKnBn+hMs4uqiPqzESXfOPocoLmkSvOZEKRQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix and
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

On Sat, Nov 21, 2020 at 5:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Checkpatch.pl warns on non-standard signature styles.
>
> This warning usually occurs because of incorrect use of signature tags,
> e.g. tags such as 'Co-authored-by', which although seem correct, is not
> a standard signature. Its standard equivalent is 'Co-developed-by'.
>
> An evaluation over v4.13..v5.8 found 'Co-authored-by' tag used 43 times
>
> Similarly, 'Requested-by'(used 48 times) has its equivalent as
> 'Suggested-by', and so on.
>

Better but still an incomplete summary.
"and so on" is not good.

Consider a description that explains how you came to the conclusion.

Then consider presenting the count of non-standard signature tags from
v4.13..v5.8 is a simple structured form.

By the way, there is no limit on the length of a commit message as
long as you convey information in a dense form.

Also, consider to present the rationale for each replacement.
checkpatch shall explain to its user why it considers the replacement
appropriate.


Lukas

> Provide a fix by:
> 1) replacing the non-standard signature with its standard equivalent
> 2) removing the signature if it is not required
>
> Also, improve warning messages correspondingly, providing users
> suggestions to either replace or remove the signature
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: replace commit specific example with brief evaluation
>
>  scripts/checkpatch.pl | 45 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fdfd5ec09be6..23a21dc2c29a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,27 @@ our $signature_tags = qr{(?xi:
>         Cc:
>  )};
>
> +our %standard_signature_fix = (
> +       "Requested-by:" => "Suggested-by:",
> +       "Co-authored-by:" => "Co-developed-by:",
> +       "Analyzed-by:" => "Co-developed-by:",
> +       "Analysed-by:" => "Co-developed-by:",
> +       "Improvements-by:" => "Co-developed-by:",
> +       "Noticed-by:" => "Reported-by:",
> +       "Inspired-by:" => "Suggested-by:",
> +       "Verified-by:" => "Tested-by:",
> +       "Okay-ished-by:" => "Acked-by:",
> +       "Acked-for-MFD-by:" => "Acked-by:",
> +       "Reviewed-off-by:" => "Reviewed-by:",
> +       "Proposed-by:" => "Suggested-by:",
> +       "Fixed-by:" => "Co-developed-by:",
> +       "Pointed-out-by:" => "Suggested-by:",
> +       "Pointed-at-by:" => "Suggested-by:",
> +       "Suggestions-by:" => "Suggested-by:",
> +       "Generated-by:" => "remove",
> +       "Celebrated-by:" => "remove",
> +);
> +
>  our @typeListMisordered = (
>         qr{char\s+(?:un)?signed},
>         qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2794,28 @@ sub process {
>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
>
>                         if ($sign_off !~ /$signature_tags/) {
> -                               WARN("BAD_SIGN_OFF",
> -                                    "Non-standard signature: $sign_off\n" . $herecurr);
> +                               my $suggested_signature = "";
> +                               if (exists($standard_signature_fix{$sign_off})) {
> +                                       $suggested_signature = $standard_signature_fix{$sign_off};
> +                               }
> +                               if ($suggested_signature eq "") {
> +                                       WARN("BAD_SIGN_OFF",
> +                                            "Non-standard signature: $sign_off\n" . $herecurr);
> +                               }
> +                               elsif ($suggested_signature eq "remove") {
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                               "Non-standard signature: $sign_off. Please consider removing this signature tag.\n" . $herecurr) &&
> +                                       $fix) {
> +                                               fix_delete_line($fixlinenr, $rawline);
> +                                       }
> +                               }
> +                               else {
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                               "Non-standard signature: $sign_off. Please use '$suggested_signature' instead.\n" . $herecurr) &&
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
