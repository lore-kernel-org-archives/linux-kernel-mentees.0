Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF444A2D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291026; cv=none; b=sWDMCbbxuBkA4xRqO2D9QYijNw6lJHx+/dezOmr5ID9CCm+kfBY2eHclpbXAtyMilq5HL789RiYQCvKav4zJDS7sKdC7xEWML+zonN9Nhk+JzKudEGEd1O5ATNoMOHC4iARQX7XNn0FrWsoY/AfyFRQ43kWBPr/oJtY+CjRbewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291026; c=relaxed/simple;
	bh=+6BRoM2/WXB05O0ZhT3DqDkDWPn5rCY/4zpmHwarQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofJCyGk6kus7xo6eeJwR23FvbABffBIgPYecHWVaZgPp3drjmKtOdJ7UKGwdkxhdFzuMbavV3EtH87FeIbJMs9cSxyYUCDMa6H0FyVyA8TLCADrEd0vaMEz8Km7TTwYgp7KG1Atf+vFVQSUnDwgnAZow6gkcAt+Lb8XYn+ol41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtzyjzar; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtzyjzar"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso15829315e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748291023; x=1748895823; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7+gUcKKexaxy5novFqIZxIAX0ITBngrhPCqKSxeyIA=;
        b=mtzyjzarMQrBT1sDCCFf+CaL5PEOQNaz0tSB8jXFaoj/7DUVjap60GqBoqPb8Egta7
         LMkQ4/Yz84E+PHfyL44GGzQQS70+rgD7ly3N+rhtQKSLlmIsgtdp0TYyakCL02S/WljF
         2gkkSOwunj26WkTGwdscJa17TE5u3aKNwKgSjm50q2heNAQSfnbriErUrhqShPvGHu3A
         1nZ2uuJOdmVk9tvpCZmgytsbw9XsnvcOywXXgC4F5BJnbuHOKng13wKy80Ktro2H0IGB
         /PLU+QW9Z87GEXx8b9cStrKaUX2mqvq09rUtkEKwJCVlH4gKjpI43qJLeuLvdSXCy5DP
         QnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748291023; x=1748895823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7+gUcKKexaxy5novFqIZxIAX0ITBngrhPCqKSxeyIA=;
        b=dNNN9zqPsYtFZKOVrxvddmSdPra1SZh5n+s8AdYEwDu8g5o/B95zu/7cGF7mZne5M3
         PMcdNA7AIC6A3/dA5n/BZ2QSEMW6WmL/EQWgUuj1QCKJmADKz/Td+rBAettuOkkZ+RNV
         w7n3KSKDtEbPrsPab8lZK7g441r3A17dCWqHK5XjVAuN0DKAcuMtD42Cr13661UvHsoo
         zZA2VTRwtSAo+dnu1JqLXrbIqkRSEuX/05kqSN+lsV2REPOW3iI/18G0VHESslPN7Q+h
         jjG3t+e34UwKlQKsa/103p3jn1wcsFMng/Kuxc1mwtuBe46aEroBlgX5tZqPFxPb8z9V
         ZzWg==
X-Forwarded-Encrypted: i=1; AJvYcCXSsPBdOt4XsynDv9WlVPLA0xYCame+UfiZ+iO0veBEz+fmpc070a+2DEZ7vJ7QFrcYhGFIvnk0L4lHN/hZgrGo14WelA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMgBhfot/4gNUl1G5Z1RTpVSQONe/HmkPrRDO1EqI83HXeq7OJ
	MS15XNo8DX/hl/en8WoP70hMEYodT9iAFgxo1Jf2cfBYi3Cx/mGnUnmU
X-Gm-Gg: ASbGnct02iyfL/xUbqYwVfFKw/Nu+VH2QvUA3uLzdY3HLw+ayjsg/qUr54utgxv3f6H
	7sKyH5xd6vGmcjrWyZICshCSNZxmbbtdDq6q8UC5Y3fjd7Ht+Zx6q2BcH1uKL+V6bNx5rXBvoAL
	oORk/cDKU7BbROxUl+En4JdWPTF22FTXDazUPtzG2sbhZVUQyF8Ddfc85jKkPRg48YBc655x70Z
	OPMHGDooGxfUZi/Fk2LzNyAQGEHub56kDY//HzNV3BVYAb8ATP0bV7Ipg/LmL2gYx/gdmKfn14N
	YJS1bnPofbsJVEkNuN26ogSTe/8Lc50VaS1ltYdV33N95cwsUFxYqLNOxeaMOnq1L7RYlDxG2G6
	JkfY=
X-Google-Smtp-Source: AGHT+IFZTWjswAKPy+IU0hlmiBXBclD4o7fhR3ZoHwVNe9Sl7RasJ8jOpeu5CcVSK0cpxpF4k1GPsw==
X-Received: by 2002:a05:6000:2401:b0:3a4:dd63:4ad2 with SMTP id ffacd0b85a97d-3a4dd634c14mr2939557f8f.37.1748291023340;
        Mon, 26 May 2025 13:23:43 -0700 (PDT)
Received: from [192.168.1.46] ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm8737719f8f.11.2025.05.26.13.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:23:42 -0700 (PDT)
Message-ID: <4c4ff0ea-509a-4e33-b5b5-ddf6e7213474@gmail.com>
Date: Mon, 26 May 2025 23:23:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: escape literal asterisk to fix reST emphasis
 warning
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, corbet@lwn.net, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
 <aDTCdQNUN4Zlw2jJ@casper.infradead.org>
Content-Language: en-US
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
In-Reply-To: <aDTCdQNUN4Zlw2jJ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 10:35 pm, Matthew Wilcox wrote:
> On Mon, May 26, 2025 at 09:43:59PM +0300, Khaled Elnaggar wrote:
>> Escaped a literal '*' character in symbol-namespaces.rst to prevent
>> a Docutils warning about unmatched emphasis markers during documentation build.
> 
> I don't think this is the right way to fix this problem.  We want
> the test to work in both rendered and un-rendered form.  I think
> we can do something like:
> 
> -For example:
> +For example::
> 
> to turn it into a block that is rendered literally.  See
> 
>                 For example::
> 
>                   echo $((100 * `cat active_duration` / `cat connected_duration`))
> 
> as an example in Documentation/ABI/stable/sysfs-bus-usb
> 
>>  For example:
>>
>> -  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
>> +  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-\*")
>>
>>  will limit usage of this symbol to modules whoes name matches the given
>>  patterns.
>> --
>> 2.47.2
>>
>>

That even looks better in rendered, (::) are actually so prevalent I don't know
how I did not see it before. I will send v2, thank you for the proper fix.

