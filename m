Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED748C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 18:31:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53114206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 18:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/ujCuC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53114206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D16E487458;
	Fri, 13 Nov 2020 18:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIGYbRpjwQCj; Fri, 13 Nov 2020 18:30:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F204870D9;
	Fri, 13 Nov 2020 18:30:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40F4CC0891;
	Fri, 13 Nov 2020 18:30:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49437C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2ACC187508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4wgc8A7bGLx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:30:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6DAED87477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:30:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c66so8348056pfa.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=En/ITLeanqktn0gHYHl8IEYHINiSIj32J1oBWDnUGw0=;
 b=k/ujCuC3CFk7e4VJlPziVWG7yDnuR8tJr/u4jgeKKQzffvVR0KIzCIw29y2c8F9d7N
 YSiN253CMB63DwixdMtYYyewKVfg73ha0cdl24qSxY0PLkToCSZeyej9f7BEio/3WufB
 deVNWPpU87nLIgUy0R0rRO4iZ+SAWj19UjoaWc+LlxFJRuSxlKHkqhtBf9Ia7RbUci9g
 L3cj7KptYDjFtJ+aZDB5o/WG0Ky1eueFNzY8F6AUVN+CyUmgAstdUnZ9KzmNlSdDUNhQ
 RpLWHNXkZlr+BwJYArRKXT5ofznAtu30WY33jEPv4J0FWCz+B+U8MQJ8vC570s87VJsk
 9yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=En/ITLeanqktn0gHYHl8IEYHINiSIj32J1oBWDnUGw0=;
 b=uPSddrm04VEpB7lCXuklzS4YtbriM6Hl/VE8dbPsp8D5jcEiKCSUiy2bjNaBhA3uxG
 sgkmCBx3lNYSck0ZVlVNP55L6qJYKY+lGHD2YA30TbXuO9Q6zZCNBDqb0uAH6/gfTUkZ
 Mu93WW1aUKav3H5Ic7DB2/52LfzsGl7lX3AtNoTRPktWFLFJakTni8UJ+z6Veo/7W8pU
 IR29K2eVaaVz6oU8rCfk9HrTW9UEiOG4OVmO3cElH4Ot3ubNxXWlRWswW0/Cw0ms3N15
 EXl9/dUi+1XcdIrSVNPEV99YdEja5vOUu+VaKDm+/QgXAJN5SNAuS3ExULOoPjj4uJVo
 thQA==
X-Gm-Message-State: AOAM531Rb4VbkCVLxT0wyB4A8SULd+ka56J1oRKstOSMCr2LGHIiDuvv
 c+H1Bh7ZHhTmrkYp+PIu+tTDGDIBD0mk1Q==
X-Google-Smtp-Source: ABdhPJzOCwHrSMB7tIvTwSof0msP6bfFIKY/YKd4Cmc27cJFbObN5nrKXr9UpFeLPIb9bF9Qel8lQw==
X-Received: by 2002:a62:be11:0:b029:15f:ea29:9228 with SMTP id
 l17-20020a62be110000b029015fea299228mr2966501pff.8.1605292256658; 
 Fri, 13 Nov 2020 10:30:56 -0800 (PST)
Received: from [192.168.43.245] ([42.111.137.114])
 by smtp.gmail.com with ESMTPSA id k6sm10537919pfd.169.2020.11.13.10.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 10:30:55 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201112195840.5094-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <4883b4cb-2314-ed3b-c2b9-a29fc3a57b14@gmail.com>
Date: Sat, 14 Nov 2020 00:00:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112195840.5094-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: avoid
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

On 13/11/20 1:28 am, Aditya Srivastava wrote:
> Currently checkpatch warns us for long lines in commits even for
> signature tag lines.
> 
> Generally these lines exceed 75 characters limit because of:
> 1) long names and long email address
> 2) some comments on scoped review and acknowledgement, i.e., for a
> dedicated pointer on what was reported by the identity in 'Reported-by'
> 3) some additional comments on CC: stable@vger.org tags
> 
> Exclude signature tag lines from this class of warning.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces this
> warning by a frequency of 17.
> 
> A quick manual check found all the dropped warnings related to signature
> tags.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ac7e5ac80b58..f2369ac29d50 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2961,8 +2961,8 @@ sub process {
>  					# file delta changes
>  		      $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>  					# filename then :
> -		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
> -					# A Fixes: or Link: line
> +		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> +					# A Fixes: or Link: line or signature tag line
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> 

I think this patch probably got missed. Replying for your attention :)
Pardon me if it was intentional.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
