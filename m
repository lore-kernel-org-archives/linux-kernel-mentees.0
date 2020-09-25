Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED62C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:35:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85FE235FA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvZyUeG/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85FE235FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 502B186BE2;
	Fri, 25 Sep 2020 07:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ou4vjipL3P7S; Fri, 25 Sep 2020 07:35:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0F6886BBD;
	Fri, 25 Sep 2020 07:35:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EBD9C0889;
	Fri, 25 Sep 2020 07:35:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6052C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D292286D3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiVo5pvD8UDN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 481D286D3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:35:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id n22so1499485edt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PZDUbVMaWJvrs3bEIQzP7Ps0VoFNy9rjM+z7j3G6B2s=;
 b=LvZyUeG/KrcOQpKfPvMrOagxbn0wHU98VKl9gmwc8TXIaPjtU+66m609QkhKiYGHGP
 dBpM3A7oQzFBS6L3bN/79hpJDCkEh8HYhOjfkqce2dNmo3gz4U01ov0rojKgqJC0ITz4
 2lcCOj4a7PIHPGqCSnMDiIkCiqEucOhosVdKDr8Cu7eySteS1IdzxFqMUs8WUBphqIeZ
 5MYWEtaJRKqOfAaLay+rOICaMjxkb/SnJQTnSWbspDCUxYqWZszZceePodv8FoxKWDKM
 ZHLHp5sjS9M7hP8/hHA8hvqfjtinuEdDESnBMUxzPEdYWHmmsUQm1C0DdWKm7tiwBg0X
 OkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PZDUbVMaWJvrs3bEIQzP7Ps0VoFNy9rjM+z7j3G6B2s=;
 b=UHM/qBVpEofjfimgQtSUFmrADcM0mfgafOqirhnqj7NSXcV3X9A9xnm5Gz9oI1INmh
 YLNnpWyYkBNskhACR9evBlEHfTzD2ACEJT4WOt3vbPL5PqGq7v6yXVqofw8BYDolPqzx
 uHmka2ALViwVBj2h5oNyC5W8Yx+0g3UNdkTRGOvNvWoKV63gZQiz4cl2/G9V+Lu8WKi+
 5ul1MVxWN/pqNEc/ZE4mWfQSTzOIDghDEdCnG/AoENaQuz4aZ3/kLxbWic4cmq00q3Fi
 eGk3uzOx6Mb6yyKhytE+8uO0iRxFGfSPf19pO+i+b9k0P63kpVgn5QI1/A4RLpf8TYCA
 uzgA==
X-Gm-Message-State: AOAM531apmpgVYNpje/a6YtrOBvl7Lb9kAwSXSB8XrE02CuPexiTlx5l
 8c8/KZm4ulcqkwpjMwm+7kY=
X-Google-Smtp-Source: ABdhPJzvrm2eT2RNusukEauUVE11YlzlUv9sLGXU/WEO+8KQMSmG9z+EPxhVjpSr4rL0icHFQCGaEQ==
X-Received: by 2002:aa7:d6ce:: with SMTP id x14mr2658908edr.359.1601019339623; 
 Fri, 25 Sep 2020 00:35:39 -0700 (PDT)
Received: from felia ([2001:16b8:2dc8:d00:2cef:8073:5504:c57f])
 by smtp.gmail.com with ESMTPSA id v18sm1192183edb.26.2020.09.25.00.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 00:35:38 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 25 Sep 2020 09:35:37 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009250930570.5992@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1966945874-1601019338=:5992"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1966945874-1601019338=:5992
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 25 Sep 2020, Dwaipayan Ray wrote:

