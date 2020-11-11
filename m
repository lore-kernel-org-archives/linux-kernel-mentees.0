Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9B9C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:23:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B9420829
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqeNdSuy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62B9420829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D238686924;
	Wed, 11 Nov 2020 19:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMhA5UwYevg8; Wed, 11 Nov 2020 19:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 70018868E9;
	Wed, 11 Nov 2020 19:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E40DC088B;
	Wed, 11 Nov 2020 19:23:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A7D8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 35899868F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yx644jvbFY89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3F35868E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:23:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v12so2176791pfm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZGhy0aQhTqm4Bg3NPrnciL8Ga6L81jHx2yfWfn9bAe0=;
 b=bqeNdSuycSzqflw2JiBiWZygjT+waxqfq7iQ7SmpEW9yjAcOf9xp8BRlgh9QkWkBR4
 e9Iei1JWPwGVLAHYiaPNQPrHs8+1zmB9CfLLqtGJ8d8zsXuE6gbFkTYlC9gs5JxnO1IK
 VsOirLHh4wl/bLGw4ERJHAx9CaarsS7rhwSpIwWgKaxUVmJNs3t00SO2Yt8zoReJNLIH
 lPUJvPbQs4UIy1wTPN9axcxS76/3sSfbL60VjIgMmgAUQxaN4Rms/6HdTPYgKekRHH2S
 /Vjh2m1fJJcb6GTncsM2R7jKAuZNkQN1av3A1QvhUwsHDdQowLeOz1yEAxnQg+dijHdi
 3b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZGhy0aQhTqm4Bg3NPrnciL8Ga6L81jHx2yfWfn9bAe0=;
 b=RCFBweQKgSwbLr68bwTLWAuBNrem4akNAy6EI5MZh8oi8qRpb6bik4LCJ7JMu5lbiB
 4ec/S5oDRzPePwrdD1lNzcQ8BGKYu8oEXDGGIlAo713+bQcdSqGEyPNuDDLxQXY3MvP9
 452vpPNviTmJbpaxnh7ytEQB/YHrBzqN2zGVkHqhU+A0v5OLI1ROH2tOnwJgRLSMFN3v
 qlvrVoKE/5EiSArxy3tv3JCOAgy/J3VEFnyEv9Atns3ewyusIqpKxTBmEpH/QgQpnCdy
 lz78m3QespzKzZzx7Keah6B8Fvm1TFJ6mkfdlybkUnh0KBbn87pE97gPMptXfPjIoSdh
 eg4Q==
X-Gm-Message-State: AOAM533mU9IW+e9EBl/1mIJLVwIuuQ4xvND2xD4kqQrm+va5kUWRZQWw
 N0GtFDpdXU4HabRCrhIUKyn2WYrZYrQa0g==
X-Google-Smtp-Source: ABdhPJzoeyx3Ke11xO0z1xsDuamYbp97nswoVEAa3x23JfD+ar6ykN88Ribz1hEW3ZhORuU68onidQ==
X-Received: by 2002:a62:1b0e:0:b029:164:228b:f063 with SMTP id
 b14-20020a621b0e0000b0290164228bf063mr24254576pfb.75.1605122620920; 
 Wed, 11 Nov 2020 11:23:40 -0800 (PST)
Received: from ?IPv6:2402:3a80:438:e4d1:90d7:ac69:6d50:789e?
 ([2402:3a80:438:e4d1:90d7:ac69:6d50:789e])
 by smtp.gmail.com with ESMTPSA id r205sm3594444pfr.25.2020.11.11.11.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 11:23:40 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201111191954.398-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <7dbb154a-d71b-192c-5407-56ecba22dd73@gmail.com>
Date: Thu, 12 Nov 2020 00:53:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111191954.398-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On 12/11/20 12:49 am, Aditya Srivastava wrote:
> Currently checkpatch warns us for long lines in commits even for
> signature tag lines.
> 
> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
> clear Mac Table Digest") reports this warning:
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> This is an example of false positive. Provide a fix by excluding
> signature tag lines from this class of warning.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ac7e5ac80b58..1d257b1f4a4f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2963,6 +2963,8 @@ sub process {
>  					# filename then :
>  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
>  					# A Fixes: or Link: line
> +		      $line =~ /^\s*(?:$signature_tags)/ ||
> +		      			# signature tag line
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> 

These are the changes I have made for avoiding signature tags from
commit_log_log_line warning. Wanted to get a quick feedback on it
before proceeding for evaluations.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
