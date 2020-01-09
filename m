Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C80C33CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 21:11:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290712073A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 21:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L2kCzDh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 290712073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC8B82045E;
	Thu,  9 Jan 2020 21:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FiSXSBeGmP4M; Thu,  9 Jan 2020 21:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 62E4E2045C;
	Thu,  9 Jan 2020 21:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DC99C18DC;
	Thu,  9 Jan 2020 21:11:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57455C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 408A785B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0I+7kggQf-77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8549E85784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:11:12 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p8so18796iln.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 13:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zUBCQgWCCDUWNqjQ7e1ylH7IPRFbX2pIzRfeEunoVEY=;
 b=L2kCzDh3dtI7ByfJ+Iyp+44RV906xEr1b+3KPgGEkqJtCEI/xroyx7duBdJojo9/Fd
 cr36W7zQ7FGIGsbtUwAw2WvYeazIHP+droT6lJ0YI0OR6e8OC73rwYTFF8dJ51oW/HaI
 8Wfy9G5R/bx2U7Nq3Te177yd8asTvo7hOvKTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUBCQgWCCDUWNqjQ7e1ylH7IPRFbX2pIzRfeEunoVEY=;
 b=MDm0V51B+JxAd+ok5FEaW3S3W89klipvJtPv3SYSABTZ8qq9ndtq+ZI/DRf+SiEu5a
 jv5f355hZDVe5x3x/nw6k6cYhY0nrmYj5kcxZDq31gGn0XpGjeyx2HFLeeZaXgf6kiQM
 a/ZDQB1pqXvB4LSXvrZz64upxfjp9DNttbTH1JVdbYtzMaWC66vuWOWbPsyiWv/yQgx9
 PY8acmE/aQpPb0RKMVw0NpjoOGW5jeV3cGHQbl2/YojaKFl8hypqAUmGIrg2xBCA7T01
 MLEcz3euGhdkUT1PJRfOVBsxSOlXU06zKjj6nrM1bxMvmENrGa4+62jp1hL512hJHNYC
 C1cQ==
X-Gm-Message-State: APjAAAUV0K5NFiyaqGniWO5LEJp6z2G2X57tlrW9i3nyTFgZ94whD1Mg
 KUHTz/mgEmgXgPvsCbNbRWcailFs
X-Google-Smtp-Source: APXvYqx+Vv0BDkJHQMk0Fxpfbbmx5UNiMe5sZssdqg1YaQYc8XzOg++Eh2pJU6po+Oo39/eYa6/Wxg==
X-Received: by 2002:a92:5cc9:: with SMTP id d70mr10329698ilg.210.1578604271855; 
 Thu, 09 Jan 2020 13:11:11 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id o12sm9635ilo.24.2020.01.09.13.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 13:11:11 -0800 (PST)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
 sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
 <ebec2bb5-8db0-76fe-9c66-0316c1800f7c@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <adb61fd6-fc05-173d-9795-9ef36c4882b3@linuxfoundation.org>
Date: Thu, 9 Jan 2020 14:11:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ebec2bb5-8db0-76fe-9c66-0316c1800f7c@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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

On 1/9/20 2:00 PM, Daniel W. S. Almeida wrote:
> Hi Shuah, thank you for you input!
> 
> 
>>
>> Looks like there is more code to be added to register/unregister 
> 
> Just to be clear, attach() is missing, but register / unregister belong 
> in the bridge driver. Is this correct?
> 
> 

Right attach/detach is what I was thinking.

>>
>> Please add more detail here on what this driver does. What this
>> driver is used for and so on.
>>
>>
>> Samehere. Give more details on what this driver does. Add enough detail
>> to help users decide why they should enable it or not.
>> General practice is the following.
>>
>> Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
>> Please add details about the driver similar to the .c file. 
> 
> OK.
> 

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
