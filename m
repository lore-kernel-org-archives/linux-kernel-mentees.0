Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4811FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 12:14:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCA92222A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 12:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiLUessV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCA92222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 085EF2E113;
	Tue, 13 Oct 2020 12:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcyNas9lS8-R; Tue, 13 Oct 2020 12:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F2A512E10C;
	Tue, 13 Oct 2020 12:14:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9FE2C0891;
	Tue, 13 Oct 2020 12:14:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94748C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 905E885F7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gv6pf2yJaDH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:14:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD90B85F5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:14:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f19so16589791pfj.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=62xj6Z5K6RaOB3QGkKQ3gtjEFjGAuL9DJs4xyn/7xfk=;
 b=TiLUessVNvPerT33mxDAafifPiaIZtStQjLAvsJW93Crb1377hc+gWtbpb0E8oRgmU
 Aeas5RvEIh4a9+ARLdDsf7qvMQjLBH5oQAK2r3ohPfVVjE+8KUFwkEYflc+lKZfEWykW
 3PHvBjeSxWkQZuU9D+MH5CAC+NjtxtSrAOQD2g0m83IfewyD6vfB6R3HwuY9E05knkk7
 idki0wfLcoZfNnxss61659mWeCVz0n4HVYmTVOKJV9MJd41HFTv0OihT/frwrG5o1wzP
 /UHSiK8achMg0+I8h97J4MHgSVqHkVBY3jlnEUMSnyKTeJN8mTrv2UlBV0ZW9KOLmk6i
 04Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=62xj6Z5K6RaOB3QGkKQ3gtjEFjGAuL9DJs4xyn/7xfk=;
 b=ohAljksK5i3gIdFmLuJNwF4t7URZuayDARRIEN2HZJL4I5s6I9ckoci7Z1tSevBikM
 3M99bkrWYBbEEOR0RluCuikRU1xbdh52NcCyLUJvQCAxjLhIdKM/fz2lO8Pzf/XftM2t
 PCGk1Oh1rekh4IuzMwWs970XSiaUzvcxsOh6CvOEVbmHSFqAMz+b85P//yr3yKSf0OGZ
 58NVrlMSvY85w9JgRuSOma3f2FBRdHEMqka+ra4ydVMH+T1E4RBYeu1iIzLSDQhjqr4k
 pbeacGLWOdCn8B1lY28BTGmd2cC0JnYuM1toH6Qmy5C1DyT2NPuWA5bVuaIDgIFGR/Sn
 eErg==
X-Gm-Message-State: AOAM532sZPRiek961Z/2J39rqEyn3AMw+2myNdZ0hSQHKnsDqCVbxtUy
 QZVOnIWx81CDlYPbQt+WNIPt3xEpGr4HIONtRAU=
X-Google-Smtp-Source: ABdhPJweAawdGQMKXJlXVfvEq1MWE1cIqNb50IZn1NW5sE0z0kyVzdNB7szq15efpz0/TtLvSj9+ww==
X-Received: by 2002:a62:6408:0:b029:154:dde2:a5eb with SMTP id
 y8-20020a6264080000b0290154dde2a5ebmr29126945pfb.30.1602591243907; 
 Tue, 13 Oct 2020 05:14:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id z6sm23508878pfg.12.2020.10.13.05.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 05:14:03 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <da3053be-f27e-f99c-0a8a-447adb9733d2@gmail.com>
Date: Tue, 13 Oct 2020 17:43:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
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

On 13/10/20 5:31 pm, Ujjwal Kumar wrote:
> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
> 
> Based on current check conditions, a perl script file having
> execute permissions, without '.pl' extension in its filename
> and not belonging to 'scripts/' directory is reported as ERROR
> which is a false positive.
> 
> Adding a shebang check along with current conditions will make
> the check more generalised and improve checkpatch reports.
> To do so, without breaking the core design decision of checkpatch,
> we can fetch the first line from the patch itself and match it for
> a shebang pattern.
> 
> There can be cases where the first line is not part of the patch.
> For instance: a patch that only changes permissions without
> changing any of the file content.
> In that case there may be a false positive report but in the end we
> will have less false positives as we will be handling some of the
> unhandled cases.
> 
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
> Changes in v2:
>   - Spelling correction and add example to commit
>     message
>   - Code style changes
>   - Remove unncessary function argument
>   - Use non-capturing group in regexp
> 
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..7ebbee9c3672 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1795,6 +1795,23 @@ sub get_stat_here {
>  	return $herectx;
>  }
> 
> +sub get_shebang {
> +	my ($linenr) = @_;
> +	my $rawline = "";
> +	my $shebang = "";
> +
> +	$rawline = raw_line($linenr, 3);

I'm wondering if the range information can be at a
different offset from the 'new mode line'.

> +	if (defined($rawline) &&
> +	    $rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
> +		if (defined($1) && $1 == 1) {
> +			$shebang = raw_line($linenr, 4);
> +			$shebang = substr($shebang, 1);
> +		}
> +	}
> +
> +	return $shebang;
> +}
> +
>  sub cat_vet {
>  	my ($vet) = @_;
>  	my ($res, $coded);
> @@ -2680,7 +2697,9 @@ sub process {
>  # Check for incorrect file permissions
>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
>  			my $permhere = $here . "FILE: $realfile\n";
> +			my $shebang = get_shebang($linenr);
>  			if ($realfile !~ m@scripts/@ &&
> +			    $shebang !~ /^#!\s*(?:\/\w)+.*/ &&
>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {

Consider the following case:
a python script file with '.py' filename extension but without
a shebang line. Would it be meaningful to allow execute permission
on such a file?

>  				ERROR("EXECUTE_PERMISSIONS",
>  				      "do not set execute permissions for source files\n" . $permhere);
> 
> base-commit: 148fdf990dee4efd23c1114811b205de9c966680
> --
> 2.26.2
> 

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
