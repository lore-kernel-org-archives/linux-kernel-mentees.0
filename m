Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E697DC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:08:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B7920BED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWuw1p3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B7920BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E4268683D;
	Wed, 21 Oct 2020 15:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1O6BrX-UnfZH; Wed, 21 Oct 2020 15:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 219FD8682D;
	Wed, 21 Oct 2020 15:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ECFAC088B;
	Wed, 21 Oct 2020 15:08:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38B7DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 27E3B863E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2zcfUSBew1I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:08:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3E7DC863E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:08:52 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id ce10so3751048ejc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iSyaRKWVARoZdONObMuoKlVR1YsqMgVG5e09nC+pEas=;
 b=HWuw1p3Fv7JdA7FrnVBvzz7Kf00KqP9bdvppStnyS7V6NTPDSheM/fsfIZIWM77Grb
 dqbwKBS6+miA2jNbbJvRUAshUXtyJKN+rvTFkxIubSB7l+ntoRwBkVDe5jaMx1OZw6jY
 URiexH5UX+/Am3NZVcRqjxU3S9MLNBpqYzjrReefAHfpVjCQX2eeOWbp8dHxnnoCIwjW
 Ocg+qqoJzLj+svW6izkR/EwG6a9lorOvC+gc0xDdHIC2obbMBIWKU/9nrJzYpbupwPLm
 ERSK01mns72pjCRHoTnwTgSj3CvWOpQRT0sKtGQ7Jw6/pHysMKLQ4Ndfo4NRFxinsRbL
 xsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iSyaRKWVARoZdONObMuoKlVR1YsqMgVG5e09nC+pEas=;
 b=mDMRsg7fmaATf/t36MuMJNRIjj1WUGFh66jDm8LGHnikApLCj024rcwjN8BljxXX0u
 2xLy8X/oKMTOn9AnzNNSx/QCOqS3PT1kebg85hdDXSm6/HGB72ZhHj05k+WxuwDTe+ha
 zYMZFPGSfn1Dd4MX94TV2sPGd/eOTU8nJ1T8aHm+WtVkBZk0N41fHyWVi8ezPCWn6UeR
 chLYNFoIo0Ph6xVgOOA5oK8WzvlY156FHZQrFy5/ve4qA+of9zea8D/xSPIE4AoIp0TH
 27M9CidqOcLWwefvb4v3Jo29uCSQ87EZP08p5I529md5mexFsXS3XGqsg6//TzNzpZpP
 WbiQ==
X-Gm-Message-State: AOAM533+VEzig8JsKhlOSxaqgP+9U09BLHJjXYZx8WV0TI+0yD8cW2yA
 SURsCorQsTnHEw/as7w0T4k=
X-Google-Smtp-Source: ABdhPJwrR37x4tEMkqh0acFcsNIlj6wpwzWomHf4OzvYEw3sQ8Bp69tYaahv2MrvXTB7Fys3d3/6IQ==
X-Received: by 2002:a17:906:3799:: with SMTP id
 n25mr3908094ejc.6.1603292930710; 
 Wed, 21 Oct 2020 08:08:50 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:c428:3741:a9e9:6e3d])
 by smtp.gmail.com with ESMTPSA id j3sm2305372edh.25.2020.10.21.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 08:08:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 17:08:48 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201021150120.29920-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2010211704230.5382@felia>
References: <20201021150120.29920-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for REPEATED_WORD warning
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



On Wed, 21 Oct 2020, Aditya Srivastava wrote:

> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Here, it reports 'ff' to be repeated, but it is in fact part of some
> address or code, where it has to be repeated.
> In this case, the intent of the warning to find stylistic issues in
> commit messages is not met and the warning is just completely wrong in
> this case.
> 
> To avoid all such reports, add an additional regex check for a repeating
> pattern of 4 or more 2-lettered words separated by space in a line.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 1043.
> 
> A quick manual check found all cases are related to hex output in
> commit messages.
>

Aditya, one thing I just noticed the commit message header is a bit
uninformative.

How about something like:

identify typical hex output for a better REPEATED_WORD check

Other than that, it looks good. You might want to share the link to the 
complete report of differences before and after this patch for Joe to 
check as well.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9b9ffd876e8a..78aeb7a3ca3d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3050,8 +3050,10 @@ sub process {
>  			}
>  		}
>  
> -# check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# check for repeated words separated by a single space and
> +# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {
>  			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
>  				my $first = $1;
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
