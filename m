Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFF0EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17318415AF;
	Thu,  6 Jul 2023 19:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17318415AF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=J7FPWLa6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duhszuM2djHO; Thu,  6 Jul 2023 19:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 25A48402F2;
	Thu,  6 Jul 2023 19:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A48402F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 131E8C0072;
	Thu,  6 Jul 2023 19:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BFF1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56D30822D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 19:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D30822D2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=J7FPWLa6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnzl1ayaqK2m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 19:43:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 889BA8218F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 889BA8218F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 19:43:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3142498c2e3so249837f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688672597; x=1691264597;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nhm/jJrR1NHfK1pGN7EZo6eMVf2ZaHxU5UH60jdxSyw=;
 b=J7FPWLa6RpMlLOE5RwQYNk7L0ElaT87B3FFxGzrSTfNoLYbmh5D7OTsBd1JHcS3mWl
 qQFW19Yg6zo6RIsqFzjEI3yOOUPyulybQEVp2/4x8zka/caCLKTUXKxghUx87DaZDDJP
 tk8/cEVxgeityp8j/OrsFUoVt/xvKiuuOWzO60hb11C1uRYGK5b5ZjLine3roP8JAHKJ
 68xnFe8waQ9DgBgDZFueue+Sa3V7XDwr9ljNQuQvWjhB70msf6AFKdPUOupTeyQWRrRJ
 FrHrWSm2TwNQahuEajzeOXgUVBzNCFnv1Mb1UiQ8gOWkVXiYo2rUOZ9bAwBRcsDlgE2n
 smow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688672597; x=1691264597;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nhm/jJrR1NHfK1pGN7EZo6eMVf2ZaHxU5UH60jdxSyw=;
 b=SIwYcQW9B7ebykuiCrCJXFcKJWvNSPwjjz57uMzksHGpybc3b5NqGJ6uDGKuVxjM8v
 axWvRLaxNKXV8HoHr+YAir/A3AF5ypvphPTXh42080sQrv5wxIlHLlmOP7VxKP1u2CU8
 QTEnOqTPkkujBpyNK2+OOqdH0EGYH8MOyKnH+mZLDkC1KtpGDp22zRvKguxuspZPFk/z
 VH+IOiSavZyTnLvE+b3n8hXYeQDOgI83d370WIoAN+/zNDi1bkb3QFR0TXGb55UUeCGo
 LQpdoopvHtGHoyOOzoPqUwX0Ie75jBYqHDHoeJY7WxID9KcTkX7gLbo1Y+vDgT+DAQk6
 xCUw==
X-Gm-Message-State: ABy/qLZDe8hgUkC6WyotRzSiEGRbMd+MCUNrdmbe0Gf1+Y6Go1Lcwznr
 IHbnEE0AQQJJykHCihE/ILA=
X-Google-Smtp-Source: APBJJlEFW+Gf4pNbVCJS5ndRPmqxjCcienCUY7YNr8CRXubOimUzh/nbMUVzze0tUFBGlgW9yfhOhQ==
X-Received: by 2002:adf:e706:0:b0:313:df4b:414a with SMTP id
 c6-20020adfe706000000b00313df4b414amr2219200wrm.5.1688672597403; 
 Thu, 06 Jul 2023 12:43:17 -0700 (PDT)
Received: from [192.168.10.215] ([141.136.92.16])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adff848000000b0031128382ed0sm2590580wrq.83.2023.07.06.12.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 12:43:17 -0700 (PDT)
Message-ID: <4e4a3024-0482-665c-212f-f0084f404239@gmail.com>
Date: Thu, 6 Jul 2023 23:43:15 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
Content-Language: en-US
To: Anh Tuan Phan <tuananhlfc@gmail.com>, bpf@vger.kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, linux-kernel-mentees@lists.linuxfoundation.org
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
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

On 06.07.2023 20:00, Anh Tuan Phan wrote:
> Update the Documentation to mention that some samples require pahole
> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---

Minor nit: you should write what changed since the first version of the 
patch here, otherwise the changes are pretty hard to follow.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
