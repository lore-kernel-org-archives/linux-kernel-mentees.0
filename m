Return-Path: <SRS0=u5Cr=7Y=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302C8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Jun 2020 00:20:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E1220747
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Jun 2020 00:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DWEhRDud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E1220747
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5A48125715;
	Thu, 11 Jun 2020 00:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nx+2w+RmpRvn; Thu, 11 Jun 2020 00:20:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C228A20436;
	Thu, 11 Jun 2020 00:20:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99AA6C0865;
	Thu, 11 Jun 2020 00:20:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 319DBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 00:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A14F87483
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 00:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_Mxev6lU3du
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 00:20:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 906C687475
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 00:20:47 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id k7so877311ooo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tekKttlIlBeTZkN8SBxqHrNXc30iKbZ4MuDZvNteBxc=;
 b=DWEhRDudhTiLYlpTDA0zEA9D6DYW8/yb3lExE2pUU7FsgMth7kZoG6ZIxBdmhdbLNE
 zc0banvqsmrr7uOn/Qp5EXYgCtU9j4P6hvqpL73aa0szyIB2td//htLT81BO9T2mPN+Q
 HmT4/Jgzitl52l99FnpWKOk8Qz/nF65RGUjd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tekKttlIlBeTZkN8SBxqHrNXc30iKbZ4MuDZvNteBxc=;
 b=YqUDMAjShyhcxylwq5T8UZx5RnG5Hdf+oEPVUKipN4d492Y2PEF7fUKflwMkUBh8fd
 BkGRp0v3rzIXQgqniQsPkug/cseILMOJQjzRiP51y8iN9inGV0DUjPtdvjw1Um1jNauy
 a6zim3qx8qznIpER2jEVb+IU8GlDN+GtA+iGlLtIqr2/SE69JFgTZKqhGve7gHKoySsM
 GHPTPzyBTFoeWPX06V8F5obdc0Jq2KoMHxDaiaEzbjeaWVPxrNgao6HKHyPOselHRUfe
 lr9UOAm7IHiyMMmPFBZ4EuHFa8LedMMhD3lDZoAI9AbWh8zzXRcrR3i2S7rIL1on+42J
 R5XA==
X-Gm-Message-State: AOAM530OQHYk8pbrH5z5Jpx0QDj+o4NNk/f0D+bNQGtxmRKlsOHsyFW5
 VAyEQfPZfEAOkNItqRKJS34FVgdyU+Lj3g==
X-Google-Smtp-Source: ABdhPJw9llgd5uvr1pIoR6GWAJIrhVu6kFulyVTqw0Gey42QKm4C2gva/9gvTzE7H4ed7PI7XJvlCQ==
X-Received: by 2002:a4a:45d5:: with SMTP id y204mr4677851ooa.73.1591834846298; 
 Wed, 10 Jun 2020 17:20:46 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l11sm331874oic.15.2020.06.10.17.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 17:20:45 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>
References: <83bc1b7a-ee84-d074-d04d-5fdb39e777f2@linuxfoundation.org>
 <20200610233109.n6pxir5wba5u2f7u@r>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1060c4f0-3408-4537-d471-8371a761d005@linuxfoundation.org>
Date: Wed, 10 Jun 2020 18:20:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610233109.n6pxir5wba5u2f7u@r>
Content-Language: en-US
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

We are working on that. You will have a coding assignment soon.

thanks,
-- Shuah

On 6/10/20 5:31 PM, Coiby Xu wrote:
> Dear Shuah,
> 
> According to CommunityBridge, a link should be sent to me for a set of 
> follow-on kernel coding tasks after finishing the LFD103 training. But I 
> haven't received one three days after submitting LFD103 Certificate of 
> Completion. Should I send this certificate to you instead?
> 
> On Wed, Jun 03, 2020 at 10:05:54AM -0600, Shuah Khan wrote:
>> Two new Linux Kernel Mentorship projects
>>
>> LinuxLinux kernel Bug Fixing July-Sept 2020
>> Linux kernel: Refurbishing make coccicheck
>>
>> are accepting applications now. The session starts on
>>
>> Please visit https://people.communitybridge.org/#projects for
>> a full listing of projects and search for Linux in the search bar.
>>
>> thanks,
>> -- Shuah
>> _______________________________________________
>> Linux-kernel-mentees mailing list
>> Linux-kernel-mentees@lists.linuxfoundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