> > Let us try to put some systematic structure into this handling of the
> > NO_AUTHOR_SIGN_OFF.
> >
> > There are basically two aspects to consider:
> >
> > - which classes are potential mismatches can we potentially observe?
> >
> > - which level of severity do we assign to each class of mismatch?
> >
> > To the first point, you started with some initial classes above.
> >
> >   0) same name, same address (no mismatch)
> >   1) same name, different address
> >      subclasses: (how 'different' address?)
> >      - email address differ by valid difference, e.g., extensions that
> >        will go to the same inbox, e.g.,  the xyz+fds extension in mail
> >        addresses. (that is your class 3, right?)
> >      - two email addresses that are known to belong to the same individual
> >        - known because of .mailmap
> >        - known otherwise?
> >   2) different name, same address
> >      subclasses: (how 'different' name?)
> >      - examples:
> >        - Firstname, Lastname (but middle-name initials differ)
> >        - special "regional" characters, like ü vs. ue, etc.
> >        - firstname and lastname are reverted etc.
> >   3) different name, different address (but still we believe it "matches")
> >      combinations of subclasses of 1) and 2), which we want to consider.
> >
> > Then, to the second question:
> >
> > So, these different classes we can think of and "assign" different
> > severities that checkpatch.pl can use.
> >
> > Checkpatch.pl already has four levels:
> >
> > three severity reporting levels: ERROR, WARN, CHECK, and
> > the level _do not report_ (which is implemented by just ignoring some kind
> > of difference).
> >
> > I think a lot of discussion will be around what severity to assign to
> > which class above, and in some way, long-term maintainers have a larger
> > say than we do here.
> >
> > So, let us first modify checkpatch.pl to identify the various classes
> > above, maybe just starting very basic, with different name, same address
> > and same name, different address and run it over the commit range and see
> > which examples show up and how often.
> >
> > For now, we first just use checkpatch.pl to identify the different types
> > and refine them into subclasses; then, we can discuss with severity should
> > be assigned to which type of mismatch.
> >
> > The second question should not invalidate our data collection and
> > identification of subclasses, though.
> >
> > Does that help? What do you think?
> >
> >
> > Lukas
> 
> Yes, that should help I think. Currently checkpatch is very vague
> about Author sign offs, so subclassing it will really be helpful.
> But at the same point I don't think it should become
> too complex either.

Agree, that is where the evaluation will help (what is really happening, 
what do we need to consider) and the severity comes into play (if we 
consider all subclasses of same severity, we do not need to differentiate 
between them.)

> 
> I have already prepared a patch for the basic two classes:
> 1) same name, different address
> 2) same address, different name
> 
> It would be great to have your feedback on this.

Okay, I suggest to run this script on a larger set of commits and see.

Probably, you can speed it your evaluation with checkpatch.pl by 
restricting it to the AUTHOR_SIGN_OFF type. I will try that over the 
weekend as well.

Lukas

> 
> ---
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..e23e753fcaf0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1210,14 +1210,22 @@ sub reformat_email {
>   return format_email($email_name, $email_address);
>  }
> 
> -sub same_email_addresses {
> +sub same_mail_check {
>   my ($email1, $email2) = @_;
> 
>   my ($email1_name, $name1_comment, $email1_address, $comment1) =
> parse_email($email1);
>   my ($email2_name, $name2_comment, $email2_address, $comment2) =
> parse_email($email2);
> 
> - return $email1_name eq $email2_name &&
> -        $email1_address eq $email2_address;
> + my $same_name = $email1_name eq $email2_name;
> + my $same_address= $email1_address eq $email2_address;
> +
> + return ($same_name, $same_address);
> +}
> +
> +sub same_email_addresses {
> + my ($same_name, $same_address) = same_mail_check(@_);
> +
> + return $same_name && $same_address;
>  }
> 
>  sub which {
> @@ -2347,6 +2355,7 @@ sub process {
>   my $signoff = 0;
>   my $author = '';
>   my $authorsignoff = 0;
> + my $authorsignerr = '';
>   my $is_patch = 0;
>   my $is_binding_patch = -1;
>   my $in_header_lines = $file ? 0 : 1;
> @@ -2677,6 +2686,13 @@ sub process {
>   if ($author ne '') {
>   if (same_email_addresses($1, $author)) {
>   $authorsignoff = 1;
> + } else {
> + my ($same_name, $same_address) = same_mail_check($1, $author);
> + if($same_name) {
> + $authorsignerr = "ADDRESS_MISMATCH:${1}";
> + } elsif ($same_address) {
> + $authorsignerr = "NAME_MISMATCH:${1}";
> + }
>   }
>   }
>   }
> @@ -6891,8 +6907,16 @@ sub process {
>   ERROR("MISSING_SIGN_OFF",
>         "Missing Signed-off-by: line(s)\n");
>   } elsif (!$authorsignoff) {
> - WARN("NO_AUTHOR_SIGN_OFF",
> -      "Missing Signed-off-by: line by nominal patch author '$author'\n");
> + if($authorsignerr =~ /^NAME_MISMATCH:(.*)/) {
> + WARN("NO_AUTHOR_SIGN_OFF",
> +      "Author name mismatch: 'From: $author' != 'Signed-off-by: $1'\n");
> + } elsif ($authorsignerr =~ /^ADDRESS_MISMATCH:(.*)/) {
> + WARN("NO_AUTHOR_SIGN_OFF",
> +      "Author email address mismatch: 'From: $author' !=
> 'Signed-off-by: $1'\n");
> + } else {
> + WARN("NO_AUTHOR_SIGN_OFF",
> + "Missing Signed-off-by: line by nominal patch author '$author'\n");
> + }
>   }
>   }
> ---
> 
> Thanks,
> Dwaipayan.
> 
--8323329-1966945874-1601019338=:5992
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1966945874-1601019338=:5992--
