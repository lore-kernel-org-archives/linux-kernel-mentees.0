Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601A8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:50:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCDFC2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4TUNY8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDFC2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 594E7204B0;
	Sun, 11 Oct 2020 17:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyX75Er8rIRd; Sun, 11 Oct 2020 17:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 76568203D5;
	Sun, 11 Oct 2020 17:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59ABFC07FF;
	Sun, 11 Oct 2020 17:50:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 342E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 185BD87565
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LzV0rwp3Dp9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:50:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A844187042
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:50:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n15so16366580wrq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 10:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3lLeqJnaVTG6YSwShP033plSYqxTw2zujpNsEmpQXRE=;
 b=c4TUNY8RTUKRluspk+bmkoN0flVCzweUVF4am+J0AWCm72U1I4r/PfuG7ZeqElzh7M
 Q+lXrSz4tXGGaYncFAhM2dT/wgNf3Fo4FWV3W0wkJfRiL0YfkmA90WPAAXLHdZPNxznV
 u4f49a9KPDA2uDODcKUR1wwbNV1w0pXEJIy8wK3P6vCuwEHb1ruxNghde8GorC0rqCS8
 oj3qF0POejOuDkHPy/x4/i0udT1LgsoZM6toV0bzIggNCQIaWvsqRDs0/9bP2PdtrdQx
 wgEghH5OX0AoG7KxRMLCqwsj93kVKxpyeTRxwh20gVy6DLir6iTsLRMVXmnDONBg7jSO
 a3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3lLeqJnaVTG6YSwShP033plSYqxTw2zujpNsEmpQXRE=;
 b=uPJFDVc4nJwDeZvGpiw2ZJL5HYQU7RcIKbmdsW8gdgGRKK/T5w4ALWRq47Y0PZtrPj
 ZCogVMWgi0wUmHqtVRbcu4htBoit+ufQcY8YXXFD6J2fhkWg+7z5WGOI+8zLFSih/seV
 dNO7Hk5FqQy7vanQZFW2+nbMcTRJGwMIPKkVvoO08TrGskJ89Vd8tTjvP+gsUiFMiAZW
 kMKI68FygReOAQL/1Jh7aBwti84qQxv1adyOjh+XQlK39qjkCQfZtkNnwv120qLqNQLg
 ivNNSPIr6VovKAroAc6tJ6LSythFIN10bbaFpCD6DFZJrsKqLJfdn8c6GlbLGh0Aur1a
 6V8w==
X-Gm-Message-State: AOAM530+UEkr1s6LjXKnuxQtt/wBPq1pqz8rYYvzd7XnTaA0LL//Q2B+
 cKRjKjMHpNdbDfepkz32xvA=
X-Google-Smtp-Source: ABdhPJz+3xBrPxguZ73rdTZoZSM40upEvjYV5yR+ihckRu0bT+arpSd9vslfuT1LrQwdQVutwXrnog==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr25143901wrv.369.1602438607901; 
 Sun, 11 Oct 2020 10:50:07 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:2e00:8422:c9cb:c3f7:9b2b])
 by smtp.gmail.com with ESMTPSA id t6sm24469014wre.30.2020.10.11.10.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 10:50:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 11 Oct 2020 19:50:06 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
Message-ID: <alpine.DEB.2.21.2010111946390.5535@felia>
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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



On Sun, 11 Oct 2020, Ujjwal Kumar wrote:

> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
> 
> Based on current check conditions, a perl script file without
> '.pl' extension in its filename and not belonging to 'scripts/'
> directory is reported as ERROR which is a false-positive.
> 
> The script can correctly handle patches with mode changes and
> shebang line if shebang is taken into account. So, along with
> the current check conditions, adding the shebang check in the
> check conditions can improve the reports of the script.
>

I think one of the core design decisions of checkpatch.pl is:

checkpatch.pl can run on a patch, even if the patch does not apply to the 
current repository version that is checked out.

It solely uses the information in the patch, and does not try to guess how 
it could be applied etc.

This patch violates that core design decisions.

You can propose to Joe Perches and lkml, but do not be surprised if that 
is rejected because of this reason above.

I would be interested in the discussion.

Lukas

 
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..e596d30794bf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1795,6 +1795,23 @@ sub get_stat_here {
>  	return $herectx;
>  }
>  
> +sub get_shebang {
> +	my ($linenr, $realfile) = @_;
> +	my $rawline = "";
> +	my $shebang = "";
> +
> +	$rawline = raw_line($linenr, 3);
> +	if (defined $rawline &&
> +		$rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
> +		if (defined $1 && $1 == 1) {
> +			$shebang = raw_line($linenr, 4);
> +			$shebang = substr $shebang, 1;
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
> +			my $shebang = get_shebang($linenr, $realfile);
>  			if ($realfile !~ m@scripts/@ &&
> +			    $shebang !~ /^#!\s*(\/\w)+.*/ &&
>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {
>  				ERROR("EXECUTE_PERMISSIONS",
>  				      "do not set execute permissions for source files\n" . $permhere);
> 
> base-commit: d67bc7812221606e1886620a357b13f906814af7
> -- 
> 2.26.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
