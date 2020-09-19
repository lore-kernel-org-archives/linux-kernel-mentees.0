Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF1DC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:12:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC1C21741
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 18:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9J2UKcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC1C21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8B588749E;
	Sat, 19 Sep 2020 18:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UP-Xn1kWA--N; Sat, 19 Sep 2020 18:12:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3305D8749D;
	Sat, 19 Sep 2020 18:12:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 071E2C088B;
	Sat, 19 Sep 2020 18:12:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF02C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0607F8749E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9LYkEgOqcZF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 011B68749D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 18:12:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s12so8719934wrw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=igZ3yuYSihjkAl8l2bbx70F4SPOMsCwAFAVFNrs+xjw=;
 b=M9J2UKcqidPe+jOkl4EQ5aOT45tzxn55SdpbkqbqeMy0CNq/MPdy2AHaIN67udH1gF
 /NbLTLJs/HFhGhVpmYi6vAB1M0UdoegvCYl8qaDp4+OgbFkXAuIJG+xGvzp6Z+CPYtL3
 hbOR2B0a+EY/taGitXQNcz3VT3PM3L16Fji9w/VXwJdPKtDcP1JXJuIvhnvHGMkdMe0s
 bI84sx3EhfbJuVg2L1l/ACOpZ9U4JZxtSi5fEDldiVmolCMbam1wGHnfjXvP1fZF9tJ8
 du5aXRmtio3bbjhMcII3JrHvy+uqteC/09tGQhERC7OeJJYNCLiIzdO5vQg0tTPIFmob
 TwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=igZ3yuYSihjkAl8l2bbx70F4SPOMsCwAFAVFNrs+xjw=;
 b=DqCUL8F+NO/k9+8zm/yb1XCrtDorvkMoqKQ2IuV4sP+9c0F+f3O1BfUNumIfGDlm41
 z/P0lnehmbo01O1YQE0l4LCJnd7UdEIEdNmMQDvR/wrCvtoiZl/1NGKVLwO8PZBoya0Q
 XtyBwpTUzq4FZDpUhozdHjx0j9sVTdEVvwcHfjVocwH6PJUMgL6+csjkgcdX1NBcipTY
 ACUbcQ7Sv3XfCBnxfkt1eA+185MUC8Zc5x08183/CYn5OK8QBSu1346t/01fT/mWF5Ua
 SWCHWxH9IO6IOgyVU2IcTzDK8FVZcsWFsLSjHMuoPSCSeH7nMcn+755fx76UHJcplcO/
 zPQQ==
X-Gm-Message-State: AOAM533iPTLBXFmImMWZYwL5qYyhUavagrqI7uhSLB2ZHbNCn/HYR6sW
 OiPt/tpwAn67rV5oaeCoUP4=
X-Google-Smtp-Source: ABdhPJyn10xbEE/jNHZooWdw5LV/avSOktcDWkNd9VlNb+zyIXOMSvcb9TpcLxgH419p4IBX59TwvA==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr16508040wrq.352.1600539172424; 
 Sat, 19 Sep 2020 11:12:52 -0700 (PDT)
Received: from felia ([2001:16b8:2dba:3d00:c552:323e:8340:ec83])
 by smtp.gmail.com with ESMTPSA id q20sm10722037wmj.5.2020.09.19.11.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 11:12:51 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 19 Sep 2020 20:12:50 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2009191950460.7901@felia>
References: <20200919081225.28624-1-dwaipayanray1@gmail.com>
 <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: apw@canonical.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

> On Sat, 2020-09-19 at 13:42 +0530, Dwaipayan Ray wrote:
> > Checkpatch did not handle cases where the author From: header
> > was split into two lines. The author string went empty and
> > checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.
> 
> It's good to provide an example where the current code
> doesn't work.
>

Joe, as this is a linux-kernel-mentees patch, we discussed that before 
reaching out to you; you can find Dwaipayan's own evaluation here:

https://lore.kernel.org/linux-kernel-mentees/CABJPP5BOTG0QLFSaRJTb2vAZ_hJf229OAQihHKG4sYd35i_WMw@mail.gmail.com/

Dwaipayan, Joe's comment is still valid; it would be good to describe
the reasons why patches might have split lines (as far as see, long 
encodings for non-ascii names).

I will run my own evaluation of checkpatch.pl before and after patch 
application on Monday and then check if I can confirm Dwaipayan's results.

> It likely would be better to do this by searching forward for
> any extension lines after a "^From:' rather than searching
> backwards as there can be any number of extension lines.
>

Just to sure what you are talking about...

You mean just to access the next line through the lines array, rather 
than using prevheader and trying to decode that one line twice.

I agree the logic is a bit redundant and complicated at the moment.

Once prevheader is non-empty, it already clear that author is '' and 
prevheader decodes with that match, because that is the only way to
make prevheader non-empty in the first place; at least as far I see it 
right now.


Lukas
 
> > Support split From: headers in AUTHOR_SIGN_OFF check by adding
> > an additional clause to resolve author identity in such cases.
> > 
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 504d2e431c60..86975baead22 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1210,6 +1210,16 @@ sub reformat_email {
> >  	return format_email($email_name, $email_address);
> >  }
> >  
> > +sub format_author_email {
> > +	my ($email, $from) = @_;
> > +
> > +	$email = encode("utf8", $email) if ($from =~ /=\?utf-8\?/i);
> > +	$email =~ s/"//g;
> > +	$email = reformat_email($email);
> > +
> > +	return $email;
> > +}
> > +
> >  sub same_email_addresses {
> >  	my ($email1, $email2) = @_;
> >  
> > @@ -2347,6 +2357,7 @@ sub process {
> >  	my $signoff = 0;
> >  	my $author = '';
> >  	my $authorsignoff = 0;
> > +	my $prevheader = '';
> >  	my $is_patch = 0;
> >  	my $is_binding_patch = -1;
> >  	my $in_header_lines = $file ? 0 : 1;
> > @@ -2658,12 +2669,21 @@ sub process {
> >  			}
> >  		}
> >  
> > +# Check the patch for a split From:
> > +		if($prevheader ne '') {
> > +			if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
> > +				my $email = $1.$line;
> > +				$author = format_author_email($email, $prevheader);
> > +			}
> > +			$prevheader = '';
> > +		}
> > +
> >  # Check the patch for a From:
> >  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> > -			$author = $1;
> > -			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> > -			$author =~ s/"//g;
> > -			$author = reformat_email($author);
> > +			$author = format_author_email($1, $line);
> > +			if($author eq '') {
> > +				$prevheader = $line;
> > +			}
> >  		}
> >  
> >  # Check the patch for a signoff:
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
