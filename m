Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C96C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 14:28:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAAC9208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 14:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QmfhfLNS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAAC9208A9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 49476203F0;
	Fri, 25 Sep 2020 14:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCbflB63RG-C; Fri, 25 Sep 2020 14:28:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BEA0020345;
	Fri, 25 Sep 2020 14:28:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A80F2C0890;
	Fri, 25 Sep 2020 14:28:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46701C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E82186E0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgLoJBMhcwll
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:28:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 69E3786B92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:28:09 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u126so2919653oif.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G8QtUwrCHJLLR9YFfvu8PbgWqFlh+WruMBeIvJCk6Qg=;
 b=QmfhfLNSjj02XYV+T3ndwMxF1Ai/GPHs+A0zqvrhuk01lBft0ASnbfK5vpwFDvUL8y
 G8h6zj+X+X93ZLwM7kYb5NSNqkj/semEN/Sgwo8jFgcQqUsGcZAVY1UulTROLWkt4BQn
 H2DAAMrFRLDgDZXQbS88fPc3lM3h3ikNzhcuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8QtUwrCHJLLR9YFfvu8PbgWqFlh+WruMBeIvJCk6Qg=;
 b=o7EJ1hA5gIqZH2wNgLPNU69+xOKgfxPMnMHEL87YHqlXZ8EUCew33ooxK38MZR2/sE
 W15i1v4e7v8+JV9o7/GYTF3aC874z9t7qaluqwpJdzY2U77MqcW28K+QZ+mJZBPHuRU3
 Qj6kA803EUYXfSdUEY2rw+4fO76aNG1gEP8SxFHmBf+x3ohbki1LXgBnH3r4Ps++qq8T
 Yri4tYcQ5MFUOheVycfEXLz9dtsyZQ5Obw2CbyTrmEHd0Ndc/PXRh7BgVaCyW2qGGPDc
 eo5J0aagcTcez4PHk3eHe2d5D//3fdeEH4p0pBn3n1kn14aSmUjsSevdpD1WGSkg9epa
 jR9A==
X-Gm-Message-State: AOAM531pQC8QTQUZJkQSuarDgStdPizCWgoWt4II2aj9gEdlBdpC/jF/
 qKoZ7koIEu0ejpHH3fA/7oErcx8v
X-Google-Smtp-Source: ABdhPJwaouCNx9BOs9/fDlJv4TizFGG9Wao9IuUQxYVTKbkCA1/r0DPbAu6C9FU0ikaoHC3KRni0LA==
X-Received: by 2002:a05:6808:69a:: with SMTP id
 k26mr385953oig.127.1601044088598; 
 Fri, 25 Sep 2020 07:28:08 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id a13sm614466oib.35.2020.09.25.07.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 07:28:08 -0700 (PDT)
To: Pavel Machek <pavel@denx.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
References: <20200925104739.GA26609@amd>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ae09855e-79d1-a77f-289c-0a2c7d131649@linuxfoundation.org>
Date: Fri, 25 Sep 2020 08:28:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925104739.GA26609@amd>
Content-Language: en-US
Subject: Re: [Linux-kernel-mentees] Help wanted in LED subsystem
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

Hi Pavel,

On 9/25/20 4:47 AM, Pavel Machek wrote:
> Hi!
> 
> In linux-next, I published TODO list for LED subsystem. Is that
> something linux-kernel-mentees could help with?
> 
> Best regards,
> 							Pavel
> 

Thanks for putting this list together. Will you be able to define
some time estimates for there items? We can definitely add these
as projects to get done.

I am working on mentorship project plan for next year and we also have
an active extended mentorship program underway since June and will
continue until June 2021.

Things to consider is scope of each of these items in the TODO list
and mentor availability.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
