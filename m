Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4456C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 14:16:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6A42076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 14:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqdWaDHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6A42076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A09B786C4D;
	Mon, 12 Oct 2020 14:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0puC7WLXmuF; Mon, 12 Oct 2020 14:16:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F310886C34;
	Mon, 12 Oct 2020 14:16:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDE38C07FF;
	Mon, 12 Oct 2020 14:16:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE7F4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9869E86C40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXXPSEWc77JU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:16:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 85DCF86C34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:16:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y12so14018746wrp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OInMApTrSajaQRQFRFaHHuUcxdngdHyWKzS2Of4y26w=;
 b=OqdWaDHeGGLCqgMU0s1QUAhJwCoXWR7goUecYYUV1R7UAPOuMnJE2EDBnFG1AouVA5
 bTv/BN99pSSGacxBMVMCFfXT2Vscv30QTyryoJv9h+nTwnpXM+sFqu1Qr2/HHw6pro2m
 u9/tkVZ1QiKX7qSSxWDdpgb0EmfuEPUOz9TJ8BoQEkx7/2M3oPrknWW70QgYxbEhIWub
 Fy8U3q3DPY97RXjOu8lBOHZ8aihGiQmFyqVj0jViPb7zS/nSvTqwBCzpi1sCc2Zxbg6N
 HXb9XfSK7akQZHeLfRethvLZG8dg1rUzjyK3DvNGNqy3jEZgA7anSLbKITW76D3Gxh5J
 4eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OInMApTrSajaQRQFRFaHHuUcxdngdHyWKzS2Of4y26w=;
 b=TLgUA9Fl0C/KzEYK381VaTkk/GyXydSR3nFQf0BP/8rhJqkqUOX9qg1zuZU8y+UosZ
 BJxr03ZXZD/qZY4rl2eQvjTwzfMnHkGh59NfNGJgBciUkiMhp8gUxbRbYAdPSTx6gXP6
 hVCAd6NPDQmASUwhfI3uGzv0kQYmgHzc5ZRx+reUKN4GoWQ95J0crjcyXp3yFEC911tI
 GoCqrazpk3Nuoywy0UdvmM09JyGK6BYpkqL38SFZBh5TAHi7fdJewgHjjwWoOm/JW2nJ
 p9YkYnmlmzlmMtZCWF5NB4Cjoo4ncpzdaEKmf6ZP9+UMhdQiEoQd6/KBBkb7EFNkGs7A
 EKvw==
X-Gm-Message-State: AOAM533LmqVvNzctgGLqIlyP+4KHEMH7g+G/ILiuW4dmWz4cbay2amBL
 QUBuA7qwesyNZUSDP/MGNeE=
X-Google-Smtp-Source: ABdhPJzP9goTvjOWkThIqN0Zn1EcOGTBEGSneY+CxFIYRR6GHAGz10uK1MjsZwRSEBuQHkI94sYEpg==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr30745031wrq.106.1602512191918; 
 Mon, 12 Oct 2020 07:16:31 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
 by smtp.gmail.com with ESMTPSA id d23sm23268371wmb.6.2020.10.12.07.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:16:31 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 16:16:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <5a3fc45f-e5d7-da3d-4b4b-2a23512ff8de@gmail.com>
Message-ID: <alpine.DEB.2.21.2010121612150.6487@felia>
References: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
 <63053585d41ff81cdaad6cb727eb83d81207041a.camel@perches.com>
 <5a3fc45f-e5d7-da3d-4b4b-2a23512ff8de@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Mon, 12 Oct 2020, Ujjwal Kumar wrote:

> On 12/10/20 11:47 am, Joe Perches wrote:
> > On Mon, 2020-10-12 at 11:19 +0530, Ujjwal Kumar wrote:
> >> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> >> files. The script leverages filename extensions and its path in
> >> the repository to decide whether to allow execute permissions on
> >> the file or not.
> >>
> >> Based on current check conditions, a perl script file having
> >> execute permissions, without '.pl' extension in its filename
> >> and not belonging to 'scripts/' directory is reported as ERROR
> >> which is a false-positive.
> >>
> >> Adding a shebang check along with current conditions will make
> >> the check more generalised and improve checkpatch reports.
> >> To do so, without breaking the core design decision of checkpatch,
> >> we can fetch the first line from the patch itself and match it for
> >> a shebang pattern.
> >>
> >> There can be cases where the first line is not part of the patch.
> > 
> > For instance: a patch that only changes permissions
> > without changing any of the file content.
> > 
> >>
> >> In that case there may be a false-positive report but in the end we
> >> will have less false-positives as we will be handling some of the
> >> unhandled cases.
> > 
> >> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >> ---
> >> Apologies, I forgot to include linux-kernel@vger.kernel.org so I'm
> >> now resending.
> >>
> >>  scripts/checkpatch.pl | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> >> @@ -1795,6 +1795,23 @@ sub get_stat_here {
> >>  	return $herectx;
> >>  }
> > 
> > First some style trivia:
> > 
> >> +sub get_shebang {
> >> +	my ($linenr, $realfile) = @_;
> >> +	my $rawline = "";
> >> +	my $shebang = "";
> >> +
> >> +	$rawline = raw_line($linenr, 3);
> >> +	if (defined $rawline &&
> >> +		$rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
> > 
> > alignment to open parenthesis please
> > 
> >> +		if (defined $1 && $1 == 1) {
> >> +			$shebang = raw_line($linenr, 4);
> >> +			$shebang = substr $shebang, 1;
> > 
> > parentheses around substr please.
> > 
> >> +		}
> >> +	}
> >> +
> >> +	return $shebang;
> >> +}
> > 
> > And some real notes:
> > 
> > $realfile isn't used in this function so there doesn't
> > seem to be a reason to have it as an function argument.
> > 
> >> +
> >>  sub cat_vet {
> >>  	my ($vet) = @_;
> >>  	my ($res, $coded);
> >> @@ -2680,7 +2697,9 @@ sub process {
> >>  # Check for incorrect file permissions
> >>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
> > 
> > probably better here to use a capture group for the permissions
> > 
> > 		if ($line =~ /^new (?:file )?mode (\d+)$/) {
> > 			my $mode = substr($1, -3);
> 
> This
> 
> > 
> >>  			my $permhere = $here . "FILE: $realfile\n";
> >> +			my $shebang = get_shebang($linenr, $realfile);
> >>  			if ($realfile !~ m@scripts/@ &&
> > 
> > Maybe remove the $realfile directory test as
> > there are many source files that are not scripts
> > in this directory and its subdirectories.
> 
> this
> 
> > 
> >> +			    $shebang !~ /^#!\s*(\/\w)+.*/ &&
> > 
> > unnecessary capture group
> > 
> > and add
> > 
> > 			   $mode =~ /[1357]/ &&
> 
> this
> 
> > 
> >>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {
> > 
> > No need for a a capture group here either. (existing defect)
> 
> and this.
> 
> > 
> >>  				ERROR("EXECUTE_PERMISSIONS",
> >>  				      "do not set execute permissions for source files\n" . $permhere);
> > 
> > 
> > 
> 
> Should these new changes go as a separate patch or can they be
> included in the next iteration of this patch?
> 
>

Ujjwal, please consider the following 'strategy':

- Send one patch to clean up the existing implementation as Joe requested.

With those 'credit points' for cleaning up the implementation, you then:

- Send another clean patch for the additional functionality you propose

We can probably easily accept the first cleanup, and then dig into the 
review of the additional functionality.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
