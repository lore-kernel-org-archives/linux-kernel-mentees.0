Return-Path: <SRS0=u5Cr=7Y=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A38C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Jun 2020 01:01:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102DD20747
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Jun 2020 01:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7a9DLwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102DD20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4F01878BA;
	Thu, 11 Jun 2020 01:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnWTOmKOq1_7; Thu, 11 Jun 2020 01:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99C16878B9;
	Thu, 11 Jun 2020 01:00:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87736C0865;
	Thu, 11 Jun 2020 01:00:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13041C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 01:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 00C0888398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 01:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcCyhlx87FIm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 01:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 67898880E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 01:00:57 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id m7so1652365plt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 18:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3VU8au8L3ywWGT23QNVEBVoHOSv9Ll22rc02VvvBic8=;
 b=Z7a9DLwQz/Iczx43n+xdwAGYJsplgHcQfGgxHQ5qpVw+ZIt5992S1og4DMuwUoJvY8
 Z0GCT02jI6AisQnkUr8RDwzCP8HL7/2vyCyHrBJM7uYAoG+i/zTzYmwOXpTtEnipZzX1
 zjeoVaPW3BWxw8z7RIM1nzCBK3GybEPNltLkAcMkm15Kox4DpMwaomVnA+UT0nwTBfPU
 6QQYhYQiqzbkFPPOdJ8mdbtaqyRHOfaLDPFHKfbwXvwZij1dRVHw+nBc8w7lU5lIdJtP
 jxtMzIVhpWpOyN4us3O0JlS1w3BYAfwd73amrzWSvX58D+vtng+nTKjWZJaVLEOViVRv
 gCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3VU8au8L3ywWGT23QNVEBVoHOSv9Ll22rc02VvvBic8=;
 b=mJ6MqMsexklt+RxlVb+O5WcqffKwZkrERynxpyR8lxDKOo8mYVbV4D+rUAvSIHnRJW
 1/58Yde6yi0YTMTKcAVJBVVVEUYqST39ZMfr/TKDK6U4/HlJtVYYhJnSoZC0rgyM/Bdc
 zhCQy7sHKETp+q1Ho6Hr5GUmwxWwVWsZouVltgdYbsTEzBLHPMSSn+MRFqdqlMcvAjx5
 eJMCcd6gyga3kR5nbvbpUJbOgVGms7MokhQ9wMAEi0qNUnsI7lv+AfmwcHTRpaJzBUKU
 OrRA+4HnRFRM2gWwudIxQzkd+wDspe/qBSDuy5x7EiCCyPCnEFgCwdTtV/JQ8irHQRS9
 XViA==
X-Gm-Message-State: AOAM5322RgHEfPAmJwLxmcorR/rWf0gQdbAmtWwjfqB36Jp79nYeTT1X
 j+2woxwCJ7XAkEgUyWDNGFk=
X-Google-Smtp-Source: ABdhPJx/8cUEbVy42U56LTLipL/CjzHYkJtfMOjAVHxNhIq37ApkgaTtOhMWXeMxH5rZKVx51J5wSA==
X-Received: by 2002:a17:902:d686:: with SMTP id
 v6mr4964868ply.283.1591837256943; 
 Wed, 10 Jun 2020 18:00:56 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id m12sm842282pjf.44.2020.06.10.18.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 18:00:56 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 11 Jun 2020 09:00:52 +0800
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <20200611010052.nssoel7q7cs7pr5c@r>
References: <83bc1b7a-ee84-d074-d04d-5fdb39e777f2@linuxfoundation.org>
 <20200610233109.n6pxir5wba5u2f7u@r>
 <1060c4f0-3408-4537-d471-8371a761d005@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1060c4f0-3408-4537-d471-8371a761d005@linuxfoundation.org>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] New Linux Kernel mentorship projects
 accepting application
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jun 10, 2020 at 06:20:44PM -0600, Shuah Khan wrote:
>We are working on that. You will have a coding assignment soon.

Thank you! Looking forward to that!


>On 6/10/20 5:31 PM, Coiby Xu wrote:
>>Dear Shuah,
>>
>>According to CommunityBridge, a link should be sent to me for a set
>>of follow-on kernel coding tasks after finishing the LFD103
>>training. But I haven't received one three days after submitting
>>LFD103 Certificate of Completion. Should I send this certificate to
>>you instead?
>>
>>On Wed, Jun 03, 2020 at 10:05:54AM -0600, Shuah Khan wrote:
>>>Two new Linux Kernel Mentorship projects
>>>
>>>LinuxLinux kernel Bug Fixing July-Sept 2020
>>>Linux kernel: Refurbishing make coccicheck
>>>
>>>are accepting applications now. The session starts on
>>>
>>>Please visit https://people.communitybridge.org/#projects for
>>>a full listing of projects and search for Linux in the search bar.
>>>
>>>thanks,
>>>-- Shuah
>>>_______________________________________________
>>>Linux-kernel-mentees mailing list
>>>Linux-kernel-mentees@lists.linuxfoundation.org
>>>https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
