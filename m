Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48750E7F14B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Sep 2023 01:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8993360E8E;
	Wed, 27 Sep 2023 01:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8993360E8E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=M3Njdvwp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u18Utz8kc5w0; Wed, 27 Sep 2023 01:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 905D760BE4;
	Wed, 27 Sep 2023 01:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 905D760BE4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74B56C0071;
	Wed, 27 Sep 2023 01:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35A0EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Sep 2023 01:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03D2160D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Sep 2023 01:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D2160D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IW6159H9lDN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Sep 2023 01:18:31 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D6D360BE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Sep 2023 01:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6D360BE4
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-34f69780037so5833105ab.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 18:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1695777510; x=1696382310;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pSK45h5LTS9VqkVC57gaj2Wd82aeyGKZrEYe4dJCVic=;
 b=M3NjdvwpOwtV71x0/8Mu3rSeBPjSAq70mI05Ch4fJbEXabAPQPiDq0es6NlSw9YyZW
 aMis5FaSTCrqWEEgbs1iBKU0oijZ97aKEAdnCInw8a/1cEgIHMuWs8QaMLmWcqLAKeK4
 Vax5Ib2PsVnfDT81zoh+7xbDBqwiMijYy8gBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695777510; x=1696382310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pSK45h5LTS9VqkVC57gaj2Wd82aeyGKZrEYe4dJCVic=;
 b=d77sZ2ERYBzpRZWWUtB/ZhHsElfu9oM6425ZIrSEt6anZPg9cCE7tMI1GnQNwDVf7s
 HFyN8kKg6M8Ln9Mk3SKvDNaC1Q2yGlgMVxRqU1oGiYNtAkR4xj+EY0IdkCNmHj6mN1l0
 jvTH8hnSatS/MH2VOYaiHWOyTzn+O6cXV1piL+F782bLLfqVA24xaMFxBLYY/vCcbsM1
 WcHgYr2xbGjWLLe3Cj5YqcO+hGBbbS/L6i//KHA0UT0YBSefJk5vP0QmSub6jz2YyAvq
 LxWFjFDpRcA2n1C8rHM17vUauSbWByOwvBomBNmbC4Tmr0cZp3g96EGfn5Zm4WBPVg61
 DmUg==
X-Gm-Message-State: AOJu0Yy2SnmNT/n5ChUTuFoy3YLDWcQoLIfNOCpySTq7M0cEgM3wlan3
 msoX+9cX0+BBLNtzG49hSLaur7SZ
X-Google-Smtp-Source: AGHT+IE2jaCutfBvakslg8GPNafee+TlzK+8frCnXrODTVfbk9z1YRbburEMP7cvS9iSP7ZFw0fvlQ==
X-Received: by 2002:a92:cc46:0:b0:350:f353:4017 with SMTP id
 t6-20020a92cc46000000b00350f3534017mr614948ilq.0.1695777510062; 
 Tue, 26 Sep 2023 18:18:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 y3-20020a92d203000000b0034f3220c086sm2389624ily.12.2023.09.26.18.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 18:18:29 -0700 (PDT)
Message-ID: <fc915b30-5842-5851-bd76-71c2133685b9@linuxfoundation.org>
Date: Tue, 26 Sep 2023 19:18:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests: Fix wrong TARGET in kselftest top level
 Makefile
Content-Language: en-US
To: Juntong Deng <juntong.deng@outlook.com>, shuah@kernel.org,
 mic@digikod.net, brauner@kernel.org, keescook@chromium.org,
 tony.luck@intel.com, gpiccoli@igalia.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <VI1P193MB0752596147F224B9F921C85199C3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <VI1P193MB0752596147F224B9F921C85199C3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-riscv@lists.infradead.org
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

On 9/26/23 12:03, Juntong Deng wrote:
> The 'uevents' subdirectory does not exist in tools/testing/selftests/
> and adding 'uevents' to the TARGETS list results in the following error:
> 
> make[1]: Entering directory 'xx/tools/testing/selftests/uevents'
> make[1]: *** No targets specified and no makefile found. Stop.
> make[1]: Leaving directory 'xx/tools/testing/selftests/uevents'
> 
> What actually exists in tools/testing/selftests/ is the 'uevent'
> subdirectory.
> 
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---

Thank you. Applied now to linux-kselftest fixes for the next rc

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
