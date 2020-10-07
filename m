Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F386C4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 06:39:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D769D206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 06:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC3ZS5wj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D769D206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3ABE222D24;
	Wed,  7 Oct 2020 06:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ve9xMRn5Ml3; Wed,  7 Oct 2020 06:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82CAA22636;
	Wed,  7 Oct 2020 06:39:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64BB6C016F;
	Wed,  7 Oct 2020 06:39:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44077C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 06:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2046222D0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 06:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3pcsg3kzECR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 06:39:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id CF3A522636
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 06:39:05 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o8so1265818otl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65wdk22RjIWoWBAAwwVf87Vz5k90m0lNrkyZZlukbas=;
 b=AC3ZS5wjwlkpoaJpEXgLXDYSjewMbryGkPvbrTzGb0hkzoK50+4TazN6AmjZzX8/Ik
 GkcirNPR6kOV9Q37ivs+uN55UgoZkADZs/r2oQqgbrUS/UI8ZcIhdf5yDPIcBFaZM2Hx
 F1OAndoWfG9nfoT/1RyJkxET4i/bfqW5fDwYL085hvGW8NPcVZmXlzH0jUFFzYD3Ebh0
 eAiLXuT530DKDxRLkdLS8c9RKUXBwc3AYAxGqKkgAQPI4Ib2wILvBUHR9HQ9mhwHyAeR
 HmoBOaj1BSVbiyechD2Yrtujn2nWcotr0ghc3sHttsWKVWFvM1HcQ5voyqGrFKjnQ2r2
 21Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65wdk22RjIWoWBAAwwVf87Vz5k90m0lNrkyZZlukbas=;
 b=X6aiJOTzG6+o2HDG1K194IDahj/yFmnb5oC3oiguf1K1qsn8yN/TVqxWUWscqUurJE
 BTH98SNS2Szr14+NLiWi8tpPDFWJ5kP31THxvXXu4fNcTinA+G4WD0RWUKj7oFn7xP5n
 JjCglTpWp8eQ5RQKcETQNHloeE2GOhg6fpMpprsv9olAGWD8liorcHyCaZ7xTBGa0uAv
 QdXzw/Xj39UQjcP9RuCpLF35Xfugk5xJ7kpzXbDZGN2wIc/8SJJVbr2qncFPwLKJa+SJ
 U2n15UuOQ4oNBRt9n04jXDcJ17PGQuO1kJsIZ+bcgVO+PyJ41vumS2X6Q3FfJFC8jrak
 WnFA==
X-Gm-Message-State: AOAM533xy5QmwiSJaivFhzOyiXsi3Lh3esDvGUnoWvccCgQmsSZ7kG00
 4R8fYmJAruyG+lH/UKV9s4tPyC5agS6UxqwbV0g=
X-Google-Smtp-Source: ABdhPJx7bBjdXGYknoGBdkdYHAQ9Fhfp8QfvR5RRX5bvxUp4jahS00i77Lx6HV9Z3zHbCEWo7EvFz9PJYTirXDQczwk=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr924413oth.215.1602052744828; 
 Tue, 06 Oct 2020 23:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201007063315.41585-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201007063315.41585-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 7 Oct 2020 12:08:42 +0530
Message-ID: <CABJPP5AEELQz0t2+34xYQOJ5e5nQzTUUU6UT8ZH0fqm-tacOmg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new warnings
	to author signoff checks.
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

