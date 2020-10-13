Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C11C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:16:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09528208D5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEkZCnT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09528208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D25A878A4;
	Tue, 13 Oct 2020 06:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HVRM3cWsibS; Tue, 13 Oct 2020 06:16:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 10C6086E49;
	Tue, 13 Oct 2020 06:16:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB233C0052;
	Tue, 13 Oct 2020 06:16:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA25CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A33FE87388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxYgUHHM8wqC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:16:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7DD358737B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:16:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n15so22507562wrq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+Q2EfY3ea1WUh+DQuUSE7ej/NHTjEE4qhTNAGuLfXu8=;
 b=JEkZCnT2jkOSV3lZXc7Y25jHk/AinkIdFGVlZjOKEQac45CO6W8Kln5xFa8w16HmmO
 ebDlzcSCVaRBd/IW/aJp7FIIxWtsOF/8SoPk2BWi/4i/RcdnyHPTw4Bm+67nHeljY2kF
 WnN/1iXEtfSfhHObQgbRT+ym5Uu0nLMcL5kvm/DMAk22NYrhBApQX0pzd539MiWTI4ZX
 jZzevJllpt1Ggb5PUdbIvlqMMNDCH/J8y1Q3HVGsa5c5rBHxjevL0yqQxf4uGZ6cEyFC
 uZPXitcIGlgl+m1SP3su7YAuUudbjAIBja72xMDgkMJuX81u0S2JwLTj6vld6scY2URl
 ITvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+Q2EfY3ea1WUh+DQuUSE7ej/NHTjEE4qhTNAGuLfXu8=;
 b=LNrN3ApxQtW36dN929sfNBT+guHUQO9VqVfjltU2KWA1PsTk5ku2NfFuYPEvX0H4oN
 dbUU6uEfscXttd5rHYGaX1MTPZjJnGwOol1cimYcvF6xadFCLyX4agGuel3WvN4Osn9E
 V6NKQ9Kmbfz6J/t5u00zzLvEw3E5SEJXhyE7EQKHbVcu9u7V6b8UuddUipz/kCIUiza5
 ERl3ZrUh6ALBh9OE+bwz+R/7+Q9gZWNnlLzojml88r3/KhoSyciau6TsJaZq4lBymH8D
 vkCBGnegxjcJvSaCtCpteeYLR6KUm3Lctk1OHTWmbDLlYr7gv+pXvA2x15myDcy0hOp8
 unbQ==
X-Gm-Message-State: AOAM532ma++4S3EyRyRGZGNFV2g7vMcACXXeh+E+klESGHDxSLa8Yuv+
 fZBlDV3q8sBXOAkGxcfcDgY=
X-Google-Smtp-Source: ABdhPJxWOTePgRrR7klSPlaky93sXLsLJ9IHersSXPCrllb1FWmdwTLSE2RC8PyosnydCc1X/afMPQ==
X-Received: by 2002:adf:ab05:: with SMTP id q5mr7336700wrc.32.1602569796985;
 Mon, 12 Oct 2020 23:16:36 -0700 (PDT)
Received: from felia ([2001:16b8:2d05:8100:95ae:bd1a:3e4e:4242])
 by smtp.gmail.com with ESMTPSA id x64sm25900339wmg.33.2020.10.12.23.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:16:36 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 13 Oct 2020 08:16:35 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201013060714.33713-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010130811050.14590@felia>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
 whitespace in formatted email
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



On Tue, 13 Oct 2020, Dwaipayan Ray wrote:

> Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> checks.") introduced new checks for author sign off. The format_email
> procedure was modified to add comment blocks to the formatted email. But
> no space was added between the email address and mail comment.
> 
> This causes wrong email formatting in cases where the email is in the form
> "author@example.com (Comment block)". The space between the address and
> comment block is removed, which causes incorrect parsing of the
> formatted email.
> 
> An evaluation on checkpatch brought up this case. For example,
> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
> the following warning was reported:
> 
> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> system concerns)' might be better as 'David.Laight@aculab.com(big endian
> system concerns)'
> 
> Add a single space in between the address and comment when the
> extracted comment is not empty.
>

Dwaipayan, looks good to me.

So, how about a 'Fixes:' tag?

Aditya, can you rerun your evaluation with this fix patch applied on top?

Then, we need a comparison for:
1. completely before vs. after the two patches, and
2. after the first patch vs. after the two patches (to see that the fix 
works)

More support on evaluation from others interested to become mentees are of 
course welcome.

Lukas
 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..f1a4e61917eb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1221,7 +1221,9 @@ sub format_email {
>  	} else {
>  		$formatted_email = "$name$name_comment <$address>";
>  	}
> -	$formatted_email .= "$comment";
> +	if ("$comment" ne "") {
> +		$formatted_email .= " $comment";
> +	}
>  	return $formatted_email;
>  }
>  
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
