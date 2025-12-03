Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9630F7F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788220; cv=none; b=CBzSlmalmRoHZvkOD7ufBKdQYCOfjpODq5yTMWjOP9mqh6n2v0llIeUKgCNjTa/6fPq2zb90iAUKk0joGO30kaic/MD7DcgeBW+Y/k7p0kVGTlJAR+naVeg3ziEB7met6aKNhkL1JF0uHa6M/9HFl5+DhVMchj9SS+Q9DfCVA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788220; c=relaxed/simple;
	bh=451eezjKzgyOtVuH33TiHjo9Apd1b2ad46/RYOa3TK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luAWFTcQK7sCdqqNrwf9yDwT9vstZJhBKHNF1amzF/LFGHETZ6d+u0OXi4sVaS/SsoGp9HqA4JD0LCNi0mvFE3Wp8NviE7hoMhlhqBmKR5gxwnm+m/SvvNjlW9TOXOBn9WSYQnceZnmxauliGZXwhooAF6wc62LQPfm0A1ka90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNuV8oQv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNuV8oQv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89B4842A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DB0pdp90OYEx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 18:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29F4A842A4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F4A842A4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hNuV8oQv
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 29F4A842A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:56:58 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so56877b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 10:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764788217; x=1765393017; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71E/ilkLBTqKwG0Dx6ylFmlxqv3BqJ7EmKi1/R6JSno=;
        b=hNuV8oQvDCx5SXQ+fMxm0OvuMV2zLaDCBEiM8PgbNxcpSn2Pz091GFRsebOB8Lo96c
         5bZElz18IAHCAYoDLJTlEhwg2PLF09Aj/zpS27H58rUuBULr+GL/+UV1vovq5DMBgkpY
         z+FJUP3yC6pwFIoOfaY8YmX4QS4iEd5N+WMmhdG8puj3zL3KZL7XFHehSm+Ldp330KaB
         c8Mtrnu2PsBZhOrZE4a6dBb5N+NYLBM8V4Wr1LMkBF8yWA17K94MqTgsaqwtAeW0il3q
         H+gf6CNyt+z9MO1bcILt9TwG2fvaESsOP/OetftFlhcMfvJkrKVcIn17Gpgde/dRPxgR
         aSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764788217; x=1765393017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71E/ilkLBTqKwG0Dx6ylFmlxqv3BqJ7EmKi1/R6JSno=;
        b=EPWGc51sWnyN1DqS3fW2Vuzbe9srvDe2Yg7HljZa8OYVsbUgrbFrAg8tBCLC7DmqaB
         A1ORMYAOfXcOhjquBD+oUle3h98SyGy84s1G4NvOmVYi6mym49RUNhfr+xEln3xc7Sit
         77ZlgImAOuJ8UEC0HSE4BhM9AGJVygbcSM/fJaFIJJ8wtxIbISwspVapgvqWtzg1iCHr
         K4cv8mi0gfXwX50KO+2KjCxka9FXB5JS/mAbjx1bYdemSXDm6pkQ03hdfRwLwjOwNbE9
         t5aX6fU+xvK0WigrArVwLQqDinquPXFahbuZSoETGywmsy9OuIqeWp2aObZV621qi6SJ
         iDbg==
X-Forwarded-Encrypted: i=1; AJvYcCUmdeWq98LKxCeFVfmSS7k34gA9WGEsTHxUuPfo+Nib97gL01xluTeIraHgQrl/IfkpC1ogsMA7QQvwfheWthOwLbcR9Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxpx2JDDNyTETry8yAe2Dh7HhH0M5z/90FQVaJqZdZY6IM/BqyT
	Gf6+PJ51spO1Q6XOlwoVY3707EwVv2YctAV1tYGaaQ44hiej6bdxXE1s
X-Gm-Gg: ASbGncs+kx/psvQS6xeUbIQm1hb72f90Zw06p90PkperLllYoBTnZf6cWyMS+dCkC/K
	xcaCldglSwQDNySlbsVyRcBo4r7P4hp8/QXKjlJ+jGNd3B+WBiB78x0+EMa8IWWa6CEVxbfxu8M
	zR8kGkY533lHU7epoTaSr24BKJRlVsqfIipRqUtBhBkNfh06bXLx1d2AyCYJx1s4B7gZp4fUZTq
	uAi7zqTfi5jf2N5V4vZt53U2ZCRRvwFLWo39vQ9OU/HNrDIarPTxLpHuefxdHtV1Jt+7Sc/PCZu
	4yMeF5P68WgaRvJ4BtfXNNg9Ixk7VCQ4fT9XKbONAX0/uEjYWD7mITZ6MqQeP2QR0iTbAGRgHie
	hDyYyHk8rgllIK9qNMhfWEHmXZkJC7GTLtW0Ghy1bmfOebDNhRZyx7JlVL2oR7WPHHECXiO2/ST
	2CGIggZCEtaPicJOtgk1J6IkDy0ATXFg==
X-Google-Smtp-Source: AGHT+IFT6Akj8U+/fFusx2rop6IZ68mcqncMokm0DZX3RkEiNJb7fAdqG7Sl0CHQ1h6bv2pXck96VA==
X-Received: by 2002:a05:6a00:a464:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7e1730a6f68mr1325466b3a.31.1764788217442;
        Wed, 03 Dec 2025 10:56:57 -0800 (PST)
Received: from [192.168.7.10] ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1518e5dacsm21036833b3a.23.2025.12.03.10.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 10:56:56 -0800 (PST)
Message-ID: <d2dfa83a-80e3-4a89-b853-a88589ef0092@gmail.com>
Date: Thu, 4 Dec 2025 00:26:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: Fix dead link to Keystone DSP
 GPIO binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203180337.50831-1-sohammetha01@gmail.com>
 <aab83a61-9d22-443c-92bc-d7caf1c8afac@kernel.org>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <aab83a61-9d22-443c-92bc-d7caf1c8afac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for the feedback.

On 04/12/25 00:05, Krzysztof Kozlowski wrote:
> On 03/12/2025 19:03, Soham Metha wrote:
>> The old text binding 'gpio-dsp-keystone.txt' was replaced by a DT schema in
>> commit aff0a1701b020c8e6b172f28828fd4f3e6eed41a
> 
> Did you actually read what I asked? I think you just sent it too fast to
> be able to read entire multi-page document. If you read it, you would
> see that abbrev is 12 characters/digits.
> 

I did see the documentation mention that the abbreviation should use 
at least 12 characters, but I didn’t notice any upper limit mentioned 
in the text. Because of this wording, I assumed longer values were 
acceptable.

Should I send a v3 with a 12-character abbreviation?

>> ("dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema").
>>
>> Update the reference to point to the new file.
> 
> This wasn't here before, no need to add obvious statements.
> 
> Best regards,
> Krzysztof

--
Soham
