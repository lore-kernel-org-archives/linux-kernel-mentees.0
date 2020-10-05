Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BADC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:19:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D73120639
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGr+MFB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D73120639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E026320395;
	Mon,  5 Oct 2020 06:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIYxW+KkUAyV; Mon,  5 Oct 2020 06:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC20720021;
	Mon,  5 Oct 2020 06:19:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E1B3C016F;
	Mon,  5 Oct 2020 06:19:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A208CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A81A87033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbDofhoAlQBz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8310187032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:19:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c8so7986152edv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cGUYcTXxMfAtG3/qeBMEp1uWZ9jOPn1w/j9Mzda72fI=;
 b=DGr+MFB0+QPrxTOZLho6Nm3giYqtbGjYDZPzj4cAYElVzQzrsrVlS39999vLFqtYJO
 pglt+zyhaYTuG6kgqWJ+LfTlyX6xk/I5A5aRLBhlcBL3oyKptsu30nZPCdm+H0uZxWhX
 uoD2Nu3gQwVQRZUubbwYuG1yZJZOYBY8h4TtgSgA4Ui5FtATYwv2Mn+golIh4PFM8qcb
 zq0zkAN7kTVqNnUt9+++BEu2BAd4mRXhEyWQvHkC/4nuoYr1YHvRXRShsu1SORf+S5NY
 OZa55HhaA+pr15PVtxeFHUL5kM+PPV88UhcQ18K20MVcUglLRKYQr1g/ixywTI0tljEc
 Fsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cGUYcTXxMfAtG3/qeBMEp1uWZ9jOPn1w/j9Mzda72fI=;
 b=PO3WJ2o0irppVuBWNBOE4/sHeBPy68BHy1IxIOzr9WQbM48Or1AOUGEhNuT1nW7sut
 k+ZWJ4RgR+nctMtVVwW5GgoY8ls3IJuLsPL5YINWM43fBXMfO8XYVRjHcr6kX1JJhBuw
 f3Yk2JxAfp4xeUhx+4M4l6ZLC/XgyOCjZjYL2g2GHn8T5SuD1ofHhwNlfW7IaSaeGfwE
 OIlZjwykMWiXgt4YZW19LiFF72EhVf7APiLUUl5tPCsIc8/PmJ8NNi4YgWBZtRJSoFIJ
 I0KqePZdR26iMjMY6fEt3PYB8YUpZ/8ytfH60nfUKYK+f7iOeySYGyn7TnPhS0VWa0na
 wjlQ==
X-Gm-Message-State: AOAM533V7RKkpou4zVPo0WAmsI80295j1I8nRvHQKYR2/eaIuh4KLCCF
 d5DLj9CGIVY+jnZy41Pwdt2+3M5jOBd5nuZ1
X-Google-Smtp-Source: ABdhPJxebOhL98OLqwW/X9R4fVS7FeBM1AVazD/F+nAczGrxrUw2JvioW1ZKVE5SCuGZQqxiuxSZCA==
X-Received: by 2002:a50:fb16:: with SMTP id d22mr6154488edq.255.1601878767988; 
 Sun, 04 Oct 2020 23:19:27 -0700 (PDT)
Received: from felia ([2001:16b8:2dcc:7300:fc41:427:81ae:8ef0])
 by smtp.gmail.com with ESMTPSA id dt8sm7022746ejc.113.2020.10.04.23.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 23:19:27 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 5 Oct 2020 08:19:26 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20201004143812.117455-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010050811200.6202@felia>
References: <20201004143812.117455-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new warnings
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



On Sun, 4 Oct 2020, Dwaipayan Ray wrote:

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

Dwaipayan, I think it a good patch to start the discussion.

Feel free to send this to Joe and lkml.
 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 57 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31624bbb342e..80feb15f93cb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2347,6 +2347,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $authorsignoff_ctx = '';
>  	my $is_patch = 0;
>  	my $is_binding_patch = -1;
>  	my $in_header_lines = $file ? 0 : 1;
> @@ -2674,9 +2675,34 @@ sub process {
>  		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>  			$signoff++;
>  			$in_commit_log = 0;
> -			if ($author ne '') {
> +			if ($author ne ''  && $authorsignoff != 1) {
>  				if (same_email_addresses($1, $author)) {
>  					$authorsignoff = 1;
> +				} else {
> +					my $ctx = $1;
> +					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +					if($email_address eq $author_address) {
> +						$authorsignoff_ctx = $ctx;
> +						$authorsignoff = 2;
> +					} elsif ($email_name eq $author_name) {
> +						$authorsignoff_ctx = $ctx;
> +						$authorsignoff = 3;
> +
> +						my $address1 = $email_address;
> +						my $address2 = $author_address;
> +
> +						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address1 = $1.$2;
> +						}
> +						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address2 = $1.$2;
> +						}
> +						if($address1 eq $address2) {
> +							$authorsignoff = 4;
> +						}
> +					}
>  				}
>  			}
>  		}
> @@ -6891,9 +6917,32 @@ sub process {
>  		if ($signoff == 0) {
>  			ERROR("MISSING_SIGN_OFF",
>  			      "Missing Signed-off-by: line(s)\n");
> -		} elsif (!$authorsignoff) {
> -			WARN("NO_AUTHOR_SIGN_OFF",
> -			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +		} elsif ($authorsignoff != 1) {
> +			# authorsignoff values:
> +			# 0 -> missing sign off
> +			# 1 -> sign off present
> +			# 2 -> address matches, name different
> +			# 3 -> name matches, address different
> +			# 4 -> name matches, address matches without extension
> +
> +			my $ctx_msg = "'Signed-off-by: $authorsignoff_ctx' should be:\n'Signed-off-by: $author'";
> +
> +			if($authorsignoff == 0) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Missing Signed-off-by: line by nominal patch author '$author'\n");

I think in this case, we could actually turn this into an ERROR; now that 
we have the refined cases (2,3,4) on which we would just warn or 'note' 
with --strict checks.

Send it as is to Joe Perches and lkml and I will repeat my comment on that 
mail and we will discuss it with Joe.

Lukas

> +			}
> +			elsif($authorsignoff == 2) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Author name mismatch:\n$ctx_msg\n");
> +			}
> +			elsif($authorsignoff == 3) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Author address mismatch:\n$ctx_msg\n");
> +			}
> +			elsif($authorsignoff == 4) {
> +				CHK("NO_AUTHOR_SIGN_OFF",
> +					"Author mail extension mismatch:\n$ctx_msg\n");
> +			}
>  		}
>  	}
>  
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
