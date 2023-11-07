Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6B1371
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z2PKisZs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCDD60C0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCDD60C0C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Z2PKisZs
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQShmSRUO4yP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  7 Nov 2023 21:27:37 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 92BCB60BD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92BCB60BD8
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-357bc05f94dso4169385ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699392456; x=1699997256; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAsdvc2tC0sZt5WnSCuHJooOBmtzWwDbQfPc2qj2gPk=;
        b=Z2PKisZseYI28w6L/GYkGFrEwz9LLr3xjdYcL8MlRLQMg3TQLTZ3rDx6GVVgDgyHRr
         aHQACzZkyq9Aaaz3RjZMoEeolFjx6P0+Q51wzLgf0x0XpvWHTuClWkbTk+gf7bxq33sJ
         FGwp0Dp5AFDB/iZaMiGCUAOGALfmv794aea5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392456; x=1699997256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAsdvc2tC0sZt5WnSCuHJooOBmtzWwDbQfPc2qj2gPk=;
        b=ftnHB/Op/OyWDMxCRicG0TdYxUbR3mTfW2mzJRg1LYdXQF9e3RZlGkryMB9ZOI0JGv
         LZO2J5CaG/+Pq7sKwacKw5YEdCZ46F/Hp3NoWB68izYx1F8JGzoaFu0cAqe69vVe98ms
         7Cd78zs0CraiNJR/N83Ux4sHwsby7LiPnBLfdesLXi3GDDqrOyoPMB2gkYhEIj4fvI10
         81wqIjH7rh5d6t5mLxE3wFdjOUYntRzFRYi2LNSZKc+M8Xnszh1UUpameeC8fNzVIXmt
         A07ILAr+WEC8uqyVCTNkd7mcAey3KnlUQtn90LljAdDjoozE3xy+dIVvsF1VC2aPXDIc
         hQKA==
X-Gm-Message-State: AOJu0Yzj1eUXBavAuv20ha5T6YfyQO+Bfd7RxC5+o3xOuh/4Ins8IkEg
	lsKu514lKfq0P272SSxXtUNunnLV
X-Google-Smtp-Source: AGHT+IGYtf5cyHwW5eJuAjjUmSGEMSQJ1dHkg8TrWpxZ3Ug1cH9OGIvl+qJ+v74/c3leRuemUosFxg==
X-Received: by 2002:a05:6602:b8c:b0:792:7c78:55be with SMTP id fm12-20020a0566020b8c00b007927c7855bemr176006iob.0.1699392456202;
        Tue, 07 Nov 2023 13:27:36 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id m15-20020a056638224f00b004500f7a5903sm2937020jas.102.2023.11.07.13.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:27:35 -0800 (PST)
Message-ID: <22df3ecb-488c-4d58-8efe-4638fa3d614b@linuxfoundation.org>
Date: Tue, 7 Nov 2023 14:27:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Content-Language: en-US
To: Atul Kumar Pant <atulpant.linux@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
 <20230923173652.GC159038@atom0118> <20231007154318.GC20160@atom0118>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231007154318.GC20160@atom0118>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/23 09:43, Atul Kumar Pant wrote:
> On Sat, Sep 23, 2023 at 11:06:58PM +0530, Atul Kumar Pant wrote:
>> On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
>>> Adds a check to verify if the rtc device file is valid or not
>>> and prints a useful error message if the file is not accessible.
>>>
>>> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
>>> ---


Sorry for the delay. I will pick this up for the next rc.

thanks,
-- Shuah
