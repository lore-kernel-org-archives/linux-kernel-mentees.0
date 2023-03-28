Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE54C6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Mar 2023 16:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32E940932;
	Tue, 28 Mar 2023 16:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32E940932
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=PytFRiSd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYgU8uUmW9NJ; Tue, 28 Mar 2023 16:38:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9588B40924;
	Tue, 28 Mar 2023 16:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9588B40924
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F911C0036;
	Tue, 28 Mar 2023 16:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84E1DC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 524D7818D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 524D7818D7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=PytFRiSd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMvdIkuexyF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:38:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9893481852
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9893481852
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 16:38:43 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id y85so5589749iof.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1680021522; x=1682613522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9KH8xtjT2uay9RuE8InbX2zUThEe1/Y3p+Ny+ncZsQ=;
 b=PytFRiSdnJikNU1nfaYuauOKvTIz0ErnRZMUxY2Cz1177f9USRCA116Akn58EcBll4
 YhZ4W7Wz8janbfNCyn3IgXfC3Wt2JKnxLm2yF4g3FFyPZuYhOEOFJbWS63KqZC+azTCn
 5kiuYWy+00/QbPPK+468NDppzKZh1yt+vDt3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680021522; x=1682613522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U9KH8xtjT2uay9RuE8InbX2zUThEe1/Y3p+Ny+ncZsQ=;
 b=D2CUMYDTMbjR+DS7IKdJoEA5HvVYH72jV4TjE0KwyV2N2vvnw3iR02BVF+SJzOmTlV
 Ohe4VIKcGZuFF/fxxHjUXElObe26wbl7HGxTe+qI4C8lBLGd5D+pxptQTXjm6sGv/afy
 HaVv0PiHwyw336RH8auj9y1PiVb/AToclzpKtTCFveJAKguB0dYtlxB3JWSxX9hpBNKC
 7AT7xvusrmoo5Tbieow8c6Yx0IRx+c3ijhG1MCXFGZEJy3qccfyf6vpqu/Y+pE+jJIcb
 IxYUHbUmixWDCRyu5haZ6tYAVZrDBxZAK8njenobl8PwK8jAmw438VK8hDPi48Osb2T1
 UV6g==
X-Gm-Message-State: AO0yUKVGoW9kb/2nGU9a/h151e/SMu8ZPrSJeCmfmN1iozuSqfR40Fqi
 U6EZGOaUf5tg6I4E3S5FYZ0CXRg5
X-Google-Smtp-Source: AK7set/VnehVyoKm9sETjZ4TBO9vEVJfQpDQrPAW1oUdZAWB6BlMISkZOgxV5oAlXQH9LSavp6NmFw==
X-Received: by 2002:a05:6602:2f04:b0:758:9dcb:5d1a with SMTP id
 q4-20020a0566022f0400b007589dcb5d1amr11633484iow.2.1680021522586; 
 Tue, 28 Mar 2023 09:38:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05663810cc00b003e8a17d7b1fsm10078548jad.27.2023.03.28.09.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:38:42 -0700 (PDT)
Message-ID: <68ef1d33-af91-48df-8735-49c6750f1b99@linuxfoundation.org>
Date: Tue, 28 Mar 2023 10:38:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] selftests: sched: Add more core schedule prctl calls
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>
References: <20230327201855.121821-1-ivan.orlov0322@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230327201855.121821-1-ivan.orlov0322@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

On 3/27/23 14:18, Ivan Orlov wrote:
> The core sched kselftest makes prctl calls only with correct
> parameters. This patch will extend this test with more core
> schedule prctl calls with wrong parameters to increase code
> coverage.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2: Unnecessary printing removed - 'validate' will
> automatically print the message in case or error
> 

Thank you. Now applied to linux-kselftest next for Linux 6.4-rc1.

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
