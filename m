Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C543BB4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIDceswV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84646817C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84646817C0
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VIDceswV
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2W7boVEyPtYw
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 18:23:09 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6D192817A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D192817A7
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-35c9cba4fa6so947335ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 10:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701109388; x=1701714188; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRI7cWlvOkyNkuDPrfXGivTVffcdI2V+Vot+f9MkWGg=;
        b=VIDceswV9cIbD7Yrym0Fu1XPRSA53limV2+3grtt+G5zvhOH2g5/ZmlyFaUWhYMbDB
         tg8VWa+nnBdOkbu6QulWii6H3GS0vvZx8I0mkPE6jhxINopXBDW5aEw69lkeiff1L5Kv
         5JeHqq9AyyYfH/M49Q45C0NZaG5tMxSc40l4x2hpRRVktiBRMoe9YCPk7ZjDVs9IUKC3
         xVcUS4yiCyJi/fTkEBK+qKVPBLIkdTa5B1VyqD7GT+PG6yWSJSLsNIVlI2fR4chXf9fB
         w4dJ9/cTEGJ8wUWWSJaMF8H1+lfqE2a9eh21DVMyPzRH8jxhZRHH9L82k0uHJqjQgpdp
         fBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701109388; x=1701714188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRI7cWlvOkyNkuDPrfXGivTVffcdI2V+Vot+f9MkWGg=;
        b=mlMGDKAsNH5jH2o+tM7eUUYftvQc1vV3Fu7P3JcLOQPwbFFeBUCJ6yu0UxqsnVYOIC
         ufDHjmK9bayo2Gygzc7Zz+HoS9ii6Av5VjHEA/4ot5rVJNIFz/jrNhVLkBRRFYyF+7mC
         Hiltsoi/w2TpvWh/0Tuym4KFxo07Vay+Z4DblKXerRj2S+WZnaOvtEJW27aQ4T/jiuGK
         /RTMVaCJRVpEyu0KDhmfxSHhGHhDfECTRVyYLlZPGNuKYqg5/5tL6rP+3z3Ppwuxicss
         KJtremiulFstoxMWPwprCyuHX3lSGgSKGZZ0QUMUssdHb6lypC/eFUMt8vK+qzBoHVO+
         n/OQ==
X-Gm-Message-State: AOJu0Ywer19g9N9U80uOn7GF/1mTmit96MeVqWT26u2NnhXFrEcJ4+Rb
	YLIXifDsmYi41IjSIbncWH8=
X-Google-Smtp-Source: AGHT+IFw2AHP+33vEEsm3DpKrdLapr09lmZwO4DhjBB6CLzAkroRuckY0uVMI7Ec4ltxP/lFPFc8uQ==
X-Received: by 2002:a05:6e02:12b2:b0:35c:963b:a018 with SMTP id f18-20020a056e0212b200b0035c963ba018mr6289252ilr.0.1701109388238;
        Mon, 27 Nov 2023 10:23:08 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id v1-20020a632f01000000b005898df17ea4sm7863665pgv.27.2023.11.27.10.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 10:23:07 -0800 (PST)
Message-ID: <dfb5b4cd-935c-445b-aaa7-bcce962a143d@gmail.com>
Date: Mon, 27 Nov 2023 23:53:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver : edac : Fix warning using plain integer as NULL
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, qiuxu.zhuo@intel.com, james.morse@arm.com,
 mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
 <20231127171435.GCZWTOe+DQSy4kkuKO@fat_crate.local>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231127171435.GCZWTOe+DQSy4kkuKO@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/23 22:44, Borislav Petkov wrote:
> On Fri, Nov 10, 2023 at 02:51:57AM +0530, Abhinav Singh wrote:
>> Sparse static analysis tools generate a warning with this message
>> "Using plain integer as NULL pointer". In this case this warning is
>> being shown because we are trying to initialize  pointer to NULL using
>> integer value 0.
> 
> And that is a problem because?
> 

Hello, thanks for reviewing this. As of now this is only a warning issue 
in kernel. I saw this post by linus 
https://www.spinics.net/lists/linux-sparse/msg10066.html and thought of 
submitting a patch. Also a similar patch of mine got accepted 
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2560740.html, 
so thought about opening this one as well.

Thank You,
Abhinav Singh
