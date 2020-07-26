Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B965CC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 11:13:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880BE2065C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 11:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ0OJlcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880BE2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A6AD85082;
	Sun, 26 Jul 2020 11:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQXOf31OCK21; Sun, 26 Jul 2020 11:13:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD04785531;
	Sun, 26 Jul 2020 11:13:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C888AC0050;
	Sun, 26 Jul 2020 11:13:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B480C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 46ED586406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAOBgmXULqE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:13:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AC7787904
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:13:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 184so12021917wmb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+rsslyIKckSzNV5xmqmHD6lAYEf+RIMyhCiyqjZzrtE=;
 b=XQ0OJlcOcAIn+xuuiKISfzFohjG5iCNkUynZd1givhO6buKDLZWFaWURTN6Guo+W3P
 WYrA6TVfsOeOAD5oX9o6fWuIvuEo6onLEHp4HwE59NNgvkywTjzrpexR9A+ptaOeWhjW
 ltNfSCm3m3+9pBHz572XgCngpgNLT5Gwo5a2KvppGZ+usgnvrUqhiHrxBtSvuTE70OVV
 kv0ZZtW5R/gkuqGp3INNQfK9zCeBtUAJn4OdKDYyXDfIr44NiH0yPtTAHr5R0/efEYzx
 9K+eMkgwtglKzZ4i6IeQzo+Bzb0JSyPvUuwENm6QZbBVcFOJqAtuHNf+2NDNIvHULvI3
 +ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+rsslyIKckSzNV5xmqmHD6lAYEf+RIMyhCiyqjZzrtE=;
 b=p4u5j14QvKGHNolH7v6F2cJqmQZ7qUF2QXhpshnuJLfDvnUviszBKAUvOFetah8LIf
 ggzpU5/L15PWSjr3qEEC8lQtpDzOQtNTMLQJzQxcp6ZAQln65kmNB8DunZhMWap8M0rc
 SYBzQ0ziPt9zSjGhY8kFkdgiUrMf+05ZKcxeTrvXKDASIrHarWIEsVZiVy7NlzH5Svrr
 UBC2V0hR5+kEQ6xI0mCHG92AXNtwDekyhS0B2iTkigl+Lvy29373V4bPJ4hQoywPLkj4
 S5Z/SSpairwUqPgRU2/ZHP4ZcUZE2DoIYKP2E2B7kisqLqAq/Hq65jCUR30kop3cv3Je
 ipZQ==
X-Gm-Message-State: AOAM532oBN2Y/6h7F5Bp7DYrOAG5U4afTb/p5sVEL2Q7EFo2rW+XFQSx
 oDuTRYmSVsbE2JZL1k/y1Hc=
X-Google-Smtp-Source: ABdhPJwkK4mPEfv8v/caLiZjaXYvvJ2rQESf+23QDU9YL/6S3xLfrxCrkx9/Wmhm9sKGIn3OHY3lFw==
X-Received: by 2002:a1c:1dc7:: with SMTP id d190mr15682044wmd.36.1595762001045; 
 Sun, 26 Jul 2020 04:13:21 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:7800:6093:3c0b:c57d:3d50])
 by smtp.gmail.com with ESMTPSA id b139sm14510959wmd.19.2020.07.26.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:20 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 26 Jul 2020 13:13:18 +0200 (CEST)
X-X-Sender: lukas@felia
To: Nachiket Naganure <nachiketun8@gmail.com>
In-Reply-To: <20200726075802.396907-1-nachiketun8@gmail.com>
Message-ID: <alpine.DEB.2.21.2007261310140.6195@felia>
References: <20200726075802.396907-1-nachiketun8@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Script: Checkpatch: Disables
 commit log length check in case of valid signature tags
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


Commit message is wrong.

On Sun, 26 Jul 2020, Nachiket Naganure wrote:

> Checkpatch.pl outputs warnings for commit description lines that exceed
> beyond 75 characters. Sometimes these lines might contain signature tags
> that cannot be shortened. The patch checks if the line has any valid
> signature tags and disables the warning in such a case.
> 
> For instance in commit ID ac854131d984, the patch
> contains a Reported by tag line which exceeds 75 chars. And there is no
> valid way to shorten the length.
> 
> To fix this, we need to check if the $line variable has any valid
> signature tags which are already stored in $signature_tags variable.
> 

Read the documentation on commit messages. Think about the things you are 
doing wrong in your commit message.

> Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 197436b20288..b6d5e2a8fce8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2806,6 +2806,8 @@ sub process {
>  					# filename then :
>  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
>  					# A Fixes: or Link: line
> +          $line =~ /$signature_tags/ ||
> +          # Checks for signature_tags

Change looks more reasonable now.
Indentation is broken.


Maybe two or three iterations on this patch and it is getting ready for 
submission.

Lukas

>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
