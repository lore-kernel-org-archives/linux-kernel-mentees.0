Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE34CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 13:28:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A650E20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 13:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsAEhXPQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A650E20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7418688610;
	Fri, 21 Aug 2020 13:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scg2Nev1mHER; Fri, 21 Aug 2020 13:28:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F1C1E885FE;
	Fri, 21 Aug 2020 13:28:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3A7CC0889;
	Fri, 21 Aug 2020 13:28:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EB64C0051
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 13:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 647178850A
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILMWv1aB0YBK
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 13:28:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B11A2884EA
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 13:28:55 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x6so992276pgx.12
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m/CBpSFHw8cIIXQmbm6XYj5n0OK9MfncBwPeAaIrh90=;
 b=bsAEhXPQG7zrxMYVw4Oe0juVZa2uQ/QbOOkQcFGt0Pgnmw+k5xAmE7hA+ZXoNbf1Rw
 GpIszBPzrLtWK9j8l63v6FDIINL1BwFuyNwFP3qPuTSWlQJk4ypMISp3cmad6Bew+wRh
 YOs37DHauYQ36Bqttk7tz73F/onluSWIjBJefBqDI7ZJ0n1tEuwV1rs+yE1nnU3ciFFt
 0j6PvGrufZyADohsMck5tAZwOl3NyRvipoi4lAdkmRjZTi0h3wDg5RroD/OgIiuB8CTk
 gYoW9cNrCRTrtBKyV5czyKPP2hkfaPNarv3j0eULIBwdoOkD94ULP5rT/Diy10e3pEZX
 mM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/CBpSFHw8cIIXQmbm6XYj5n0OK9MfncBwPeAaIrh90=;
 b=UyxGABf8VwXCPcquSqyU7KM/gBlj8JaghJE70Sh/61PC71oL7Z0zYmxWv5x8BwQ6+5
 r/veRBm6CVoh9+fG4ZTot13fjGwXxZMljiYel4vaCuiDiiY+5a4z6AYnpjFWabDIP9RV
 hgi4XK5zEl7A+JpELu5VGe+KpkrlVuf0TZYx9OuUtxO3Wqux2AvEivlNP8MSZ0B6B0h9
 Ul+Z+wLQprlKIhzNMYUOSm//APU2AQVM+8HWeDAIaDYWFvMBpUDJhFrD0qHmCzZbxRty
 +tYIC3G7YCA5CeBDkj8t41wLg9rzJIdb7MPUS+VXTy4eP+RZgt9vWVCxVqgLTBVleGXo
 U+Vw==
X-Gm-Message-State: AOAM5325VimSW0cX7yYn7N1WCdKSFCESOieg40vPpKEF8LRsXJIKCmzj
 EeXgDcl2D4xj2LRdZDTFSYPksq6Rr9Puig==
X-Google-Smtp-Source: ABdhPJxi+z3VRraOdeKUxjuOYcR+iDEkjWT2sJbSMTFi+opOXZm9WS0G1ZGDpzOQmZXz3tDBbio+zw==
X-Received: by 2002:a62:7d0b:: with SMTP id y11mr2385912pfc.262.1598016534828; 
 Fri, 21 Aug 2020 06:28:54 -0700 (PDT)
Received: from [192.168.43.159] ([49.35.207.162])
 by smtp.gmail.com with ESMTPSA id h12sm2675889pfr.143.2020.08.21.06.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 06:28:54 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
 <alpine.DEB.2.21.2008171132050.8645@felia>
 <0e4f5ecc-0708-b64f-288b-a232afc46ac6@gmail.com>
 <alpine.DEB.2.21.2008210921370.27424@felia>
From: Piyush Thange <pthange19@gmail.com>
Message-ID: <953524ab-8cee-0c72-7c33-c942a5800104@gmail.com>
Date: Fri, 21 Aug 2020 18:58:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008210921370.27424@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linux-foundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch
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

On 21/08/20 12:54 pm, Lukas Bulwahn wrote:
Hello sir
> My request below is not addressed yet:
> 
>>> Can you run your script on all commits of this list above and record
>>> all checkpatch.pl reports, and store them in your github repository?
>>>
>>> Can you suggest ideas how to aggregate the findings and create a
>>> statistics? For example: Which type of error is reported most?
> 
> Can you answer the question: Which type of error is reported most on all
> commits from v5.8?
> 
> Lukas
> 
Hello sir,
I've update the files on github. please check if it's correct

https://github.com/its-crypted/Evaluate-and-Improve-checkpatch.pl/blob/master/README.md

Regards,

Piyush T.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
