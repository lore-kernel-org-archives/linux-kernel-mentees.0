Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A62D2E06EC
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986628; cv=none; b=Vr//GWVJGwgGhDTuvBrXbKQq6XVlBTnn7KwnHIMPK9pXcPdG8S4KU+EkRaQjwuHCwZvZwXFT+FQkoAafTDEvgSxANxogFZXfTE3eeT0cq8lb1NzHnF+BNuGtQgBd26xP1B/NhORNNbDX5sBmE9wjp9qnE97OJz2uaqBilwZac1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986628; c=relaxed/simple;
	bh=yRFc2sOlfC1VRaec8lpMMCRXQPh/gQn/3HBQl/s0F4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKWoSmF1Je3+9suLDod+WQSmq+PzJjkeF7TeI0TvZ64wFZFTHx7IYeqRLqPV05tqg3MoQJr/MlvC6evYpR7ZTA9pwLJrefD9f/R2MFaxYQTAn3zDCdv6q4O6hmg2hBKEf3TcjqPuzak69yX0pU6meJ35AczcC3bPNHKJO8CR698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdsP88Kl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdsP88Kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754986624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+sWFNTm6ZCYaG4jfBrFltTWcj45ITlaTFvMx8eQ5+0=;
	b=MdsP88KlmO3ypqbclnsJb4YTp6W2Q0enq2LTqMGHPm7nsJ59//s+4+3ooi9K2VF/BO8HrL
	Qb7sLRLazmodue5HDt90vSfblPO0gmS4cMJLminvnZppylBMerOokwKhTSNwIAGkaYNzrR
	F6F4zUuerEWF1qptzyhbFndT9jcDlY8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-7styv5w4MLCmx7IDjkDelQ-1; Tue, 12 Aug 2025 04:17:03 -0400
X-MC-Unique: 7styv5w4MLCmx7IDjkDelQ-1
X-Mimecast-MFC-AGG-ID: 7styv5w4MLCmx7IDjkDelQ_1754986623
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707648b885aso103088936d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 01:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986623; x=1755591423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+sWFNTm6ZCYaG4jfBrFltTWcj45ITlaTFvMx8eQ5+0=;
        b=XwtwPJtKVU6pxYOh+Vn8Q9xPavWBmn8xHWs6U2+plLL8DX4OTAIma/JzlB4l/mpegE
         r6xnu5E6h8+IC/v+US1ziYdhgtBUl4j3FG2IiOtwJUTEdGsSmaGllJLGDg0X26F5LFbM
         a8nAkkSy5vbSLMK0Z/4Ho9/ovmV2XJ9QOY6LG5TFcQCKJY647+fcgwEXpVcIcwA2Z5j+
         DqBDyVSzzgzOFTvNl8/wHCbhyOaP/soB7JBF5AcNI92RXKMl4HKhZ7sq6sjAE+56VEJa
         x7eoTi6b+llkdSmSHuNouYQPOChQpIvRXGSdNfbqOCD0SbmjQvoVwrZ2ilItJz0tCWpU
         F8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEzIkpaxvTq13/b+2SQSC6ICWUKVF0Bo/ulnuiBls15iAeNJSKqeKmxiGvIvQ3wnuRAMmZMuHE3VzUg0HHfkLdUN80XA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE3KdRXeNOnPDN1HtCDmN7DITFrC+VOYXXqiIOJVmGoNFn7/gO
	OCtU62Yxp++5zTxxUyfW1/VaAA6yEzupREcGxmuYdzX/uHyQ8XxSwTrI1vh7jP2+FouKZwmRidA
	Ifu7mKNNifCUtOVjQ9qTEUUNcl2lj4A6BTLw4cCj0JqmuvNDNqXzLgpdpcXwZhWRCaPtR8LlhBr
	V/
X-Gm-Gg: ASbGncvmpnFTZcUWVdhf6wx5hzlkR8wKTLwR766Nhb4Cz+p2REEezj5g2I0rEz+y5ER
	bbp8TYglp3DTo+v3OBbVrqnbFIDyjOOQDcnsQdRJIxsWRu5HsRtyrQCarRKt9/zI/keZHYNqfHP
	xzDx+GBL/hLaqlREg2CG4MuivX0i88IExUF6THTNPW8nPastn4NiuaXhvVZSEkACRPc/VOZi7Za
	kFDHr3SosEJ8Y5vE6Uqh5epWPrRGrR9lpZ8PvEIgPGiJRiyI/d8+m2wlxtMyqbr/TB9UbaN308M
	2FOeXeYh9djl6w807LM0iyqxNewjDds+NjBjpSjIyFw=
X-Received: by 2002:a05:6214:c84:b0:707:ba4:a21e with SMTP id 6a1803df08f44-7099a1d06cemr216500796d6.1.1754986622690;
        Tue, 12 Aug 2025 01:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJbyxt0za6gU5BC/SKoFHX+kaz9ByoX6QEm/XkTEr0Kp7Xbz+qdisalcp7XQIwZgZx/aDtsg==
X-Received: by 2002:a05:6214:c84:b0:707:ba4:a21e with SMTP id 6a1803df08f44-7099a1d06cemr216500656d6.1.1754986622302;
        Tue, 12 Aug 2025 01:17:02 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70937821c2esm147748396d6.68.2025.08.12.01.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:17:01 -0700 (PDT)
Message-ID: <0c3291b0-ab8a-4958-b317-ffdafe61b332@redhat.com>
Date: Tue, 12 Aug 2025 10:16:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ipv6: Check AF_UNSPEC in ip6_route_multipath_add()
To: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>,
 davem@davemloft.net, dsahern@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 syzbot+a259a17220263c2d73fc@syzkaller.appspotmail.com
References: <20250804204233.1332529-1-maksimilijan.marosevic@proton.me>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250804204233.1332529-1-maksimilijan.marosevic@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ouZjdnon43poI3RznC_BAwz5jssR9AVrIu3J0mAFlOk_1754986623
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/25 10:42 PM, Maksimilijan Marosevic wrote:
> This check was removed in commit e6f497955fb6 ("ipv6: Check GATEWAY
> in rtm_to_fib6_multipath_config().") as part of rt6_qualify_for ecmp().
> The author correctly recognises that rt6_qualify_for_ecmp() returns
> false if fb_nh_gw_family is set to AF_UNSPEC, but then mistakes
> AF_UNSPEC for AF_INET6 when reasoning that the check is unnecessary.
> This means certain malformed entries don't get caught in
> ip6_route_multipath_add().
> 
> This patch reintroduces the AF_UNSPEC check while respecting changes
> of the initial patch.
> 
> Reported-by: syzbot+a259a17220263c2d73fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a259a17220263c2d73fc
> Fixes: e6f497955fb6 ("ipv6: Check GATEWAY in rtm_to_fib6_multipath_config().")
> Signed-off-by: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>

Please resend in a 2 patches series including an additional self-test as
asked by David.

Also please insert into the subj prefix the target tree ('net' in this
case) and add Kuniyuki into the CC list.

Thanks,

Paolo