On Wed, Oct 7, 2020 at 12:03 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
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
> Previously, the values assumed by $authorsignoff were either 0 or 1
> to indicate whether a proper sign off by author is present.
> Extended the checks to handle four new cases.
>
> $authorsignoff values now denote the following:
>
> 0: Missing sign off by patch author.
>
> 1: Sign off present and identical.
>
> 2: Addresses and names match, but comments differ.
>    "James Watson(JW) <james@gmail.com>", "James Watson <james@gmail.com>"
>
> 3: Addresses match, but names are different.
>    "James Watson <james@gmail.com>", "James <james@gmail.com>"
>
> 4: Names match, but addresses are different.
>    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
>
> 5: Names match, addresses excluding subaddress details (RFC 5233) match.
>    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 93 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 77 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31624bbb342e..6e0a0d4603d0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1163,10 +1163,10 @@ sub parse_email {
>                 }
>         }
>
> +       $comment = trim($comment);
>         $name = trim($name);
>         $name =~ s/^\"|\"$//g;
> -       $name =~ s/(\s*\([^\)]+\))\s*//;
> -       if (defined($1)) {
> +       if ($name =~ s/(\s*\([^\)]+\))\s*//) {
>                 $name_comment = trim($1);
>         }
>         $address = trim($address);
> @@ -1181,10 +1181,12 @@ sub parse_email {
>  }
>
>  sub format_email {
> -       my ($name, $address) = @_;
> +       my ($name, $name_comment, $address, $comment) = @_;
>
>         my $formatted_email;
>
> +       $name_comment = trim($name_comment);
> +       $comment = trim($comment);
>         $name = trim($name);
>         $name =~ s/^\"|\"$//g;
>         $address = trim($address);
> @@ -1197,9 +1199,9 @@ sub format_email {
>         if ("$name" eq "") {
>                 $formatted_email = "$address";
>         } else {
> -               $formatted_email = "$name <$address>";
> +               $formatted_email = "$name$name_comment <$address>";
>         }
> -
> +       $formatted_email .= "$comment";
>         return $formatted_email;
>  }
>
> @@ -1207,17 +1209,23 @@ sub reformat_email {
>         my ($email) = @_;
>
>         my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
> -       return format_email($email_name, $email_address);
> +       return format_email($email_name, $name_comment, $email_address, $comment);
>  }
>
>  sub same_email_addresses {
> -       my ($email1, $email2) = @_;
> +       my ($email1, $email2, $match_comment) = @_;
>
>         my ($email1_name, $name1_comment, $email1_address, $comment1) = parse_email($email1);
>         my ($email2_name, $name2_comment, $email2_address, $comment2) = parse_email($email2);
>
> +       if ($match_comment != 1) {
> +               return $email1_name eq $email2_name &&
> +                      $email1_address eq $email2_address;
> +       }
>         return $email1_name eq $email2_name &&
> -              $email1_address eq $email2_address;
> +              $email1_address eq $email2_address &&
> +              $name1_comment eq $name2_comment &&
> +              $comment1 eq $comment2;
>  }
>
>  sub which {
> @@ -2347,6 +2355,7 @@ sub process {
>         my $signoff = 0;
>         my $author = '';
>         my $authorsignoff = 0;
> +       my $author_sob = '';
>         my $is_patch = 0;
>         my $is_binding_patch = -1;
>         my $in_header_lines = $file ? 0 : 1;
> @@ -2674,9 +2683,37 @@ sub process {
>                 if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>                         $signoff++;
>                         $in_commit_log = 0;
> -                       if ($author ne '') {
> -                               if (same_email_addresses($1, $author)) {
> +                       if ($author ne ''  && $authorsignoff != 1) {
> +                               if (same_email_addresses($1, $author, 1)) {
>                                         $authorsignoff = 1;
> +                               } else {
> +                                       my $ctx = $1;
> +                                       my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +                                       my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +                                       if ($email_address eq $author_address && $email_name eq $author_name) {
> +                                               $author_sob = $ctx;
> +                                               $authorsignoff = 2;
> +                                       } elsif ($email_address eq $author_address) {
> +                                               $author_sob = $ctx;
> +                                               $authorsignoff = 3;
> +                                       } elsif ($email_name eq $author_name) {
> +                                               $author_sob = $ctx;
> +                                               $authorsignoff = 4;
> +
> +                                               my $address1 = $email_address;
> +                                               my $address2 = $author_address;
> +
> +                                               if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> +                                                       $address1 = "$1$2";
> +                                               }
> +                                               if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> +                                                       $address2 = "$1$2";
> +                                               }
> +                                               if ($address1 eq $address2) {
> +                                                       $authorsignoff = 5;
> +                                               }
> +                                       }
>                                 }
>                         }
>                 }
> @@ -2733,7 +2770,7 @@ sub process {
>                         }
>
>                         my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
> -                       my $suggested_email = format_email(($email_name, $email_address));
> +                       my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
>                         if ($suggested_email eq "") {
>                                 ERROR("BAD_SIGN_OFF",
>                                       "Unrecognized email address: '$email'\n" . $herecurr);
> @@ -2743,9 +2780,9 @@ sub process {
>                                 $dequoted =~ s/" </ </;
>                                 # Don't force email to have quotes
>                                 # Allow just an angle bracketed address
> -                               if (!same_email_addresses($email, $suggested_email)) {
> +                               if (!same_email_addresses($email, $suggested_email, 0)) {
>                                         WARN("BAD_SIGN_OFF",
> -                                            "email address '$email' might be better as '$suggested_email$comment'\n" . $herecurr);
> +                                            "email address '$email' might be better as '$suggested_email'\n" . $herecurr);
>                                 }
>                         }
>
> @@ -6891,9 +6928,33 @@ sub process {
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
> +                       # 2 -> names and addresses match, comments mismatch
> +                       # 3 -> addresses match, names different
> +                       # 4 -> names match, addresses different
> +                       # 5 -> names match, addresses excluding subaddress details (refer RFC 5233) match
> +
> +                       my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
> +
> +                       if ($authorsignoff == 0) {
> +                               ERROR("NO_AUTHOR_SIGN_OFF",
> +                                     "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +                       } elsif ($authorsignoff == 2) {
> +                               CHK("NO_AUTHOR_SIGN_OFF",
> +                                   "From:/Signed-off-by: email comments mismatch: $sob_msg\n");
> +                       } elsif ($authorsignoff == 3) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                    "From:/Signed-off-by: email name mismatch: $sob_msg\n");
> +                       } elsif ($authorsignoff == 4) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                    "From:/Signed-off-by: email address mismatch: $sob_msg\n");
> +                       } elsif ($authorsignoff == 5) {
> +                               WARN("NO_AUTHOR_SIGN_OFF",
> +                                    "From:/Signed-off-by: email subaddress mismatch: $sob_msg\n");
> +                       }
>                 }
>         }
>
> --
> 2.27.0
>

Hi,
I needed to change a bit in a few subroutines which trimmed off
the comments. Comments now appear in the formatted email.
The usage is also refactored so that it doesn't cause any undesired
effects.

Coming back to the signoff check, now email comments are also
compared.

Cases like:
"Dwaipayan Ray(Dwai) <dwaipayanray1@gmail.com>" and
"Dwaipayan Ray <dwaipayanray1@gmail.com>", now generate
a --strict CHK.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
