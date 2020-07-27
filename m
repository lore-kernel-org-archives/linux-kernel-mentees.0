Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80669C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:12:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA0220714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcPGk7dn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA0220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EB4F87653;
	Mon, 27 Jul 2020 07:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxx97yBbvjCr; Mon, 27 Jul 2020 07:12:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD02086BC9;
	Mon, 27 Jul 2020 07:12:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 991B9C004F;
	Mon, 27 Jul 2020 07:12:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60063C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 477D686BC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSOutEjKllXR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:12:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B63F587653
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:12:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f185so3629363pfg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 00:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4bixwfwct2k8xSCZVPHvs9nu1u1j6pLSKhgka678QeM=;
 b=hcPGk7dnyilX0AwUhmhxJdzZGdROIYNW8ufkHuNRw9P5LZunYCakJ74TtFIbMbDRjU
 qUzuVq8cVYBVhlCAjlatpMqAaPDt4WtupA4YvsaDqt9DblWR+nWx4IS8TARIQCnocYLh
 LUc5pGqAptJQDI0ZdSqfjCPXppCduI337dZRIDtF81hHOaSxGp8JRHnSXAROeqTwKH/1
 TuTbGRptSKj72gpKX657DYiY7ZxVrtE554g3ysSNizv4qPdDA4qssvFogX8Y0rEhOFns
 dxOGXa85TPuRlpWEtd+Gi4HnKwjVPaj2EfwvhbsH+1yjj7yKbZWBpL7wZy0Qi7JOeyKH
 3tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bixwfwct2k8xSCZVPHvs9nu1u1j6pLSKhgka678QeM=;
 b=P1CFo45wsEkvi1ddy3yMC8bUwFGgsflfr7E9dfBcm5673bFB9VoIp5Da8bQjdQ+hoC
 2h2N6bfh2/ZPfbvpAtauM3AVJYKiTtjpBS6CzqJYB41kKUlg8L5BoGxDzDGfAmgkuq3a
 7igsPt+VM76KwoXJxKKRpxaqXGTUl13S7+EYNVboGe2Rh+QoCc+dwgQUhaRBkHccKo5B
 VMsbq08Nm1seYmKaXBsFiAOELBYYFtgISZC6xJeS2D1cA3fu1GIIDlys8R2/5Rcn54v/
 PXy483rblhTiwQeQyL3Cma2Fpch1lLSz0cHu4rBTgMFaexdRf+9JUL0iy3+ksjG3Jmbn
 MxsQ==
X-Gm-Message-State: AOAM530ch+/qQC7wHs/IO46Ydl8XUP4xYOhibUaoxRFl3WJgzU62AiA3
 kEcXC1rstZBV+4GSYNrDDjk=
X-Google-Smtp-Source: ABdhPJz8+8Dd/vfUGvoRNMOT4vmx8g8yI0bKHPLM+TEPHx52oF2+lplNDDBxAB1GifafTfORuUtniQ==
X-Received: by 2002:aa7:8d8b:: with SMTP id i11mr19321067pfr.263.1595833925328; 
 Mon, 27 Jul 2020 00:12:05 -0700 (PDT)
Received: from endurance ([59.95.38.168])
 by smtp.gmail.com with ESMTPSA id z11sm14152867pfj.104.2020.07.27.00.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:12:04 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:41:59 +0530
From: Nachiket Naganure <nachiketun8@gmail.com>
To: Joe Perches <joe@perches.com>
Message-ID: <20200727071159.GA595854@endurance>
References: <20200727055458.559558-1-nachiketun8@gmail.com>
 <66bbaec73d8f69541535db5390c0f12b304c0467.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66bbaec73d8f69541535db5390c0f12b304c0467.camel@perches.com>
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: disable commit log
 length check warning for signature tag
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

On Sun, Jul 26, 2020 at 11:14:42PM -0700, Joe Perches wrote:
> On Mon, 2020-07-27 at 11:24 +0530, Nachiket Naganure wrote:
> > Disable commit log length check in case of signature tag. If the commit
> > log line has valid signature tags such as "Reported-and-tested-by" with
> > more than 75 characters, suppress the long length warning.
> > 
> > For instance in commit ac854131d984 ("USB: core: Fix misleading driver bug
> > report"), the corresponding patch contains a "Reported by" tag line which
> > exceeds 75 chars. And there is no valid way to shorten the length.
> > 
> > Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 197436b20288..46237e9e0550 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2806,6 +2806,8 @@ sub process {
> >  					# filename then :
> >  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >  					# A Fixes: or Link: line
> > +		      $line =~ /$signature_tags/ ||
> > +					# Check for signature_tags
> >  		      $commit_log_possible_stack_dump)) {
> >  			WARN("COMMIT_LOG_LONG_LINE",
> >  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> 
> OK, but the test should be:
> 
> 		      $line =~ /^\s*$signature_tags/ ||
> 
> so the line has to start with a signature and
> it won't match on signature tags in the middle
> of other content on the same line.
> 
> 
But the suggested won't work in case of merged signatures.
Such as "Reported-and-tested-by: user@email.com"

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
