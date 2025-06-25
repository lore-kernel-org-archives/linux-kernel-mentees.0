Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D31F5849
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Jun 2025 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834098; cv=none; b=RftDlcjaPD0qpfiYwFZTaU7OdWqJq9M6zGiCudCJbaO7BR+Br1wM/rjaW8NEJz7fh/Sn1jHWxS2ThKkzGWyfPZj6c5tdZDTHDRH/VnvQjuw62Calcg2yrjDU19QEMsI1tHNXyFJbHvrXb/Z4s86AVHNxtrlUO+DNQ4l8ny+4a+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834098; c=relaxed/simple;
	bh=1S+vYDbLA0s2WG1o/HuAVK1qLit0osUBrErElzDk2/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enVGC/coQJti9/eyAlf5Dl4h9kL850demvo2ZAsJXEQ9LBNpDOIKnM5Brl8XRCvPvkrr3iGX+e5UgcLSOsjCBaQk713WmKy/slDhzEyS7GzROcGeNquSXJC+THtzeNuCKgOQJi9c5jNgF5kSgtN2DLF21BPvGsRTkdA4C5qSphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owxv0wBe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owxv0wBe"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e98f73850so5370077e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750834095; x=1751438895; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjyRtilrvcm2L/AXtGRLJufhbX/zHrNcNL/3/DavrS8=;
        b=Owxv0wBeHS7rcgIMBn9N79KzQVp3dLqfaS2IewizilnCPmCmeN/uWwAn9jpD8VBn0s
         zPUmj09gUXbcbGnQp66SOSyfq6TN5PUQI1nKYnPEN52+DneuH1BKHzC5LsD7hAoX+ccm
         PwKVwPOCumsrcVlMnKOwV537xMNWgJxC9YeQ3ZZf9KRkh1KPS84rU/Ln2VNvsthaNZB1
         V/ic7YbSW66ZeOGxQ8YKDuJEGxm4YGuMx5oGlTArthZxAlpc3vRrmywgULAgn6tjfMoa
         jLL7XOCLjuDRCcRsBkNsHTz/Dsuja0friPNPFhX3Yu3QKBMucdaWCOKh//WG68T/Cd52
         dTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834095; x=1751438895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjyRtilrvcm2L/AXtGRLJufhbX/zHrNcNL/3/DavrS8=;
        b=gyZ977f+hMWJwBo9tfqsV+sNUejoOqFez5A1UU5PNE8JhB8sK2DW4SYCnmVYqe4NJL
         HCTfMQS4837iFoB0FXh4TrMMvG+w914/d2vR3BRWTxHE0jf9aTisZV2aC7eWb4dkeB5W
         iHvbn7y9i7M62bOSpQ9hYJBHYKPHck6Kge7RFeHPr/0615EqWqNueRhpDh5VPW8nzDa8
         k4RUNbuksDcJe9/ha/CiadodJ9e3FezdHi4F4JKQ2VjznSfZVJcI7XJsRtygSXCNiQVJ
         x2gMkRJYTOAy3R7aWgwdrtChjzsA/YjTLg2RDF7/LcCvkZr3oXurOs8QATAIaP9wICqN
         W3rA==
X-Forwarded-Encrypted: i=1; AJvYcCU2iTsOUS1Aso8RoNOXeu3rOnjHlCDwYfE+gkF6Knl1LO17/cpnoQj51zsf0BSp8cKNAj1wU0C0GN1iQc1KKkbtjtMA1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/CRywfrldEydeURa26jE2Id1rC7+kAwRhoj2q43Aeem10+5rC
	JFmyV9speqnnJs/XCvQseJ1YVpKTAv5EtjRxZ1c3udUjchROKh0tUtV/
X-Gm-Gg: ASbGncvkhiXYrmkWvkNLRVXBEme/aZTtahsRXVobkBOJX3prwL9XoaxuDsJB9zhJDUP
	UiQ7bfP2vcAeTwxcfo7pxcN819ZtJNI0kMPlIhnswFjR8OORAP7+I4KYzvk45otcaoq36w5Wy/V
	KkJEBBIcAtyJ8Q/FlS4G1r9t02uIjOL66ATi6CK5d3OvamHXw7z4cCwl5PUTnt/8/0eOJvzHKL+
	nnFh3SVXZ87op1MuU95VP7kuxajQmZInrBkrxu20SC3C779sbBKDqeNqxDN/g/r1XO4yG83vL/Z
	Qf9klvRGQzmNPdl4oggrQU0EG87LkyhYrybTFRXqqgSu8lx/t5RtyGROG5ShmQbi1BUIeHwg5i4
	GlCgxGghjqgYdWsARr5uohMZuyajM8+S08fDB6dhvCQkuBMldWFXXpCF8J+PVtf0kTsjBh7lkMo
	RpQe5w7FlpDfpXR45ElkjoR+B+YqsEOFWox/M=
X-Google-Smtp-Source: AGHT+IF/vlkFOWlLSTtvWsBVj8DxXv4ulk5QjgKHzBr4J5t5dfEhRd96ljhSekQ87pmkR0ybuy8Qrg==
X-Received: by 2002:a05:6512:3e1f:b0:553:a60d:6898 with SMTP id 2adb3069b0e04-554fde5873fmr509004e87.45.1750834094964;
        Tue, 24 Jun 2025 23:48:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:5c31:3ecd:351c:36bc? (2001-14ba-6e-3100-5c31-3ecd-351c-36bc.rev.dnainternet.fi. [2001:14ba:6e:3100:5c31:3ecd:351c:36bc])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc36sm2077343e87.94.2025.06.24.23.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 23:48:13 -0700 (PDT)
Message-ID: <88c6b6ad-d867-4db5-9893-0c8cb4a7eaee@gmail.com>
Date: Wed, 25 Jun 2025 09:48:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] docs: Improve grammar, formatting in Video4Linux
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, hljunggr@cisco.com, ribalda@chromium.org,
 hverkuil@xs4all.nl, skhan@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250612172703.32293-1-hannelotta@gmail.com>
 <20250612172703.32293-2-hannelotta@gmail.com>
 <aFqKRyntONqsxJSs@valkosipuli.retiisi.eu>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aFqKRyntONqsxJSs@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 6/24/25 14:21, Sakari Ailus wrote:
> Thanks for the patch. Documentation patches should have "Documentation: "
> prefix, similarly all media tree patches should have "media: " prefix. Also
> the lines may be up to 75 characters long.
> 
> The result is:
> 
> -----8<----------
> media: Documentation: Improve grammar, formatting in Video4Linux
> 
> Fix typos, punctuation and improve grammar and formatting in documentation
> for Video4Linux (V4L).
> -----8<----------
> 
> I changed this while applying the patch.
> 

Great, thank you! And thank you for the guidance, I have updated my 
notes for future reference.

Best regards / Ystävällisin terveisin

Hanne-Lotta Mäenpää


