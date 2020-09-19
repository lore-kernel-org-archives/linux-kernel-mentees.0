Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607C2C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:37:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEEEE21D42
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJJUqUns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEEEE21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 558BC2042E;
	Sat, 19 Sep 2020 18:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzdVYRWtvRxk; Sat, 19 Sep 2020 18:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DF2A61FE0A;
	Sat, 19 Sep 2020 18:37:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C30C2C088B;
	Sat, 19 Sep 2020 18:37:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECE1CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB42C86FFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2g3wWeelHl7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:37:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 620C186FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:37:01 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p9so12396877ejf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+W3x11Vqeu13cYJqp7VA+bHdI/2mlE3EUEllG/+cpoU=;
 b=oJJUqUnsKSj9jYsDTiGYU3X8IH5x6rBwsvOvE0OqFDYP5M/MejuBNpjZXvkHYjmpFP
 AROtZzeY+qjeYDbyDOg+9Smeq1mG38GSvCiz140x1y2EExd/qdfEF/bbRGs74x2QjAeI
 aXYgsIt+F/DqEd5H5La8AehP4H2eTbjWHSqsf5YDCKGPQUm1jkPf2BLe56YmhHzSeuhX
 pHK2NwZyh33l67TwZOOtPElq/82m2CN53lVNKmGxnba4DNSDryV5/kOnnKywrL1V4t4v
 6JZ31xe02u2SMp8FsaO6kjMvmcVqyuB3DmHydvb7Xsig38YTY1PErZEk74mSyYumIfR5
 iUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+W3x11Vqeu13cYJqp7VA+bHdI/2mlE3EUEllG/+cpoU=;
 b=VJtL0+vBF0tYfbK6RC9Y+Sx3E7sVG4S26Gb6VVOadrUh+JTxiVBc918kGDlos/HgW2
 R0H3tPgn86ITTL0FtrlCBbOq/zvb/d/U/4zfBnNf1GtcB8umMKDO/bj+Ejw7U+nmK6HX
 nbq4aycnmTwSOccOIRPPtpp/i3L+30CdwQ38xl1fQGcNRv9xijSmE17KLfFo4jG0pVPu
 0+o4i+IPVb0wbc+MijladAkZKq0r6IupttKuNFqMaehbzXT7aQVu+8BwO15SrS+igrTW
 40N41Pw7vKo+1w0vxs/LgsXppPBAJ5kbDTTeq2fk6KPnIcwXPcFpShFxtdskNorvdSlm
 nAVw==
X-Gm-Message-State: AOAM533m3tBzlxYXvbdd/4rPhMxbw7W9jFgxioZFRRHArxGECnm0kyb7
 J6RjonzehFU+iFRT8/A5Fyo=
X-Google-Smtp-Source: ABdhPJxRsjyfHMfcFsD+O6VrQPRmTy3NgnJKgdUmxZfKI4Sv0anKZGZPplHvYQiQbJVczeeXRMaKTg==
X-Received: by 2002:a17:906:934f:: with SMTP id
 p15mr43242079ejw.497.1600540619428; 
 Sat, 19 Sep 2020 11:36:59 -0700 (PDT)
Received: from felia ([2001:16b8:2dba:3d00:c552:323e:8340:ec83])
 by smtp.gmail.com with ESMTPSA id o15sm4925622ejr.1.2020.09.19.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 11:36:58 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 19 Sep 2020 20:36:57 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2009192033030.7901@felia>
References: <20200919081225.28624-1-dwaipayanray1@gmail.com>
 <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
 <alpine.DEB.2.21.2009191950460.7901@felia>
 <f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: extend author
 Signed-off-by check for split From: header
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



On Sat, 19 Sep 2020, Joe Perches wrote:

> On Sat, 2020-09-19 at 20:12 +0200, Lukas Bulwahn wrote:
> > 
> > On Sat, 19 Sep 2020, Joe Perches wrote:
> > 
> > > On Sat, 2020-09-19 at 13:42 +0530, Dwaipayan Ray wrote:
> > > > Checkpatch did not handle cases where the author From: header
> > > > was split into two lines. The author string went empty and
> > > > checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.
> > > 
> > > It's good to provide an example where the current code
> > > doesn't work.
> > > 
> > 
> > Joe, as this is a linux-kernel-mentees patch, we discussed that before 
> > reaching out to you; you can find Dwaipayan's own evaluation here:
> > 
> > https://lore.kernel.org/linux-kernel-mentees/CABJPP5BOTG0QLFSaRJTb2vAZ_hJf229OAQihHKG4sYd35i_WMw@mail.gmail.com/
> > 
> > Dwaipayan, Joe's comment is still valid; it would be good to describe
> > the reasons why patches might have split lines (as far as see, long 
> > encodings for non-ascii names).
> > 
> > I will run my own evaluation of checkpatch.pl before and after patch 
> > application on Monday and then check if I can confirm Dwaipayan's results.
> > 
> > > It likely would be better to do this by searching forward for
> > > any extension lines after a "^From:' rather than searching
> > > backwards as there can be any number of extension lines.
> > > 
> > 
> > Just to sure what you are talking about...
> > 
> > You mean just to access the next line through the lines array, rather 
> > than using prevheader and trying to decode that one line twice.
> > 
> > I agree the logic is a bit redundant and complicated at the moment.
> > 
> > Once prevheader is non-empty, it already clear that author is '' and 
> > prevheader decodes with that match, because that is the only way to
> > make prevheader non-empty in the first place; at least as far I see it 
> > right now.
> 
> Yeah, something like this (completely untested):
> ---
>  scripts/checkpatch.pl | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3e474072aa90..2c710d05b184 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2679,9 +2679,13 @@ sub process {
>  		}
>  
>  # Check the patch for a From:
> -		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> +		if ($line =~ /^From:\s*(.*)/i) {
>  			$author = $1;
> -			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> +			my $curline = $linenr;
> +			while (defined($rawlines[$curline] && $rawlines[$curline++] =~ /^ \s*(.*)/) {
> +				$author .= $1;
> +			}
> +			$author = encode("utf8", $author) if ($author =~ /=\?utf-8\?/i);
>  			$author =~ s/"//g;
>  			$author = reformat_email($author);
>  		}
>

Yeah, I get how you would like to see that being implemented. I will work 
with Dwaipayan to get that properly implemented, properly described and 
tested.

But let us keep the fun of that task to Dwaipayan... that is what a 
mentorship is all about :)

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
