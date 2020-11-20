Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F47C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:41:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDF222255
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3elM6Kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDF222255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0255187310;
	Fri, 20 Nov 2020 10:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NP62hjZYHZzD; Fri, 20 Nov 2020 10:41:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 492BB872D1;
	Fri, 20 Nov 2020 10:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33482C163C;
	Fri, 20 Nov 2020 10:41:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F371AC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E7F4D86D52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpZRkeH4_BJh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3CA6586D48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:41:19 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id l11so4668476plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 02:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JhgoSSa0VQ0nyn+Q0xsYnxGWeWoI2cCn6P4kqzjhBDk=;
 b=M3elM6KpbCmxPEC9Db9m32mzN8kKezFp8Nbfb1lEwkDZZZJ3Pjqv9u9zaGx5KR5QrF
 P7Sdi6R/irfMNinKcawL4MYdHhU3y6M9zR5gRBLCpax27sRC7qo89sCV5YMgwnY8+fww
 ewUFh/soVDYIAEdNd8qgtOCv+kxIC3t9aeIFbQLg0Hcd6rsSOGH4/b61pCe2drLrnA9b
 IS3e0pKeFwNjte133UyGb8CFgr+OV18ou0eYoRIHBNEDIZfu+84wL8XOxzbfU7zvM04F
 viJmVrNCnb3TM7F8H1uDmOJGuT66QYxxcvYN0EWNLC6WkHEP30jYT8HTXga6xoVKRpQM
 twag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JhgoSSa0VQ0nyn+Q0xsYnxGWeWoI2cCn6P4kqzjhBDk=;
 b=JoHCnYtQONlqBm/u0JYF2hLGDVGKZl1mSuo15K2P67OthhY8nUSMj6g/hxh7DaGpag
 1yghi+MUj9AIJKjOWOB3EP74JPd/FaaHP7HRieDeq0SFSXB2P7IUkJj0/eDiL5ToWSOb
 X6hjzeO9gpooYy8v9RnxroRpc1wvbsmceB9mJS54hMhgHwT+Lv53rRXoCSFFbDKf5/0v
 ao7CyKLwXf0rIe8lrjBhsjaLDFcowjXvLt+1MLU80Du90sWltfTHw1BHMgKV4gcfV5UA
 SCnMGiuVart+ExBJyz6ZhbGyXELBXGuFcxlpA8YULLVV0CbMW/DyII53bgRhAELiJOJo
 xs4Q==
X-Gm-Message-State: AOAM531F3twdBaebKHpMF+Gfmaa4eBMaZgTd9hM2BI3WboVHy3NIM5R6
 Cb6IsJW5NuVXm+j/FxCAbeI=
X-Google-Smtp-Source: ABdhPJyKOm2ljjvDVJ6ZkrSlgbnBO006Hn2BcZJ/sfVHnB+G3QJ7cQSSG9pnjasd8sPZHC2oJri/og==
X-Received: by 2002:a17:902:c20a:b029:d6:b2d6:8006 with SMTP id
 10-20020a170902c20ab02900d6b2d68006mr13442428pll.31.1605868878734; 
 Fri, 20 Nov 2020 02:41:18 -0800 (PST)
Received: from ?IPv6:2402:3a80:40a:513c:8f5:b466:78ec:c186?
 ([2402:3a80:40a:513c:8f5:b466:78ec:c186])
 by smtp.gmail.com with ESMTPSA id f134sm3116387pfa.208.2020.11.20.02.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:41:18 -0800 (PST)
To: joe@perches.com
References: <20201117171856.13284-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <48f56f40-a365-faac-542d-0e120fcf4365@gmail.com>
Date: Fri, 20 Nov 2020 16:11:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117171856.13284-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
 for ASSIGNMENT_CONTINUATIONS
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

On 17/11/20 10:48 pm, Aditya Srivastava wrote:
> Currently, checkpatch warns us if an assignment operator is placed
> at the start of a line and not at the end of previous line.
> 
> E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
> deadlock on hotplug") reports:
> 
> CHECK: Assignment operator '=' should be on the previous line
> +	struct netvsc_device *nvdev
> +		= container_of(w, struct netvsc_device, subchan_work);
> 
> Provide a simple fix by appending assignment operator to the previous
> line and removing from the current line, if both the lines are additions
> (ie start with '+')
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> add check if both the lines are additions (ie start with '+')
> 
> Changes in v3:
> quote $operator; test with division assignment operator ('/=')
> 
>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c9aaaa443265..d5bc4d8e4f6c 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3542,8 +3542,14 @@ sub process {
>  
>  # check for assignments on the start of a line
>  		if ($sline =~ /^\+\s+($Assignment)[^=]/) {
> -			CHK("ASSIGNMENT_CONTINUATIONS",
> -			    "Assignment operator '$1' should be on the previous line\n" . $hereprev);
> +			my $operator = "$1";
> +			if (CHK("ASSIGNMENT_CONTINUATIONS",
> +				"Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
> +			    $fix && $prevrawline =~ /^\+/) {
> +				# add assignment operator to the previous line, remove from current line
> +				$fixed[$fixlinenr - 1] .= " $operator";
> +				$fixed[$fixlinenr] =~ s/$operator\s*//;
> +			}
>  		}
>  
>  # check for && or || at the start of a line
> 

Hi Joe
This patch probably got missed. Please review :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
