Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060D6C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:35:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C52206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVHCGlJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C52206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8DD15896A6;
	Mon, 13 Jul 2020 18:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 970UJ3i93Qv4; Mon, 13 Jul 2020 18:35:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB5E2896A3;
	Mon, 13 Jul 2020 18:35:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF26EC088E;
	Mon, 13 Jul 2020 18:35:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C1C6C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 483B28904B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7JwHoUSE2i7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:35:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60FC788FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:35:45 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id r8so11801251oij.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pfifxRNrRUR2T4uYGwKiE9RMe487XzOwMSNlNFzce1k=;
 b=HVHCGlJRjYfmXT7uQQTMqziIBypODRZa7gCfW4kTMKTzzuv3te+ebl9nfo5ikRkY3g
 ZZBk3lmPazFumhe2INJfkq16MDSGwl3YCJbANDNbzBuY440EXwvbyuBmTTeWi27pcykR
 m9FfjxokzGaBlJ4wGVcVYTMGaZ2uin1SB7zCs+pU/gAj8SGFpjX4B0mf3i5NSVriEFty
 713nUE12sid3xqDCL4x2RfdeME6g9f674IZLzWyNgUGKfpplb0VOozAdowMbcfVrLu4/
 M91CXZTtp1kK1zfoa5Bh0AM+tWHWWrIev+fp8655BD3GtZtFknvVp93t1EYQ0apE+d23
 kKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pfifxRNrRUR2T4uYGwKiE9RMe487XzOwMSNlNFzce1k=;
 b=tqd7wXoYIyHTnQtLiwhNIgS6/ZZB04zPH6qO2Hel9Z1FQpg5PkZ3xk+tS79B/FHTfA
 Tx0aEaZJ7XnwGCY7b2K29gUVvj4zegPSKRhuta4DrqJCOcFOe/ukwXV3RQ4X7RHKe87Y
 TowaGNA/eQIzluXUjmBZNy9sXRBbWHR+DiprchjNeqk15aeMqSrHbSPHdjWdTKTQPyr8
 Ij0O4ytse7GQsk/cVCOSXokZsH74rzpxMQzsRCTHnT3SfgZDLzU7WyjJL+v/bWMnSGWL
 4NhI3ekft9hJbkulRZLG+7BBzjah0c/vhHQjGxdNzCAJPsVJSdGiU14LP33XjJgs5iFk
 q4vg==
X-Gm-Message-State: AOAM5306crY0YP8lYjcxCQ6SYHERJF/LLZP/g7Xjjy23MAW/Cc1Ba7Vu
 FZ6+A22QMDduHd3yIDUrH8g=
X-Google-Smtp-Source: ABdhPJz3GQ+85yUO/+PkLfsc+YTRMOpRwB45jn1PhyabY7CvTaSczcOYsYChj491oYeq1eXtgklM+g==
X-Received: by 2002:aca:4e16:: with SMTP id c22mr648602oib.53.1594665344656;
 Mon, 13 Jul 2020 11:35:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id n84sm2957528oih.9.2020.07.13.11.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 11:35:44 -0700 (PDT)
To: Saheed Bolarinwa <refactormyself@gmail.com>, helgaas@kernel.org,
 Michael Buesch <m@bues.ch>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-3-refactormyself@gmail.com>
 <70e57af0-6a8c-a893-67c9-0181af16ae2b@lwfinger.net>
 <78b52ad5-015f-4452-0cd0-dbb2c8597672@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <886881ac-37c6-596e-5f68-07242ed1d2e0@lwfinger.net>
Date: Mon, 13 Jul 2020 13:35:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78b52ad5-015f-4452-0cd0-dbb2c8597672@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 02/35] ssb: Change
	PCIBIOS_SUCCESSFUL to 0
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

On 7/13/20 2:13 PM, Saheed Bolarinwa wrote:
> Hello Larry,
> 
> On 7/13/20 7:16 PM, Larry Finger wrote:
>> On 7/13/20 7:22 AM, Saheed O. Bolarinwa wrote:
>>> In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
>>> Their scope should be limited within arch/x86.
>>>
>>> Change all PCIBIOS_SUCCESSFUL to 0
>>>
>>> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
>>
>> Could you please tell me what difference this makes? It looks like source 
>> churn rather than a substantive change. The symbol is defined in pci.h and is 
>> used in many architures. Certainly, PCIBIOS_SUCCESSFUL indicates success even 
>> more clearly than 0 does.
>>
> It is a trivial first step towards a probably significant task. I explained in 
> the Cover Letter, I can see it didn't get through but I Cc linux-wireless 
> (properly this time). Probably, too many addresses.
> 
> I have resent it. It is here 
> https://lore.kernel.org/linux-wireless/20200713185559.31967-1-refactormyself@gmail.com/T/#u 
> 
> 
>> Why is your name inside quotes in your s-o-b?
>>
> To keep me company before I get to know my way within the kernel.
> 
> I saw people with >2 names do it, so I did! Please let me know if it is odd.
> 

Thank you for the explanations. The cover letter did help.

For both SSB and BMCA changes,

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
